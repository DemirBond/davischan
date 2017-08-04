//
//  CVDTopbar.swift
//  CVDEvaluator
//
//  Created by Ihor on 2/24/17.
//  Copyright © 2017 IgorKhomiak. All rights reserved.
//

import UIKit

class CVDTopbar: NSObject {
	
	var title: String?
	var rightTextBarItem: UIBarButtonItem?
	var rightBarItem: UIBarButtonItem?
	var leftBarItem: UIBarButtonItem?
	var tintColor: UIColor?
	var style: TextItemStyle?
	
	init (dict: Dictionary<String, Any>, target: UIViewController, actions: [Selector?]) {
		
		if let title = dict["title"] as? String  {
			self.title = title
		}
		
		if let hColor = dict["tintColor"] as? String,
			let color = UIColor(name: hColor) {
			self.tintColor = color
		}
		
		if let rightButtonName = dict["rightButton"] as? String {
			self.rightBarItem = UIBarButtonItem(title: rightButtonName, style: .plain, target: target, action: actions[0])
		}
		if let leftButtonName = dict["leftButton"] as? String {
			self.leftBarItem = UIBarButtonItem(title: leftButtonName, style: .plain, target: target, action: actions[1])
		}		
	}
}
