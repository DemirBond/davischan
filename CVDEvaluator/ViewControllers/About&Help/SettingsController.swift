//
//  SettingsController.swift
//  CVDEvaluator
//
//  Created by IgorKhomiak on 2/7/17.
//  Copyright © 2017 IgorKhomiak. All rights reserved.
//

import UIKit


class SettingsController: BaseTableController {
	
	override var createdID: String! { return "settings" }
	
	static let aboutSegueID = "aboutSegueID"
	
	
	required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
		
		self.pageForm = Settings(literal: General.settings)
	}
	
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		self.title = pageForm.title
	}
	
	
	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)

		self.navigationController?.setToolbarHidden(false, animated: false)
		
	}
	
	
	func logoutAction() {
		let alertController = UIAlertController(title: "Are you sure to Log out?".localized, message: nil, preferredStyle: .actionSheet)
		let logoutAction = UIAlertAction(title: "Log Out", style: .default) { (UIAlertAction) in
			DataManager.manager.signOut()
			
			let mainStoriboard = UIStoryboard(name: "Main", bundle: nil)
			let destination = mainStoriboard.instantiateInitialViewController()
			
			UIApplication.shared.keyWindow?.rootViewController = destination

		}
		alertController.addAction(logoutAction)
		let defaultAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil )
		alertController.addAction(defaultAction)
		
		present(alertController, animated: true, completion: nil)

	}
	
	
	
	// MARK: - Table view data source
	
	override func numberOfSections(in tableView: UITableView) -> Int {
		return 1
	}
	
	
	override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return pageForm.items.count
	}
	
	
	
	// MARK: - Table view delegates
	
	override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		
		let itemModel = pageForm.items[indexPath.row]
		
		let cellType = itemModel.form.itemType
		let cell = tableView.dequeueReusableCell(withIdentifier: cellType.reuseIdentifier(), for: indexPath) as! GeneratedCell
		cell.accessoryBar = self.accessoryBar
		cell.delegate = self
		cell.cellModel = itemModel
		cell.selectionStyle = (cellType == .separator) ? .none : .gray
		
		return cell
	}

	
	override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		
		let storyboard = UIStoryboard(name: "Medical", bundle: nil)
		
		let settingsModel = pageForm as! Settings
		let itemModel = settingsModel.items[indexPath.row]
		
		switch itemModel.identifier {
			
			case settingsModel.about.identifier :
				let controller = storyboard.instantiateViewController(withIdentifier: "aboutController") as! BaseTableController
				controller.pageForm = itemModel
				self.navigationController?.pushViewController(controller, animated: true)
			
			case settingsModel.profile.identifier :
				let controller = storyboard.instantiateViewController(withIdentifier: "ProfileControllerID") as! ProfileController
				controller.pageForm = Profile(literal: General.doctorProfile)
				self.navigationController?.pushViewController(controller, animated: true)

			case settingsModel.privacyPolicy.identifier :
				let controller = storyboard.instantiateViewController(withIdentifier: "PoliciesControllerID") as! PoliciesController
				controller.pageForm = itemModel
				self.navigationController?.pushViewController(controller, animated: true)
			
			case settingsModel.termsOfUse.identifier :
				let controller = storyboard.instantiateViewController(withIdentifier: "TermsControllerID") as! TermsController
				controller.pageForm = itemModel
				self.navigationController?.pushViewController(controller, animated: true)
			
			case settingsModel.helpSupport.identifier :
				let controller = storyboard.instantiateViewController(withIdentifier: "HelpSupportControllerID") as! HelpSupportController
				controller.pageForm = itemModel
				self.navigationController?.pushViewController(controller, animated: true)

			case settingsModel.logOut.identifier :
				logoutAction()
			
			default:
				()
			
		}
		
		hideKeyboard()

	}
	
	
	override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
		let itemModel = pageForm.items[indexPath.row]
		return itemModel.calculateCellHeight(forWidth: self.view.frame.size.width)
	}

	
	/*
	// MARK: - Navigation
	
	// In a storyboard-based application, you will often want to do a little preparation before navigation
	override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
	// Get the new view controller using segue.destinationViewController.
	// Pass the selected object to the new view controller.
	}
	*/
	
}
