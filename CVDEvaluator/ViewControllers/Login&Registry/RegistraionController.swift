//
//  RegistraionController.swift
//  CVDEvaluator
//
//  Created by IgorKhomiak on 3/6/17.
//  Copyright © 2017 IgorKhomiak. All rights reserved.
//

import UIKit
import NVActivityIndicatorView


class RegistraionController: BaseController, UIGestureRecognizerDelegate, NVActivityIndicatorViewable {
	
	@IBOutlet weak var scrollView: UIScrollView!
	@IBOutlet weak var contentView: UIView!
	@IBOutlet weak var infoView: UIView!
	@IBOutlet weak var contentHeightConstraint: NSLayoutConstraint!
	
	@IBOutlet weak var nameField: UITextField!
	@IBOutlet weak var emailField: UITextField!
	@IBOutlet weak var passwordField: UITextField!
	@IBOutlet weak var repeatPwdField: UITextField!
	
	@IBOutlet weak var registerButton: UIButton!
	@IBOutlet weak var goToLoginButton: UIButton!
	
	var activeRect: CGRect = CGRect()
	
	static let loginSegueID = "loginSegueID"
	static let verificationCodeSegueID = "verificationCodeSegueID"
	
	override var createdID: String! { return "registration" }
	
	static var isFromLoginPage: Bool = false
	
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		// Do any additional setup after loading the view.
		self.automaticallyAdjustsScrollViewInsets = false;
		
		registerButton.layer.cornerRadius = 4.0
		registerButton.layer.borderColor = registerButton.backgroundColor?.cgColor
		registerButton.layer.borderWidth = 2.0
		
		if RegistraionController.isFromLoginPage {
			goToLoginButton.isHidden = true
			RegistraionController.isFromLoginPage = false
		}
		
		self.view.backgroundColor = UIColor.white
		
		let tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
		self.view.addGestureRecognizer(tapRecognizer)
		
	}
	
	
	override func viewDidLayoutSubviews() {
		var contentRect: CGRect = scrollView.frame
		contentRect.size.height = infoView.frame.origin.y + infoView.frame.size.height
		scrollView.contentSize = contentRect.size
		contentHeightConstraint.constant = contentRect.size.height
	}
	
	
	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		
		self.registerForKeyboardNotifications()
	}
	
	
	override func viewWillDisappear(_ animated: Bool) {
		super.viewWillDisappear(animated)
		
		self.unRegisterForKeyboardNotifications()
	}
	
	
	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}
	
	
	
	// MARK: - Actions
	
	override func leftButtonAction(_ sender: UIBarButtonItem) {
		hideKeyboard()
		self.dismiss(animated: true, completion: nil)
	}
	
	
	@IBAction func submitAction(_ sender: AnyObject) {
		hideKeyboard()
		
		guard let name = nameField.text, !name.isEmpty,
			let mail = emailField.text, !mail.isEmpty,
			let password = passwordField.text, !password.isEmpty else {
				UIAlertController.infoAlert(message: "Please fill all required fields".localized, title: "The mail, username or password field is empty".localized, viewcontroller: self, handler: {} )
				
				return
		}
		
		guard validateEmail(mail: emailField.text!) else {
			UIAlertController.infoAlert(message: "Email is used for authentication and communications.Please choose the correct mail address.".localized, title: "The mail address is not valid".localized, viewcontroller: self, handler: {} )
			
			return
		}
		
		guard password.characters.count >= General.minPasswordLength else {
			UIAlertController.infoAlert(message: "Password must contain at least \(General.minPasswordLength) characters", title: "The password is too short".localized, viewcontroller: self, handler: {} )
			
			return
		}
		
		guard password == repeatPwdField.text  else {
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
				
//				self.performSegue(withIdentifier: RegistraionController.verificationCodeSegueID, sender: nil)
				
				UIAlertController.infoAlert(message: nil, title: "Registered".localized, viewcontroller: self, handler: {
					let medicalStoriboard = UIStoryboard(name: "Medical", bundle: nil)
					let destanation = medicalStoriboard.instantiateInitialViewController()
					
					UIApplication.shared.keyWindow?.rootViewController = destanation
				})
			}
		}
		
		DataManager.manager.registerWith(doctorName: name, loginName: mail, password: password, completionHandler: handler)
	}
	
	
	@IBAction func loginAction(_ sender: AnyObject) {
		hideKeyboard()
		LoginController.isFromSignupPage = true
		self.performSegue(withIdentifier: RegistraionController.loginSegueID, sender: nil)
	}
	
	

	// MARK: - EvaluationEditing protocol
	
	override func keyboardReturnDidPress(model: EvaluationItem) {
		hideKeyboard()
		self.submitAction(self)
	}


	
	// MARK: - Keyboard Handle Methods
	
	func registerForKeyboardNotifications() {
		NotificationCenter.default.addObserver(self, selector: #selector(keyboardWasShown), name: .UIKeyboardDidShow, object: nil)
		NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillBeHidden), name: .UIKeyboardWillHide, object: nil)
	}
	
	
	func unRegisterForKeyboardNotifications() {
		NotificationCenter.default.removeObserver(self, name: .UIKeyboardDidShow, object: nil)
		NotificationCenter.default.removeObserver(self, name: .UIKeyboardWillHide, object: nil)
	}
	
	
	func keyboardWillBeHidden(aNotification: NSNotification) {
		let contentInsets: UIEdgeInsets = UIEdgeInsets.zero
		scrollView.contentInset = contentInsets
		scrollView.scrollIndicatorInsets = contentInsets
	}
	
	
	func keyboardWasShown(aNotification: NSNotification) {
		let info: NSDictionary = aNotification.userInfo! as NSDictionary
		var kbSize: CGRect = info.object(forKey: UIKeyboardFrameBeginUserInfoKey) as! CGRect
		
		kbSize = self.view.convert(kbSize, to: nil)
		let contentInsets: UIEdgeInsets = UIEdgeInsets(top: 0.0, left: 0.0, bottom: kbSize.size.height + 2, right: 0.0)
		scrollView.contentInset = contentInsets
		scrollView.scrollIndicatorInsets = contentInsets
		
		var aRect: CGRect = self.view.frame
		aRect.size.height -= kbSize.size.height
		
		if activeRect.contains(aRect) {
			scrollView.scrollRectToVisible(activeRect, animated: true)
		}
	}
	
	
	func hideKeyboard() {
		self.view.endEditing(true)
	}
	
	
	
	// MARK: - UITextField delegates
	
	func textFieldDidBeginEditing(_ textField: UITextField) {
		self.activeRect = textField.frame
	}
	
	
	func textFieldDidEndEditing(_ textField: UITextField) {
		self.activeRect = CGRect.zero;
		textField.resignFirstResponder()
	}
	
	
	func textFieldShouldReturn(_ textField: UITextField) -> Bool {
		if textField == nameField {
			emailField.becomeFirstResponder()
		}
		else if textField == emailField {
			passwordField.becomeFirstResponder()
		}
		else if textField == passwordField {
			repeatPwdField.becomeFirstResponder()
		}
		else {
			textField.resignFirstResponder()
			submitAction(self)
		}
		
		return true
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
