//
//  ResetAccountController.swift
//  CVDEvaluator
//
//  Created by IgorKhomiak on 2/7/17.
//  Copyright © 2017 IgorKhomiak. All rights reserved.
//

import UIKit
import MessageUI
import NVActivityIndicatorView


class ResetAccountController: BaseController, UITextFieldDelegate, MFMailComposeViewControllerDelegate, NVActivityIndicatorViewable {
	
	@IBOutlet weak var nameField: UITextField!
	@IBOutlet weak var submitButton: UIButton!
	
	override var createdID: String! { return "resetAccount" }
	
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		let tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(ResetAccountController.hideKeyboard))
		self.view.addGestureRecognizer(tapRecognizer)
	}
	
	
	
	// MARK: - Overridden Actions
	
	override func leftButtonAction(_ sender: UIBarButtonItem) {
		nameField.resignFirstResponder()
		self.dismiss(animated: true, completion: nil)
	}
	
	
	@IBAction func submitAction(_ sender: AnyObject) {
		hideKeyboard()
		
		guard let name = self.nameField.text, !name.isEmpty else {
			UIAlertController.infoAlert(message: "", title: "The name field is empty", viewcontroller: self, handler: {
				self.nameField.text = ""
			})
			
			return
		}
		
//		self.startAnimating()
//		
//		let completionHandler = { [unowned self] (data : String?, error: NSError?) -> Void in
//			
//			self.stopAnimating()
//			
//			guard error == nil else {
//				print("Server returned error \(String(describing: error))")
//				
//				UIAlertController.infoAlert(message: error!.userInfo["message"] as? String, title: "Cannot reset account".localized, viewcontroller: self, handler: {
//					self.nameField.text = ""
//				})
//				
//				return
//			}
//			
//			if data == "success" {
//				UIAlertController.infoAlert(message: nil, title: "Request Sent".localized, viewcontroller: self, handler: {
//					self.dismiss(animated: true, completion: nil)
//				})
//			}
//		}
//
//		DataManager.manager.reset(with: name, password: pass, completionHandler: completionHandler)
		
		UIAlertController.infoAlert(message: nil, title: "Request Sent".localized, viewcontroller: self, handler: {
			self.dismiss(animated: true, completion: nil)
		})		
	}
	
	@IBAction func cannotPerformAction(_ sender: AnyObject) {
		nameField?.resignFirstResponder()
		
		sendEmail(recipient: "cvmedicalsoftware@gmail.com", subject: "Cannot reset form")
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
	
	
	
	// MARK: - Keyboard Handle Methods
	
	func hideKeyboard() {
		self.nameField.resignFirstResponder()
	}
	
	
	
	// MARK: - MFMailComposeViewController delegate
	
	func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
		controller.dismiss(animated: true)
	}
	
	
	
	// MARK: - UITextField delegates
	
	func textFieldDidBeginEditing(_ textField: UITextField) {
	}
	
	
	func textFieldDidEndEditing(_ textField: UITextField) {
		textField.resignFirstResponder()
	}
	
	
	func textFieldShouldReturn(_ textField: UITextField) -> Bool {
		textField.resignFirstResponder()
		return true
	}
	
}
