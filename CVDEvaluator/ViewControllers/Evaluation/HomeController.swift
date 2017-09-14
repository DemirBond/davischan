//
//  HomeController.swift
//  CVDEvaluator
//
//  Created by IgorKhomiak on 1/30/17.
//  Copyright © 2017 IgorKhomiak. All rights reserved.
//

import UIKit
import NVActivityIndicatorView


class HomeController: BaseController, NVActivityIndicatorViewable {
	
	@IBOutlet weak var newEvaluationView: UIView!
	@IBOutlet weak var savedEvaluationsView: UIView!
	
	static let profileSegueID = "profileSegueID"
	static let aboutSegueID = "aboutSegueID"
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
		
		//savedEvaluationsView.isHidden = true

	}
	
	
	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		
		self.navigationController?.setToolbarHidden(true, animated: false)
		
	}
	
	
	override func viewDidAppear(_ animated: Bool) {
		super.viewDidAppear(animated)
		
		self.navigationItem.hidesBackButton = true
		
	}
	
	
	override func rightMenuButtonAction(_ sender: UIBarButtonItem) {
		var actions = [MenuAction] ()
		actions.append(MenuAction(title: "Doctor's Profile".localized, handler: {
			self.performSegue(withIdentifier: HomeController.profileSegueID, sender: nil)
		}))
		actions.append(MenuAction(title: "About".localized, handler: {
			self.performSegue(withIdentifier: HomeController.aboutSegueID, sender: nil)
		}))
		actions.append(MenuAction(title: "Sign out".localized, handler: {
			let alertController = UIAlertController(title: "Are you sure to Sign out?".localized, message: nil, preferredStyle: .actionSheet)
			let logoutAction = UIAlertAction(title: "Sign out", style: .default) { (UIAlertAction) in
				DataManager.manager.signOut()
				
				let mainStoriboard = UIStoryboard(name: "Main", bundle: nil)
				let destination = mainStoriboard.instantiateInitialViewController()
				
				UIApplication.shared.keyWindow?.rootViewController = destination
				
			}
			alertController.addAction(logoutAction)
			let defaultAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil )
			alertController.addAction(defaultAction)
			
			self.present(alertController, animated: true, completion: nil)
		}))
		self.showDropMenu(actions: actions)
	}
	
	
	@IBAction func newEvaluationAction(_ sender: Any) {
		DataManager.manager.evaluation = Evaluation()
		performSegue(withIdentifier: HomeController.newEvaluationSegueID, sender: nil)
	}
	
	
	@IBAction func savedEvaluationsAction(_ sender: Any) {
		performSegue(withIdentifier: HomeController.savedEvaluationSegueID, sender: nil)
	}
	
}
