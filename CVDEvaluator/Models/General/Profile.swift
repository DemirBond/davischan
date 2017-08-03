//
//  Profile.swift
//  CVDEvaluator
//
//  Created by IgorKhomiak on 3/16/17.
//  Copyright © 2017 IgorKhomiak. All rights reserved.
//

import UIKit

class Profile : EvaluationItem {
	
	var name: String? {
		
		get {
			return screenNameItem.storedValue?.value
		}
		
		set (newValue) {
			screenNameItem.storedValue?.value = newValue
		}
	}
	
	var email: String? {
		get {
			return mailItem.storedValue?.value
		}
		set (newValue) {
			mailItem.storedValue?.value = newValue
		}
	}
	
	
	var password: String? {
		return passwordItem.storedValue?.value
	}
	
	var repeatPassword: String? {
		return repeatPassItem.storedValue?.value
	}
	
	let separator1 = EvaluationItem(literal: General.pSeparator1)
	let mailItem = EvaluationItem(literal: General.pMail)
	let screenNameItem = EvaluationItem(literal: General.pScreenName)
	
	let separator2 = EvaluationItem(literal: General.pSeparator2)
	let passwordItem = EvaluationItem(literal: General.pPassword)
	let repeatPassItem = EvaluationItem(literal: General.pRepeatPass)
	
	override var items: [EvaluationItem] {
		return [separator1, mailItem, screenNameItem, separator2, passwordItem, repeatPassItem]
	}

}
