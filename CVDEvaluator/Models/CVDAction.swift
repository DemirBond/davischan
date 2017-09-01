//
//  CVDAction.swift
//  CVDEvaluator
//
//  Created by IgorKhomiak on 2/22/17.
//  Copyright © 2017 IgorKhomiak. All rights reserved.
//

import UIKit

enum CVDActionType {
	case cancel
	case done
	case destruct
	case navigate
}

typealias CVDHandler = () -> Void

struct CVDAction {
	
	let title: String
	let handler: CVDHandler?
	let actionType: CVDActionType
	var isShort: Bool
	var isBorder: Bool
	
	init (title: String, type: CVDActionType, handler: CVDHandler?, short: Bool = true, border: Bool = true) {
		self.title = title
		self.actionType = type
		self.handler = handler
		self.isShort = short
		self.isBorder = border
	}
}
