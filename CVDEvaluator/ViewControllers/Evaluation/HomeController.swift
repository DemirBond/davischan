//
//  HomeController.swift
//  CVDEvaluator
//
//  Created by IgorKhomiak on 1/30/17.
//  Copyright © 2017 IgorKhomiak. All rights reserved.
//

import UIKit
import NVActivityIndicatorView
import Alamofire


class HomeController: BaseController, NVActivityIndicatorViewable {
	
	@IBOutlet weak var newEvaluationView: UIView!
	@IBOutlet weak var savedEvaluationsView: UIView!
	
	static let settingsSegueID = "settingsSegueID"
	static let newEvaluationSegueID = "newEvaluationSegueID"
	static let savedEvaluationSegueID = "savedEvaluationSegueID"
	
	override var createdID: String! { return "home" }
	
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		newEvaluationView.layer.cornerRadius = 4.0
		newEvaluationView.layer.borderWidth = 1.0
		newEvaluationView.layer.borderColor = UIColor.lightGray.cgColor
		newEvaluationView.clipsToBounds = true
		
		savedEvaluationsView.layer.cornerRadius = 4.0
		savedEvaluationsView.layer.borderWidth = 1.0
		savedEvaluationsView.layer.borderColor = UIColor.lightGray.cgColor
		savedEvaluationsView.clipsToBounds = true
		
		savedEvaluationsView.isHidden = true

	}
	
	
	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		
		self.navigationController?.setToolbarHidden(true, animated: false)
		
		if NetworkReachabilityManager()!.isReachable {
			
			self.startAnimating()
			
			DataManager.manager.fetchEvaluationsFromRestAPI { (success, error) -> (Void) in
				
				self.stopAnimating()
				
				if success != nil {
					
					DataManager.manager.fetchEvaluations()
				
					if DataManager.manager.hasSavedEvaluations() {
						self.savedEvaluationsView.isHidden = false
					}
					else {
						self.savedEvaluationsView.isHidden = true
					}
					
				}
				else {
					print("Could not fetch \(String(describing: error))")
				}
			}
		}
		else {
			
			DataManager.manager.fetchEvaluations()
			
			if DataManager.manager.hasSavedEvaluations() {
				self.savedEvaluationsView.isHidden = false
			}
			else {
				self.savedEvaluationsView.isHidden = true
			}
		}
	}
	
	
	override func viewDidAppear(_ animated: Bool) {
		super.viewDidAppear(animated)
		
		self.navigationItem.hidesBackButton = true
		
	}
	
	
	override func rightMenuButtonAction(_ sender: UIBarButtonItem) {
		performSegue(withIdentifier: HomeController.settingsSegueID, sender: nil)
	}
	
	
	@IBAction func newEvaluationAction(_ sender: Any) {
		DataManager.manager.evaluation = Evaluation()
		performSegue(withIdentifier: HomeController.newEvaluationSegueID, sender: nil)
	}
	
	
	@IBAction func savedEvaluationsAction(_ sender: Any) {
		performSegue(withIdentifier: HomeController.savedEvaluationSegueID, sender: nil)
	}
	
}
