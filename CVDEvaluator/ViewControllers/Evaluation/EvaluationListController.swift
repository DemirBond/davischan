//
//  EvaluationListController.swift
//  CVDEvaluator
//
//  Created by IgorKhomiak on 2/3/17.
//  Copyright © 2017 IgorKhomiak. All rights reserved.
//

import UIKit
import Foundation
import CoreData
import NVActivityIndicatorView
import Alamofire


class EvaluationListCell: UITableViewCell {
	@IBOutlet weak var titleLabel: UILabel!
	@IBOutlet weak var icon: UIImageView!
	@IBOutlet weak var createdLabel: UILabel?
	@IBOutlet weak var modifiedLabel: UILabel?
	@IBOutlet weak var descriptionLabel: UILabel?
}


class SavedListCell: EvaluationListCell {
	
}


class EvaluationListController: BaseTableController, NVActivityIndicatorViewable {
	
	static let fromListEvaluationSegueID = "fromListEvaluationSegueID"
	
	override var createdID: String! { return "evaluationList" }
	
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		self.navigationItem.rightBarButtonItem = self.editButtonItem
	}
	
	
	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		
		DataManager.manager.evaluation = nil
		
		self.navigationController?.setToolbarHidden(true, animated: false)
		
		if NetworkReachabilityManager()!.isReachable {
			self.startAnimating()
			
			let completionHandler = { [unowned self] (data : String?, error: NSError?) -> Void in
				self.stopAnimating()
				
				if data == "success" {
					DispatchQueue.main.async {
						DataManager.manager.fetchEvaluations()
						self.tableView.reloadData()
					}
				}
				else {
					//print("Could not fetch \(String(describing: error))")
				}
			}
			
			DispatchQueue.global().async {
				DataManager.manager.fetchEvaluationsFromRestAPI(completionHandler: completionHandler)
			}
			
		}
		else {
			DataManager.manager.fetchEvaluations()
			self.tableView.reloadData()
		}
	}
	
	

	// MARK: - UITableView DataSource
	
	override func numberOfSections(in tableView: UITableView) -> Int {
		return 1
	}
	
	
	override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		let num = DataManager.manager.patients?.count
		return 1 + ((num != nil) ? num! : 0)
	}
	
	
	
	// MARK: - UITableView Delegates
	
	override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		
		if indexPath.row  == 0 {
			
			let cell = tableView.dequeueReusableCell(withIdentifier: "EvaluationListCell", for: indexPath) as! EvaluationListCell
			cell.titleLabel.text = "New Evaluation".localized
			cell.descriptionLabel?.text = "Create a new evaluation".localized
			cell.icon.image = UIImage(named: "clipboard")
			return cell
		
		} else {
			let patient = DataManager.manager.patients![indexPath.row - 1]
			let cell = tableView.dequeueReusableCell(withIdentifier: "SavedListCell", for: indexPath) as! SavedListCell
			cell.titleLabel.text = patient.patientName
			
			cell.createdLabel?.text = patient.dateCreated
			cell.modifiedLabel?.text = (patient.dateModified != nil) ?  patient.dateModified! : "-"
			cell.icon.image = UIImage(named: "folder")
			return cell
		}
	}

	
	override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		
		if indexPath.row == 0 {
			DataManager.manager.evaluation = Evaluation()
			performSegue(withIdentifier: EvaluationListController.fromListEvaluationSegueID, sender: nil)
			
		} else {
			let patient = DataManager.manager.patients![indexPath.row - 1]
			
			if let evaluationID = patient.evaluationUUID, let _ = patient.evaluationData {
				if let _ = DataManager.manager.extractEvaluation(by: evaluationID) {
					performSegue(withIdentifier: EvaluationListController.fromListEvaluationSegueID, sender: nil)
					
				} else {
					//print("Error - identifier is empty")
				}
			}
			else {
				self.startAnimating()
				
				let completionHandler = { [unowned self] (data : String?, error: NSError?) -> Void in
					self.stopAnimating()
					
					guard error == nil else {
						//print("Server returned error \(String(describing: error))")
						UIAlertController.infoAlert(message: error!.userInfo["message"] as? String, title: "Cannot fetch".localized, viewcontroller: self, handler: {})
						return
					}
					
					if data == "success" {
						self.performSegue(withIdentifier: EvaluationListController.fromListEvaluationSegueID, sender: nil)
					}
					/*else {
						//print("Could not fetch \(String(describing: error))")
						
						var actions = [CVDAction] ()
						var alertTitle: String?
						actions.append(CVDAction(title: "OK".localized, type: CVDActionType.cancel, handler: nil, short: true))
						alertTitle = error?.domain
						
						self.showCVDAlert(title: alertTitle!, message: nil, actions: actions)
					}*/
				}
				
				DispatchQueue.global().async {
					DataManager.manager.fetchEvaluationByIDFromRestAPI(uuid: Int(patient.evaluationUUID!)!, completionHandler: completionHandler)
				}
			}
		}
	}
	
	
	override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
		return indexPath.row  == 0 ? 70.0 : 90.0
	}
	
	
	// Override to support conditional editing of the table view.
	override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
		return indexPath.row > 0
	}
	
	
	// Override to support editing the table view.
	override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
		if editingStyle == .delete {
			// Delete the row from the data source
			
			let evaluation = DataManager.manager.patients![indexPath.row - 1]
			
			self.startAnimating()
			
			DispatchQueue.global().async {
				RestClient.client.deleteEvaluationByID(uuid: Int(evaluation.evaluationUUID!)!, success: { (response) in print(response)
					
					self.stopAnimating()
					
					tableView.beginUpdates()
					tableView.deleteRows(at: [indexPath], with: .fade)
					DataManager.manager.deleteEvaluation(at: indexPath.row - 1)
					tableView.endUpdates()
					
				}, failure: { error in print(error)
					
					self.stopAnimating()
					
					UIAlertController.infoAlert(message: error.localizedDescription, title: "Failed to delete evaluation".localized, viewcontroller: self, handler: {})
					
					/*var actions = [CVDAction] ()
					var alertTitle: String?
					actions.append(CVDAction(title: "OK".localized, type: CVDActionType.cancel, handler: nil, short: true))
					alertTitle = "Failed to delete evaluation".localized
					
					self.showCVDAlert(title: alertTitle!, message: nil, actions: actions)
					*/
				})
			}			
		}
	}
	
	
	// Override to support rearranging the table view.
	override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
		tableView.beginUpdates()
		let model = DataManager.manager.patients!.remove(at: fromIndexPath.row-1)
		DataManager.manager.patients!.insert(model, at: to.row-1)
		tableView.endUpdates()
	}
	
	
	// Override to support conditional rearranging of the table view.
	override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
		// Return false if you do not want the item to be re-orderable.
		return false //indexPath.row > 0 && HeartCheck.application.doctor!.evaluations.count > 1
	}
	
}
