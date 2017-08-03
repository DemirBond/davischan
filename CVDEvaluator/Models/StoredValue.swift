//
//  StoredValue.swift
//  CVDEvaluator
//
//  Created by IgorKhomiak on 2/24/17.
//  Copyright © 2017 IgorKhomiak. All rights reserved.
//

import UIKit


class StoredValue {
	
	let placeholder: String?
	let minValue: Double?
	let maxValue: Double?
	var maxLengthValue: Int?
	let isMandatory: Bool
	var radioGroup: RadioGroup?
	
	var isFilled: Bool {
		return isMandatory == false || isMandatory && value != nil
	}
	
	var valueType: ValueType
	var value: String?
	var isChecked: Bool = false
		
	var valueDict: Dictionary<String, Any> {
		var dict = [String : Any]()
		
		dict = ["type": valueType.rawValue, "checked": isChecked]
		dict["value"] = value != nil ? value : NSNull()
		
		if radioGroup != nil && radioGroup!.selectedRadioItem != nil {
			dict["radio"] = radioGroup!.selectedRadioItem!
		}
		
		return dict
	}
	
	
	init(type: ValueType, value: String? = nil,
	     placeholder: String? = nil, mandatory: Bool = false,
	     from minValue: Double? = nil, to maxValue: Double? = nil,
	     maxLength: Int? = 80, inGroup group: RadioGroup? = nil) {
		
		self.valueType = type
		self.minValue = minValue
		self.maxValue = maxValue
		self.maxLengthValue = maxLength
		self.placeholder = placeholder
		self.isMandatory = mandatory
		self.radioGroup = group
		
	}
	
	
	func validateValue() throws {
		
		switch self.valueType {
		case ValueType.integer:
			if value != nil && value!.characters.count > 0 {
				guard let val = Int(value!) else { throw InputError.incorrectInput }
				let minVal = Int(self.minValue!)
				let maxVal = Int(self.maxValue!)
				guard val >= minVal && val <= maxVal else { throw InputError.outOfBounds }
				
			} else if self.isMandatory {
				throw InputError.emptyInput
			}
			
		case ValueType.decimal:
			if value != nil && value!.characters.count > 0 {
				guard let val = Double(value!) else { throw InputError.incorrectInput }
				let minVal = self.minValue!
				let maxVal = self.maxValue!
				guard val >= minVal && val <= maxVal else { throw InputError.outOfBounds }
				
			} else if self.isMandatory {
				throw InputError.emptyInput
			}
			
		case ValueType.string:
			if value != nil && value!.characters.count > 0 {
				let maxlength = nil != maxLengthValue ? maxLengthValue! : 80

				guard value!.characters.count <= maxlength else { throw InputError.toLong }
				
			} else if self.isMandatory {
				throw InputError.emptyInput
			}
			
		default:
			()
		}
	}
	
	func validateInput(inputText: String) throws {
		
		switch self.valueType {
		case ValueType.integer:
			if inputText.characters.count > 0 {
				guard let val = Int(inputText) else { throw InputError.incorrectInput }
				let minVal = Int(self.minValue!)
				let maxVal = Int(self.maxValue!)
				guard val >= minVal && val <= maxVal else { throw InputError.outOfBounds }
				
			} else if self.isMandatory {
				throw InputError.emptyInput
			}
			
		case ValueType.decimal:
			if inputText.characters.count > 0 {
				guard let val = Double(inputText) else { throw InputError.incorrectInput }
				let minVal = self.minValue!
				let maxVal = self.maxValue!
				guard val >= minVal && val <= maxVal else { throw InputError.outOfBounds }
				
			} else if self.isMandatory {
				throw InputError.emptyInput
			}
			
		case ValueType.string:
			if inputText.characters.count > 0 {
				let maxlength = nil != maxLengthValue ? maxLengthValue! : 80
				guard inputText.characters.count <= maxlength else { throw InputError.toLong }
				
			} else if self.isMandatory {
				throw InputError.emptyInput
			}
			
		default:
			()
		}
	}
}
