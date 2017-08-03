//
//  RadioGroup.swift
//  CVDEvaluator
//
//  Created by IgorKhomiak on 2/16/17.
//  Copyright © 2017 IgorKhomiak. All rights reserved.
//

import UIKit

func == (left: RadioGroup, right: RadioGroup) -> Bool {
	guard left.group.count == right.group.count else { return false }
	for idLeft in left.group {
		for idRight in right.group {
			if idLeft == idRight { 	return true }
		}
	}
	return false
}

func groupPresented(group: RadioGroup, in radioGroups: [RadioGroup]) -> RadioGroup? {
	for presentedGroup in radioGroups {
		if group == presentedGroup { return presentedGroup }
	}
	
	return nil
}

class RadioGroup {
	private(set) var group = Array<String>()
	var selectedRadioItem: String?
	
	init() { }
	
	init(radioGroup: RadioGroup) {
		self.group = radioGroup.group
		self.selectedRadioItem = radioGroup.selectedRadioItem
	}
	
	func addIdentifier(id: String) {
		self.group.append(id)
	}
	
	func selectItem(id: String) {
		selectedRadioItem = id
	}
}
