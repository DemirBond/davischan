//
//  SplashController.swift
//  CVDEvaluator
//
//  Created by Davis Chan on 8/3/17.
//  Copyright © 2017 IgorKhomiak. All rights reserved.
//

import UIKit
import NVActivityIndicatorView


class SplashController: UIViewController, NVActivityIndicatorViewable {

	override func viewDidLoad() {
		super.viewDidLoad()
		
		// Do any additional setup after loading the view.
	}
	

	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		
		let defaults = UserDefaults.standard
		if let userName = defaults.string(forKey: "loginName") {
			self.startAnimating()
			
			let completionHandler = { [unowned self] (data : String?, error: NSError?) -> Void in
				
				self.stopAnimating()
				
				guard error == nil else {
					//print("Server returned error \(String(describing: error))")
					
					UIAlertController.infoAlert(message: error!.userInfo["message"] as? String, title: "Cannot Login".localized, viewcontroller: self, handler: {
						self.performSegue(withIdentifier: "loginSegueID", sender: nil)
					})
					
					return
				}
				
				if data == "success" {
					let medicalStoriboard = UIStoryboard(name: "Medical", bundle: nil)
					let destination = medicalStoriboard.instantiateInitialViewController()
					UIApplication.shared.keyWindow?.rootViewController = destination
				}
				else if data == "nopass" {
					self.performSegue(withIdentifier: "loginSegueID", sender: nil)
				}
			}
			
			DataManager.manager.signIn(with: userName, completionHandler: completionHandler)
		}
		else {
			self.performSegue(withIdentifier: "loginSegueID", sender: nil)
		}
	}


	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
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
