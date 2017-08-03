//
//  CodeAutorizationController.swift
//  CVDEvaluator
//
//  Created by IgorKhomiak on 2/7/17.
//  Copyright © 2017 IgorKhomiak. All rights reserved.
//

import UIKit

class CodeAutorizationController: BaseController, UITextFieldDelegate  {
	
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
		let medicalStoriboard = UIStoryboard(name: "Medical", bundle: nil)
		let destanation = medicalStoriboard.instantiateInitialViewController()
		
		UIApplication.shared.keyWindow?.rootViewController = destanation
	}
	
	
	@IBAction func cannotPerformAction(_ sender: AnyObject) {
		hideKeyboard()
	}
	
	
	func textFieldDidEndEditing(_ textField: UITextField) {
		//self.activeField = nil
	}
	
	
	func textFieldDidBeginEditing(_ textField: UITextField) {
		
	}
	
	
	func textFieldShouldReturn(_ textField: UITextField) -> Bool {
		hideKeyboard()
		return true
	}
	
	// MARK: - private
	
	func hideKeyboard() {
		self.codeField.resignFirstResponder()
	}
	
}
