//
//  ResetAccountController.swift
//  CVDEvaluator
//
//  Created by IgorKhomiak on 2/7/17.
//  Copyright © 2017 IgorKhomiak. All rights reserved.
//

import UIKit
import MessageUI

class ResetAccountController: BaseController, UITextFieldDelegate, MFMailComposeViewControllerDelegate {
	
	@IBOutlet weak var submitLabel: UILabel!
	@IBOutlet weak var nameField: UITextField!
	
	override var createdID: String! { return "resetAccount" }
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		submitLabel.text = ""
		let tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(ResetAccountController.hideKeyboard))
		self.view.addGestureRecognizer(tapRecognizer)
	}
	
	
	func sendEmail(recipient: String, subject: String) {
		if MFMailComposeViewController.canSendMail() {
			let mail = MFMailComposeViewController()
			mail.mailComposeDelegate = self
			mail.setToRecipients([recipient])
			mail.setSubject(subject)
			
			present(mail, animated: true)
		} else {
			// show failure alert
		}
	}
	
	
	// MARK: - MFMailComposeViewController delegate
	
	func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
		controller.dismiss(animated: true)
	}

	// MARK: - Overridden Actions
	
	override func leftButtonAction(_ sender: UIBarButtonItem) {
		nameField.resignFirstResponder()
		self.dismiss(animated: true, completion: nil)
	}
	
	
	@IBAction func submitAction(_ sender: AnyObject) {
		nameField.resignFirstResponder()
		
		submitLabel.text = "Request sent".localized
	}
	
	@IBAction func cannotPerformAction(_ sender: AnyObject) {
		nameField?.resignFirstResponder()
		
		sendEmail(recipient: "cvmedicalsoftware@gmail.com", subject: "Cannot reset form")
		
	}
	
	// MARK: - UITextField delegates
	
	func textFieldDidEndEditing(_ textField: UITextField) {
		//self.activeField = nil
	}
	
	
	func textFieldDidBeginEditing(_ textField: UITextField) {
		
	}
	
	
	func textFieldShouldReturn(_ textField: UITextField) -> Bool {
		nameField.resignFirstResponder()
		return true
	}
	
	// MARK: - private
	
	func hideKeyboard() {
		self.nameField.resignFirstResponder()
	}
	
}
