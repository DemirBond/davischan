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
	var leftBarItem: UIBarButtonItem?
	var rightTextBarItem: UIBarButtonItem?
	var rightListBarItem: UIBarButtonItem?
	var rightMenuBarItem: UIBarButtonItem?
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
		
		if let leftButtonName = dict["leftButton"] as? String {
			self.leftBarItem = UIBarButtonItem(title: leftButtonName, style: .plain, target: target, action: actions[0])
		}
		
		if let _ = dict["rightTextButton"] as? String {
			let barItem = UIBarButtonItem(image: UIImage(named: "text-size"), style: .plain, target: target, action: actions[1])
			barItem.imageInsets = UIEdgeInsetsMake(0, -5, 0, -30)
			self.rightTextBarItem = barItem
		}
		
		if let _ = dict["rightListButton"] as? String {
			let barItem = UIBarButtonItem(image: UIImage(named: "list"), style: .plain, target: target, action: actions[2])
			barItem.imageInsets = UIEdgeInsetsMake(0, -10, 0, 5)
			self.rightListBarItem = barItem
		}
		
		if let rightMenuButton = dict["rightMenuButton"] as? String {
			let barItem = UIBarButtonItem(title: rightMenuButton, style: .plain, target: target, action: actions[3])
			//barItem.imageInsets = UIEdgeInsetsMake(0, -5, 0, -30)
			self.rightMenuBarItem = barItem
		}
	}
}
