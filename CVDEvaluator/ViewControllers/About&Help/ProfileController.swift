//
//  ProfileController.swift
//  CVDEvaluator
//
//  Created by IgorKhomiak on 3/16/17.
//  Copyright © 2017 IgorKhomiak. All rights reserved.
//

import UIKit


class ProfileController: BaseTableController {
		
	override var createdID: String! { return "profile" }
	
	
	required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
		
		self.pageForm = Profile(literal: General.doctorProfile)
	}
	
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		self.navigationController?.setToolbarHidden(true, animated: false)
		
		let profie = self.pageForm as! Profile
		let doctor = DataManager.manager.currentDoctor
		profie.name = doctor?.doctorName
		profie.email = doctor?.loginName
	}
	
	
	
	// MARK: - Actions
	
	@IBAction override func doneAction(_ sender: AnyObject) {
		hideKeyboard()
		self.submitAction(self)
	}
	
	
	@IBAction func submitAction(_ sender: AnyObject) {
		let profile = pageForm as! Profile
		
		let name = profile.name
		let mail = profile.email
		let password = profile.password
		
		hideKeyboard()
		
		guard validateEmail(mail: profile.email!) else {
			let alertController = UIAlertController(title: "The mail address is not valid".localized,
				message: "Email is used for authentication and communications.Please choose the correct mail address.".localized, preferredStyle: .alert)
			let defaultAction = UIAlertAction(title: "OK", style: .default, handler: nil )
			alertController.addAction(defaultAction)
			present(alertController, animated: false, completion: nil)
			
			return
		}
		
		if password != nil && password!.characters.count < General.minPasswordLength  {
			let alertController = UIAlertController(title: "The password is too short".localized,
				message: "Password must contain at least \(General.minPasswordLength) characters", preferredStyle: .alert)
			let defaultAction = UIAlertAction(title: "OK", style: .default, handler: nil)
			
			alertController.addAction(defaultAction)
			present(alertController, animated: false, completion: nil)
			
			return
		}
		
		if password != profile.repeatPassword  {
			let alertController = UIAlertController(title: "The repeat password doesn't match password".localized,
				message: "Please enter passwords again".localized, preferredStyle: .alert)
			let defaultAction = UIAlertAction(title: "OK", style: .default, handler: nil)
			
			alertController.addAction(defaultAction)
			present(alertController, animated: false, completion: nil)
			
			return
		}
		
		let handler = { [unowned self] (data : String?, error: NSError?) -> Void in
			
			guard error == nil else {
				let alertController = UIAlertController(title: "Cannot update your profile".localized,
					message: error!.userInfo["message"] as? String, preferredStyle: .alert)
				let defaultAction = UIAlertAction(title: "OK", style: .default, handler: nil )
				alertController.addAction(defaultAction)
				self.present(alertController, animated: false, completion: nil)
				return
			}
			
			if data == "success" {
				var actions = [CVDAction] ()
				actions.append(CVDAction(title: "OK".localized, type: CVDActionType.cancel, handler: {
					_ = self.navigationController?.popViewController(animated: true)
				}, short: false))
				let alertTitle = "Doctor's profile was successfully updated".localized
				self.showCVDAlert(title: alertTitle, message: nil, actions: actions)

			}
		}
		
		DataManager.manager.updateProfile(doctorName: name, loginName: mail, password: password, completionHandler: handler)
	}
	
	
	override func leftButtonAction(_ sender: UIBarButtonItem) {
		activeField?.resignFirstResponder()
		self.dismiss(animated: true, completion: nil)
	}
	
	
	
	//MARK: - EvaluationEditing protocol
	
	override func keyboardReturnDidPress(model: EvaluationItem) {
		hideKeyboard()
		self.submitAction(self)
	}
	
	
	
	// MARK: - Table view data source
	
	override func numberOfSections(in tableView: UITableView) -> Int {
		return 1
	}
	
	
	override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return self.pageForm.items.count + 1
	}
	
	
	
	// MARK: - Table view delegates
	
	override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		
		if indexPath.row < pageForm.items.count {
			let itemModel = pageForm.items[indexPath.row]
			
			let cellType = itemModel.form.itemType
			let cell = tableView.dequeueReusableCell(withIdentifier: cellType.reuseIdentifier(), for: indexPath) as! GeneratedCell
			cell.accessoryBar = self.accessoryBar
			cell.delegate = self
			cell.cellModel = itemModel
			cell.selectionStyle = .none
			
			if cellType ==  .textLeft || cellType ==  .mail || cellType ==  .password  {
				cell.textField?.borderStyle = UITextBorderStyle.none
			}
		
			return cell
		
		} else {
			let cellType = ItemType.custom
			let cell = tableView.dequeueReusableCell(withIdentifier: cellType.reuseIdentifier(), for: indexPath) as! CustomCell
			cell.cellModel = EvaluationItem()
			cell.delegate = self
			cell.selectionStyle = .none
			
			return cell
		}

	}
	
	
	override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
		if indexPath.row < pageForm.items.count {
			
			let itemModel = pageForm.items[indexPath.row]
			return itemModel.calculateCellHeight(forWidth: self.view.frame.size.width)
		
		} else {
			return 80.0
		}
	}

}
