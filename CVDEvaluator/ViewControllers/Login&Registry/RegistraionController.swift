//
//  RegistraionController.swift
//  CVDEvaluator
//
//  Created by IgorKhomiak on 3/6/17.
//  Copyright © 2017 IgorKhomiak. All rights reserved.
//

import UIKit
import NVActivityIndicatorView


class RegistraionController: BaseTableController, NVActivityIndicatorViewable {
	
	static let verificationCodeSegueID = "verificationCodeSegueID"
	
	override var createdID: String! { return "registration" }
	
	
	required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
		self.pageForm = Registration(literal: General.registration)
	}

	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		self.title = pageForm.title
		
		let tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(LoginController.hideKeyboard))
		self.view.addGestureRecognizer(tapRecognizer)
	}
	
	
	
   // MARK: - Actions
	
	@IBAction override func doneAction(_ sender: AnyObject) {
		hideKeyboard()
		self.submitAction(self)
	}
	

	@IBAction func submitAction(_ sender: AnyObject) {
		let registration = pageForm as! Registration
		
		guard let name = registration.name, !name.isEmpty,
			let mail = registration.email, !mail.isEmpty,
			let password = registration.password, !password.isEmpty else {
				UIAlertController.infoAlert(message: "Please fill all required fields".localized, title: "The mail, username or password field is empty".localized, viewcontroller: self, handler: {} )
				
				return
		}
		
		guard validateEmail(mail: registration.email!) else {
			UIAlertController.infoAlert(message: "Email is used for authentication and communications.Please choose the correct mail address.".localized, title: "The mail address is not valid".localized, viewcontroller: self, handler: {} )
			
			return
		}
		
		guard password.characters.count >= General.minPasswordLength else {
			UIAlertController.infoAlert(message: "Password must contain at least \(General.minPasswordLength) characters", title: "The password is too short".localized, viewcontroller: self, handler: {} )
			
			return
		}
		
		guard password == registration.repeatPassword  else {
			UIAlertController.infoAlert(message: "Please enter passwords again".localized, title: "The repeat password doesn't match password".localized, viewcontroller: self, handler: {} )
			
			return
		}
		
		self.startAnimating()
		
		let handler = { [unowned self] (data : String?, error: NSError?) -> Void in
			
			self.stopAnimating()
			
			guard error == nil else {
				UIAlertController.infoAlert(message: error!.userInfo["message"] as? String, title: "Cannot sign up".localized, viewcontroller: self, handler: {} )
				
				return
			}
			
			if data == "success" {
				UserDefaults.standard.set(mail, forKey: "loginName")
				self.performSegue(withIdentifier: RegistraionController.verificationCodeSegueID, sender: nil)
			}
		}
		
		DataManager.manager.registerWith(doctorName: name, loginName: mail, password: password, completionHandler: handler)
	}
	
	
	override func leftButtonAction(_ sender: UIBarButtonItem) {
		activeField?.resignFirstResponder()
		self.dismiss(animated: true, completion: nil)
	}
	
	

	// MARK: - EvaluationEditing protocol
	
	override func keyboardReturnDidPress(model: EvaluationItem) {
		hideKeyboard()
		self.submitAction(self)
	}


	
	// MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
	
	
	override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return pageForm.items.count + 1
	}
	

	override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		
		if indexPath.row < pageForm.items.count {
			let itemModel = pageForm.items[indexPath.row]
			
			let cellType = itemModel.form.itemType
			let cell = tableView.dequeueReusableCell(withIdentifier: cellType.reuseIdentifier(), for: indexPath) as! GeneratedCell
			cell.accessoryBar = self.accessoryBar
			cell.delegate = self
			cell.cellModel = itemModel
			cell.selectionStyle = .none
			return cell
			
		} else {
			let cellType = ItemType.custom
			let cell = tableView.dequeueReusableCell(withIdentifier: cellType.reuseIdentifier(), for: indexPath) as! CustomCell
			cell.cellModel = EvaluationItem()
			cell.delegate = self
			return cell
		}
	}
	
	
	override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
		if indexPath.row < pageForm.items.count {

		let itemModel = pageForm.items[indexPath.row]
			return itemModel.calculateCellHeight(forWidth: self.view.frame.size.width)
		} else {
			return 72.0
		}
	}

}
