//
//  MenuAction.swift
//  CVDEvaluator
//
//  Created by Davis Chan on 9/8/17.
//  Copyright © 2017 IgorKhomiak. All rights reserved.
//

import UIKit


typealias MenuHandler = () -> Void

struct MenuAction {
	
	let title: String
	let handler: MenuHandler?
	
	init (title: String, handler: MenuHandler?) {
		self.title = title
		self.handler = handler
	}
}
