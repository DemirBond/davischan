//
//  CodeAutorizationController.swift
//  CVDEvaluator
//
//  Created by IgorKhomiak on 2/7/17.
//  Copyright © 2017 IgorKhomiak. All rights reserved.
//

import UIKit
import MessageUI
import NVActivityIndicatorView


class CodeAutorizationController: BaseController, UITextFieldDelegate, MFMailComposeViewControllerDelegate, NVActivityIndicatorViewable {
	
	@IBOutlet weak var codeField: UITextField!
	
	override var createdID: String! { return "codeAutorization" }
	
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		let tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(CodeAutorizationController.hideKeyboard))
		self.view.addGestureRecognizer(tapRecognizer)
	}
	
	
	
	// MARK: - Actions
	
	override func leftButtonAction(_ sender: UIBarButtonItem) {
		hideKeyboard()
		self.dismiss(animated: true, completion: nil)
	}
	
	
	@IBAction func submitAction(_ sender: AnyObject) {
		hideKeyboard()
		
		guard let auth_code = self.codeField.text, !auth_code.isEmpty else {
				UIAlertController.infoAlert(message: "", title: "The verification code field is empty", viewcontroller: self, handler: {
					self.codeField.text = ""
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
//				UIAlertController.infoAlert(message: error!.userInfo["message"] as? String, title: "Cannot Sign In".localized, viewcontroller: self, handler: {
//					self.codeField.text = ""
//				})
//				
//				return
//			}
//			
//			if data == "success" {
//				UIAlertController.infoAlert(message: nil, title: "Authorized".localized, viewcontroller: self, handler: {
//					let medicalStoriboard = UIStoryboard(name: "Medical", bundle: nil)
//					let destanation = medicalStoriboard.instantiateInitialViewController()
//					
//					UIApplication.shared.keyWindow?.rootViewController = destanation
//				})
//			}
//		}
//		
//		DataManager.manager.authUser(with: name, password: pass, completionHandler: completionHandler)
		
		UIAlertController.infoAlert(message: nil, title: "Authorized".localized, viewcontroller: self, handler: {
			let medicalStoriboard = UIStoryboard(name: "Medical", bundle: nil)
			let destanation = medicalStoriboard.instantiateInitialViewController()
			
			UIApplication.shared.keyWindow?.rootViewController = destanation
		})
	}
	
	
	@IBAction func cannotPerformAction(_ sender: AnyObject) {
		hideKeyboard()
		
		sendEmail(recipient: "cvmedicalsoftware@gmail.com", subject: "Cannot Sign In")
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
		self.codeField.resignFirstResponder()
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
