//
//  LoginViewController.swift
//  CVDEvaluator
//
//  Created by Davis Chan on 8/4/17.
//  Copyright © 2017 IgorKhomiak. All rights reserved.
//

import UIKit
import NVActivityIndicatorView


class LoginViewController: BaseController, UITextFieldDelegate, NVActivityIndicatorViewable {

	@IBOutlet weak var nameField: UITextField!
	@IBOutlet weak var passwordField: UITextField!
	
	static let registerSegueID = "registerSegueID"
	static let resetSegueID = "resetSegueID"
	
	override var createdID: String! { return "login" }
	

	override func viewDidLoad() {
		super.viewDidLoad()
		
		// Do any additional setup after loading the view.
		
		let tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(LoginViewController.hideKeyboard))
		self.view.addGestureRecognizer(tapRecognizer)
		
	}
	

	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		
		let defaults = UserDefaults.standard
		if let userName = defaults.string(forKey: "loginName") {
			nameField.text = userName
			passwordField.text = ""
		}
		
		nameField.text = "davischan83@gmail.com"
		passwordField.text = "rootroot"
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
		self.performSegue(withIdentifier: LoginViewController.registerSegueID, sender: nil)
	}
	
	
	@IBAction func resetAction(_ sender: AnyObject) {
		hideKeyboard()
		self.performSegue(withIdentifier: LoginViewController.resetSegueID, sender: nil)
	}
	
	
	
	// MARK: - EvaluationEditing protocol
	
	override func keyboardReturnDidPress(model: EvaluationItem) {
		hideKeyboard()
		self.signInAction(self)
	}
	
	
	
	// MARK: - Keyboard Handle Methods
	
	func hideKeyboard() {
		nameField.resignFirstResponder()
		passwordField.resignFirstResponder()
	}
	
	
	
	// MARK: - UITextField delegates
	
	func textFieldDidBeginEditing(_ textField: UITextField) {
	}
	
	
	func textFieldDidEndEditing(_ textField: UITextField) {
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
