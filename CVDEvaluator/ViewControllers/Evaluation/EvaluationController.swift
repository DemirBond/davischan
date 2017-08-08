//
//  EvaluationController.swift
//  CVDEvaluator
//
//  Created by IgorKhomiak on 2/3/17.
//  Copyright © 2017 IgorKhomiak. All rights reserved.
//
//  Updated by EvrimGuler 4/5/2017, 5,17/2017

import UIKit
import SwiftyJSON
import NVActivityIndicatorView


class EvaluationCell: UITableViewCell {
	
	@IBOutlet weak var titleLabel: UILabel!
	@IBOutlet weak var descriptionLabel: UILabel!
	@IBOutlet weak var icon: UIImageView!
	
	var cellModel: EvaluationItem! {
		didSet{
			if cellModel != nil {
				setupCell()
			}
		}
	}
	

	func setupCell() {
		
		self.titleLabel?.textColor = CVDStyle.style.defaultFontColor
		self.titleLabel?.font = CVDStyle.style.currentFont
		
		if cellModel.form.status == .valued {
			self.icon?.image = UIImage(named: "FullIcon")
		} else if cellModel.form.status == .viewed {
			self.icon?.image = UIImage(named: "HalfIcon")
		} else if cellModel.form.status == .locked {
			self.icon?.image = UIImage(named: "lock")
		} else {
			self.icon?.image = nil
		}
	}
}


class EvaluationController: BaseTableController, NVActivityIndicatorViewable {
	
	weak var shortcutModel: EvaluationItem?
	override var createdID: String! { return "evaluation" }
	
	var activityIndicatorView: UIActivityIndicatorView!
	
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		// adding activity indicator in the background of TableViewer
		activityIndicatorView = UIActivityIndicatorView(activityIndicatorStyle: UIActivityIndicatorViewStyle.gray)
		tableView.backgroundView = activityIndicatorView
		
		if self.navigationItem.leftBarButtonItem == nil {
			self.navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "backIcon"),
			  style: .plain, target: self, action: #selector(self.leftButtonAction(_:)))
		}
		
	}
	
	
	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		
		self.navigationController?.setToolbarHidden(false, animated: false)
		
		checkAndUpdateLocks()
		shortcutModel = DataManager.manager.evaluation!.heartSpecialistManagement
		self.tableView.reloadData()
		
	}
	
	
	override func viewWillDisappear(_ animated : Bool) {
		super.viewWillDisappear(animated)
		
		DataManager.manager.saveCurrentEvaluation()
	}

	
	private func lockItems(array: [EvaluationItem]) {
		for item in array {
			item.form.status = .locked
		}
	}
	
	
	private func unlockItems(array: [EvaluationItem]) {
		for item in array {
			if item.form.status == .locked {
				item.form.status = .open
			}
		}
	}
	
	
	private func checkAndUpdateLocks() {
		let model = DataManager.manager.evaluation!
		model.completeScreen()
		
		unlockItems(array: [model.symptoms, model.physicalExam, model.reviewOfSystem, model.cvProfile, model.riskFactors,
			model.surgicalRisk, model.laboratories, model.diagnostics, model.nsr])
		
		switch model.evaluationStatus {
			case .initialized:
				lockItems(array: [model.symptoms, model.physicalExam, model.cvProfile, model.reviewOfSystem, model.riskFactors,
				                  model.surgicalRisk, model.laboratories, model.diagnostics, model.nsr])
			
			case .bioCompleted:
				lockItems(array: [model.surgicalRisk, model.laboratories, model.diagnostics, model.nsr])
			
			case .riskCompleted:
				()
			/*	lockItems(array: [model.nsr])
			
			case .diagnosticCompleted, .therapieCompleted:
				()
			*/
			default:
				()
		}
		
		self.tableView.reloadData()
	}
	
	
	func backButtonConfirmAlert(){
		
		let alertTitle: String = "Do you want to leave this evaluation?".localized
		
		var actions = [CVDAction] ()
		
		actions.append(CVDAction(title: "Leave".localized, type: CVDActionType.cancel, handler: {
			self.navigationController?.popViewController(animated: true)
		}, short: true))
		
		actions.append(CVDAction(title: "Stay".localized, type: CVDActionType.cancel, handler: nil, short: true))
		
		self.showCVDAlert(title: alertTitle, message: nil, actions: actions)
	}
	
	
	
	// MARK: - Override Actions
	
	override func leftButtonAction(_ sender: UIBarButtonItem) {
		backButtonConfirmAlert()
	}
	
	
	override func bottomRightButtonAction(_ sender: UIBarButtonItem) { // Compute Evaluation
		
		let model = DataManager.manager.evaluation!
		
		let alertTitle = "Cannot open output screen".localized
		
		if DataManager.manager.evaluation!.evaluationStatus == .initialized {
			let cancelAction = CVDAction(title: "Cancel".localized, type: CVDActionType.cancel, handler: nil, short: false)
			
			let storyboard = UIStoryboard(name: "Medical", bundle: nil)
			let alertDescription = "Please fill out the Bio form first".localized
			let handler1 = {() in
				if let controller = storyboard.instantiateViewController(withIdentifier: "BioControllerID") as? BioController {
					controller.pageForm = model.bio
					self.navigationController?.pushViewController(controller, animated: true)
				}
			}
			
			let navigateAction = CVDAction(title: "Open ".localized + model.bio.title, type: CVDActionType.done, handler: handler1, short: false)
			self.showCVDAlert(title: alertTitle, message: alertDescription, actions: [navigateAction, cancelAction])
			
		} else if DataManager.manager.evaluation!.evaluationStatus == .bioCompleted  {
			let alertDescription = "Please fill out the form \(model.cvProfile.title) or \(model.riskFactors.title)"
			showAlert(title: alertTitle, description: alertDescription, models: [model.cvProfile, model.riskFactors])
			
		}
		
		// Removed because of task CVD-220 [IOS] Unable to compute evaluation
		/*
		else if DataManager.manager.evaluation!.evaluationStatus == .riskCompleted {
			let alertDescription = "Please fill out the form \(model.diagnostics.title)"
			showAlert(title: alertTitle, description: alertDescription, models: [model.diagnostics])
			
		} else if DataManager.manager.evaluation!.evaluationStatus == .diagnosticCompleted {
			let alertDescription = "Please fill out the form \(model.nsr.title)"
			showAlert(title: alertTitle, description: alertDescription, models: [model.nsr])
			
		}*/

		else {
			
			// self.navigationController?.view.addSubview(whiteView!)
			
			self.startAnimating(CGSize(width:80, height:80), message: nil, messageFont: nil, type: NVActivityIndicatorType.ballPulse, color: UIColor(palette: ColorPalette.white), padding: nil, displayTimeThreshold: nil, minimumDisplayTime: nil, backgroundColor: NVActivityIndicatorView.DEFAULT_BLOCKER_BACKGROUND_COLOR, textColor: nil)
			
			// convert pah as false if we are not in the HMS section
			DataManager.manager.setPAHValue(pah: false)
			
			if DataManager.manager.isEvaluationChanged() {
				let client: RestClient = RestClient.client
				let inputs = DataManager.manager.getEvaluationItemsAsRequestInputsString()
				let evaluation = EvaluationRequest(isSave: false, age: Int((model.bio.age.storedValue?.value)!)!, isPAH:String(DataManager.manager.getPAHValue()), name: "None", gender: model.bio.gender.female.isFilled ? 2:1, SBP: Int((model.bio.sbp.storedValue?.value)!)!, DBP: Int((model.bio.dbp.storedValue?.value)!)!, inputs: inputs)
				print("PAH:\t" + evaluation.isPAH + "\t Inputs:\t " + evaluation.inputs)
				
				client.computeEvaluation(evaluationRequest: evaluation, success: { (response) in print(response)
					
					let result = DataManager()
					result.setOutputEvaluation(response: response)
					
					let storyboard = UIStoryboard(name: "Medical", bundle: nil)
					let controller = storyboard.instantiateViewController(withIdentifier: "GeneratedControllerID") as! GeneratedController
					controller.pageForm = DataManager.manager.evaluation!.outputInMain
					
					self.navigationController?.pushViewController(controller, animated: false)
					// self.navigationController?.present(controller, animated: true, completion: nil)
					
					// self.whiteView?.removeFromSuperview()
					
					self.stopAnimating()
					
					self.tableView.setNeedsLayout()
					self.tableView.layoutIfNeeded()
					self.tableView.estimatedRowHeight = 40
					self.tableView.rowHeight = UITableViewAutomaticDimension
					self.tableView.sizeToFit()
					self.tableView.reloadData()
					
					// add pah value false
					DataManager.manager.setPAHValue(pah: false)
					
				}, failure: { error in print(error)
					
					var actions = [CVDAction] ()
					var alertTitle: String?
					var alertDescription : String?
					actions.append(CVDAction(title: "OK".localized, type: CVDActionType.cancel, handler: nil, short: true))
					alertTitle = "Network Connection".localized
					alertDescription = "Check network connection before computing the evaluation.".localized
					
					// self.whiteView?.removeFromSuperview()
					
					self.stopAnimating()
					
					self.showCVDAlert(title: alertTitle!, message: alertDescription, actions: actions)
					
				})
			}
			else {
				let storyboard = UIStoryboard(name: "Medical", bundle: nil)
				let controller = storyboard.instantiateViewController(withIdentifier: "GeneratedControllerID") as! GeneratedController
				controller.pageForm = DataManager.manager.evaluation!.outputInMain
				
				self.navigationController?.pushViewController(controller, animated: true)
				// self.navigationController?.present(controller, animated: true, completion: nil)
				
				// self.whiteView?.removeFromSuperview()
				
				self.stopAnimating()
				
				self.tableView.setNeedsLayout()
				self.tableView.layoutIfNeeded()
				self.tableView.estimatedRowHeight = 40
				self.tableView.rowHeight = UITableViewAutomaticDimension
				self.tableView.sizeToFit()
				self.tableView.reloadData()
				
				DataManager.manager.setPAHValue(pah: false)
			}
		}
		
	}
	
	
	@IBAction func unwindToEvaluation(segue: UIStoryboardSegue) { /* return to this point after press list icon*/ }
	
	
	func showAlert(title: String, description: String?, models: [EvaluationItem]) {
		
		var alertActions = [CVDAction] ()
		for item in models {
			let handler1 = createHandler(model: item, navigation: self.navigationController)
			let navigateAction = CVDAction(title: item.title, type: CVDActionType.done, handler: handler1, short: false)
			alertActions.append(navigateAction)
		}
		let cancelAction = CVDAction(title: "Cancel".localized, type: CVDActionType.cancel, handler: nil, short: false)
		alertActions.append(cancelAction)
		
		self.showCVDAlert(title: title, message: description, actions: alertActions)
		
	}
	
	
	private func showLockedScreenAlert(for item: EvaluationItem) {
		
		let model = DataManager.manager.evaluation!
		
		let alertTitle = "Cannot open form \(item.title)"
		
		if DataManager.manager.evaluation!.evaluationStatus == .initialized {
			let storyboard = UIStoryboard(name: "Medical", bundle: nil)
			let alertDescription = "Please fill out the Bio form first.".localized
			let handler1 = {() in
				if let controller = storyboard.instantiateViewController(withIdentifier: "BioControllerID") as? BioController {
					controller.pageForm = model.bio
					self.navigationController?.pushViewController(controller, animated: true)
				}
			}
			let cancelAction = CVDAction(title: "Cancel".localized, type: CVDActionType.cancel, handler: nil, short: false)
			let navigateAction = CVDAction(title: "Open " + model.bio.title, type: CVDActionType.done, handler: handler1, short: false)
			self.showCVDAlert(title: alertTitle, message: alertDescription, actions: [navigateAction, cancelAction])
			
		} else if DataManager.manager.evaluation!.evaluationStatus == .bioCompleted  {
			
			let alertDescription = "Please fill out the form \(model.cvProfile.title) or \(model.riskFactors.title)"
			showAlert(title: alertTitle, description: alertDescription, models: [model.cvProfile, model.riskFactors])
		}
			
		else if DataManager.manager.evaluation!.evaluationStatus == .riskCompleted {
			let alertDescription = "Please fill out the form \(model.diagnostics.title)"
			showAlert(title: alertTitle, description: alertDescription, models: [model.diagnostics])
			
		} else if DataManager.manager.evaluation!.evaluationStatus == .diagnosticCompleted {
			let alertDescription = "Please fill out the form \(model.nsr.title)"
			showAlert(title: alertTitle, description: alertDescription, models: [model.nsr])
		}
		
	}
	
	

	// MARK: - UITableView DataSource
	
	override func numberOfSections(in tableView: UITableView) -> Int {
		return 1
	}
	
	
	override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return DataManager.manager.evaluation!.items.count
	}
	
	
	
	// MARK: - UITableView Delegates
	
	override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		
		let cell = tableView.dequeueReusableCell(withIdentifier: "EvaluationCell", for: indexPath) as! EvaluationCell
		let itemModel = DataManager.manager.evaluation!.items[indexPath.row]
		cell.titleLabel.text = itemModel.title
		cell.selectionStyle = .gray
		cell.cellModel = itemModel
		if indexPath.row == 0 {
			DataManager.manager.evaluation!.bio.form.status = .open
		}
		itemModel.processStatus()
		cell.setupCell()
		
		return cell
	}
	
	
	override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		let itemModel = DataManager.manager.evaluation!.items[indexPath.row]
		
		let storyboard = UIStoryboard(name: "Medical", bundle: nil)
		
		switch indexPath.row {
			case 0:
				let controller = storyboard.instantiateViewController(withIdentifier: "BioControllerID") as! BioController
				controller.pageForm = itemModel
				self.navigationController?.pushViewController(controller, animated: true)
		
			default:
				if itemModel.form.status == .locked {
					showLockedScreenAlert(for: itemModel)
				} else {
					let controller = storyboard.instantiateViewController(withIdentifier: "GeneratedControllerID") as! GeneratedController
					controller.pageForm = itemModel
					self.navigationController?.pushViewController(controller, animated: true)
				}
		}
	}
	
	
	override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
		let itemModel = DataManager.manager.evaluation!.items[indexPath.row]
		return itemModel.calculateCellHeight(forWidth: self.view.frame.size.width)
	}
	
	
	override func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
		
		let view = UIView(frame: CGRect(x: 0, y: 300, width: self.view.bounds.width, height: 300) )
		
		let button = UIButton(frame: CGRect(x: 50.0, y: 500.00, width: 300.00, height: 100.00))
		button.titleLabel?.text = "Compute"
		button.tintColor = UIColor.purple
		
		view.addSubview(button)
		
		return view
		
	}
	
}
