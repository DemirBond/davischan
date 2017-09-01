//
//  LoginViewController.swift
//  CVDEvaluator
//
//  Created by Davis Chan on 8/4/17.
//  Copyright © 2017 IgorKhomiak. All rights reserved.
//

import UIKit
import NVActivityIndicatorView


class LoginController: BaseController, UITextFieldDelegate, UIGestureRecognizerDelegate, NVActivityIndicatorViewable {

	@IBOutlet weak var scrollView: UIScrollView!
	@IBOutlet weak var contentView: UIView!
	@IBOutlet weak var infoView: UIView!
	@IBOutlet weak var contentHeightConstraint: NSLayoutConstraint!
	
	@IBOutlet weak var nameField: UITextField!
	@IBOutlet weak var passwordField: UITextField!
	
	@IBOutlet weak var loginButton: UIButton!
	@IBOutlet weak var registerButton: UIButton!
	@IBOutlet weak var forgotPwdButton: UIButton!
	
	var activeRect: CGRect = CGRect()
	
	static let registerSegueID = "registerSegueID"
	static let resetSegueID = "resetSegueID"
	
	override var createdID: String! { return "login" }
	
	static var isFromSignupPage: Bool = false
	

	override func viewDidLoad() {
		super.viewDidLoad()
		
		// Do any additional setup after loading the view.
		self.automaticallyAdjustsScrollViewInsets = false;
		
		loginButton.layer.cornerRadius = 4.0
		loginButton.layer.borderColor = loginButton.backgroundColor?.cgColor
		loginButton.layer.borderWidth = 2.0
		
		if LoginController.isFromSignupPage {
			registerButton.isHidden = true
			LoginController.isFromSignupPage = false
		}
		
		forgotPwdButton.isHidden = true
		
		self.view.backgroundColor = UIColor.white
		
		let tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(LoginController.hideKeyboard))
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
		
		let defaults = UserDefaults.standard
		if let userName = defaults.string(forKey: "loginName") {
			nameField.text = userName
			passwordField.text = ""
		}
		
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
	
	
	
	// MARK: - IBActions
	
	override func leftButtonAction(_ sender: UIBarButtonItem) {
		hideKeyboard()
		self.dismiss(animated: true, completion: nil)
	}
	
	
	@IBAction func signInAction(_ sender: AnyObject) {
		self.hideKeyboard()
		
		guard let name = nameField.text, !name.isEmpty ,
			let pass = passwordField.text, !pass.isEmpty else {
				UIAlertController.infoAlert(message: nil, title: "The username or password field is empty", viewcontroller: self, handler: {
					self.passwordField.text = ""
				})
				
				return
		}
		
		self.startAnimating()
		
		let completionHandler = { [unowned self] (data : String?, error: NSError?) -> Void in
			
			self.stopAnimating()
			
			guard error == nil else {
				print("Server returned error \(String(describing: error))")
				
				UIAlertController.infoAlert(message: error!.userInfo["message"] as? String, title: "Cannot Login".localized, viewcontroller: self, handler: {
					self.passwordField.text = ""
				})
				
				return
			}
			
			if data == "success" {
				UserDefaults.standard.set(name, forKey: "loginName")
				
				let medicalStoriboard = UIStoryboard(name: "Medical", bundle: nil)
				let destination = medicalStoriboard.instantiateInitialViewController()
				UIApplication.shared.keyWindow?.rootViewController = destination
			}
		}
		
		DataManager.manager.signIn(with: name, password: pass, completionHandler: completionHandler)
	}
	
	
	@IBAction func registerAction(_ sender: AnyObject) {
		hideKeyboard()
		RegistraionController.isFromLoginPage = true
		self.performSegue(withIdentifier: LoginController.registerSegueID, sender: nil)
	}
	
	
	@IBAction func resetAction(_ sender: AnyObject) {
		hideKeyboard()
		self.performSegue(withIdentifier: LoginController.resetSegueID, sender: nil)
	}
	
	
	
	// MARK: - EvaluationEditing protocol
	
	override func keyboardReturnDidPress(model: EvaluationItem) {
		hideKeyboard()
		self.signInAction(self)
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
			passwordField.becomeFirstResponder()
		}
		else {
			textField.resignFirstResponder()
			signInAction(self)
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
