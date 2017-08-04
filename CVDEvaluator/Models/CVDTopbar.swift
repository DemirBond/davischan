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
		if let rightIconName = dict["rightIcon"] as? String {
			
			self.rightTextBarItem = UIBarButtonItem(image: UIImage(named: "text-size"), style: .plain, target: target, action: actions[2])
			self.rightBarItem = UIBarButtonItem(image: UIImage(named: rightIconName), style: .plain, target: target, action: actions[0])
			self.rightTextBarItem?.imageInsets = UIEdgeInsetsMake(0, -5, 0, -30)
			self.rightBarItem?.imageInsets = UIEdgeInsetsMake(0, -10, 0, 5)
			
		}
		
//		if let rightIconNameTextOnly = dict["rightIconOnlyText"] as? String {
//			self.rightTextBarItem = UIBarButtonItem(image: UIImage(named: "text-size"), style: .plain, target: target, action: actions[2])
//		}
		
		if let leftButtonName = dict["leftButton"] as? String {
			self.leftBarItem = UIBarButtonItem(title: leftButtonName, style: .plain, target: target, action: actions[1])
		}
		if let leftIconName = dict["leftIcon"] as? String {
			self.rightBarItem = UIBarButtonItem(image: UIImage(named: leftIconName), style: .plain, target: target, action: actions[1])
		}
		
	}
}
