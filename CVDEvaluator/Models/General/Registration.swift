//
//  Registration.swift
//  CVDEvaluator
//
//  Created by IgorKhomiak on 3/6/17.
//  Copyright © 2017 IgorKhomiak. All rights reserved.
//

import UIKit

class Registration: EvaluationItem {
	
	var name: String? {
		return screenNameItem.storedValue?.value
	}
	
	var email: String? {
		return mailItem.storedValue?.value
	}
	
	
	var password: String? {
		return passwordItem.storedValue?.value
	}

	var repeatPassword: String? {
		return repeatPassItem.storedValue?.value
	}

	let separator1 = EvaluationItem(literal: General.separator1)
	let mailItem = EvaluationItem(literal: General.mail)
	let screenNameItem = EvaluationItem(literal: General.screenName)
	
	let separator2 = EvaluationItem(literal: General.separator2)
	let passwordItem = EvaluationItem(literal: General.password)
	let repeatPassItem = EvaluationItem(literal: General.repeatPass)
	
	override var items: [EvaluationItem] {
		return [separator1, mailItem, screenNameItem, separator2, passwordItem, repeatPassItem]
	}
	
}
