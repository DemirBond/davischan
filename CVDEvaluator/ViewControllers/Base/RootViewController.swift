//
//  RootViewController.swift
//  CVDEvaluator
//
//  Created by IgorKhomiak on 2/8/17.
//  Copyright © 2017 IgorKhomiak. All rights reserved.
//

import UIKit


class RootViewController: BaseController {
	
	static let homeSegueID = "homeSegueID"
	static let firstTimeSegueID = "firstTimeSegueID"
	
	override var createdID: String! { return "rootview" }
	
	var appRunnedBefore: Bool {
		get {
			return UserDefaults.standard.bool(forKey: "appRunnedBefore")
		}
		
		set {
			UserDefaults.standard.set(newValue, forKey: "appRunnedBefore")
		}
	}
	
	
	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		
		if appRunnedBefore {
			self.performSegue(withIdentifier: RootViewController.homeSegueID, sender: nil)
		} else {
			self.performSegue(withIdentifier: RootViewController.firstTimeSegueID, sender: nil)
		}
		appRunnedBefore = true
	}
	
}
