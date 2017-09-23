//
//  EvaluationItem.swift
//  CVDEvaluator
//
//  Created by IgorKhomiak on 2/10/17.
//  Copyright © 2017 IgorKhomiak. All rights reserved.
//

import UIKit

enum InputError : Error {
	case emptyInput
	case incorrectInput
	case outOfBounds
	case toLong
}

enum ItemStatus: Int {
	case locked
	case open
	case viewed
	case valued
}

struct Dependancy {
	let dependsOn: String
	let dependMinValue: Double
	let dependMaxValue: Double
}

class ItemForm {
	let itemType:ItemType
	let isSelected: Bool
	let cellHeight: CGFloat?
	var isEnabled: Bool = true
	var status: ItemStatus = .open
	let alert: String?
	
	var suggestedHeight: CGFloat {
		return self.cellHeight ?? itemType.defaultHeight()
	}
	
	init (type: ItemType = ItemType.simple, height: CGFloat? = nil, selected: Bool = false, alert: String? = nil) {
		self.itemType = type
		self.cellHeight = height
		self.isSelected = selected
		self.alert = alert
	}
}


func setupEvaluation(evaluationItem: EvaluationItem) {
	for item in evaluationItem.items {
		item.parentItem = evaluationItem
		
		if let group = item.storedValue?.radioGroup {
			if let commonGroup = groupPresented(group: group, in: evaluationItem.radioGroups) {
				item.storedValue?.radioGroup = commonGroup
			} else {
				evaluationItem.radioGroups.append(group)
				evaluationItem.storedValue?.value = group.selectedRadioItem
				print("To \(evaluationItem.title) appended group \(group)")
			}
		}
		setupEvaluation(evaluationItem: item)
	}
	
	for item in evaluationItem.storedItems {
		item.parentItem = evaluationItem
		
		if let group = item.storedValue?.radioGroup {
			if let commonGroup = groupPresented(group: group, in: evaluationItem.radioGroups) {
				item.storedValue?.radioGroup = commonGroup
			} else {
				evaluationItem.radioGroups.append(group)
				evaluationItem.storedValue?.value = group.selectedRadioItem
				print("To \(evaluationItem.title) appended group \(group)")
			}
		}
		setupEvaluation(evaluationItem: item)
	}
	
}


class EvaluationItem  {
	
	let form: ItemForm
	var identifier: String
	let title: String
	let storedValue: StoredValue?
	let outputText: String?
	var subtitle: String?
	var radioGroups = [RadioGroup]()
	let dependancy: Dependancy?
	
	let subItems = [EvaluationItem]()
	
	var subCellsCount = 0
	var isExpanded:Bool = false
	
	var isFilled: Bool {
		
		let filled = (nil == storedValue) || storedValue!.isFilled
		if filled == false {return false }
		
		for item in items {
			if item.isFilled == false { return false }
		}
		for item in storedItems {
			if item.isFilled == false { return false }
		}
		return true
	}
	
	weak var parentItem: EvaluationItem?
	
	var modelIndexPath: IndexPath? // this value is used for responder chain
	var items: [EvaluationItem] { return [] }
	var storedItems: [EvaluationItem] { return [] }
	
	
	func model(with id: String) -> EvaluationItem? {
		if self.identifier == id { return self }
		
		for item in items {
			if let model = item.model(with: id) { return model }
		}
		
		for item in storedItems {
			if let model = item.model(with: id) { return model }
		}
		
		return nil
	}
	
	
	var itemDict: Dictionary<String, Any> {
		var dict = [String : Any]()
		dict = ["identifier": identifier, "title" : title, "status" : form.status.rawValue]
		dict["storedValue"] = (nil != storedValue) ? self.storedValue!.valueDict : NSNull()
		
		if form.status == .viewed {
			print(self.title)
		}
		if items.count == 0 {
			dict["items"] = NSNull()
		} else {
			var itemArray = [Dictionary<String, Any>]()
			for item in items {
				itemArray.append(item.itemDict)
			}
			dict["items"] = itemArray
			
		}
		
		if storedItems.count == 0 {
			dict["storedItems"] = NSNull()
		} else {
			var itemArray = [Dictionary<String, Any>]()
			for item in storedItems {
				itemArray.append(item.itemDict)
			}
			dict["storedItems"] = itemArray
			
		}
		
		return dict
	}
	
	
	func processStatus() {
		guard (form.status == .viewed || form.status == .valued) && self.items.count > 0 else { return }
		
		if form.status == .valued { return }
		
		for item in items {
			if item.form.status == .valued {
				form.status = .valued
				return
			}
		}
		
		for item in storedItems {
			if item.form.status == .valued {
				form.status = .valued
				return
			}
		}
		
	}
	
	
	func applyForItem(dict: Dictionary<String, Any>) {
		
		if let dict = dict["storedValue"] as? Dictionary<String, Any> {
			if let value =  dict["value"] as? String {
				self.storedValue?.value = value
			}
			if let value =  dict["checked"] as? Bool {
				self.storedValue?.isChecked = value
			}
			if let value =  dict["radio"] as? String {
				self.storedValue?.radioGroup?.selectedRadioItem = value
			}
			if let value =  dict["radio"] as? String {
				self.storedValue?.radioGroup?.selectedRadioItem = value
			}
		}
		
		if let viewedStatus = dict["status"] as? Int {
			form.status = ItemStatus(rawValue: viewedStatus)!
		}
		
		if let value =  dict["radio"] as? String {
			self.storedValue?.radioGroup?.selectedRadioItem = value
		}
		
		if let savedDicts = dict["items"] as? [Dictionary<String, Any>] {
			
			for item in self.items {
				for dict in savedDicts {
					if item.identifier == dict["identifier"] as? String {
						item.applyForItem(dict: dict)
						break
					}
				}
			}
		}
		
		if let savedDicts = dict["storedItems"] as? [Dictionary<String, Any>] {
			
			for item in self.storedItems {
				for dict in savedDicts {
					if item.identifier == dict["identifier"] as? String {
						item.applyForItem(dict: dict)
						break
					}
				}
			}
		}
	}
	
	
	func applyToSuccessor(id: String, value: Any) {
		
		if self.identifier == id {
			print("in applyToSuccessor " + id)
			let index = self.identifier.index(self.identifier.startIndex, offsetBy: 3)
			let prefix = self.identifier.substring(to: index)
			
			if prefix == "chk" {
				self.storedValue?.isChecked = true
			} else {
				self.storedValue?.value = String(describing: value)
			}
			print(self.storedValue?.value)
			
			if self.identifier == "gender" {
				self.storedValue?.value = (value as! Int) == 1 ? "male" : "female"
				self.storedValue?.radioGroup?.selectedRadioItem = (value as! Int) == 1 ? "male" : "female"
				self.storedValue?.radioGroup?.selectedRadioItem = (value as! Int) == 1 ? "male" : "female"
			}
		}
		if self.items.isEmpty {
			return
		}
		
		for item in self.items {
			item.applyToSuccessor(id: id, value: value)
		}
	}
	
	
	init(id: String = "default", title: String? = "unknown", subtitle: String? = nil, text: String? = nil,
	     form: ItemForm? = ItemForm(), dependancy: Dependancy? = nil,
	     stored: StoredValue? = nil ) {
		
		self.identifier = id
		self.title = title!
		self.subtitle = subtitle
		self.storedValue = stored
		self.form = form!
		self.dependancy = dependancy
		self.outputText = text
	}
	
	
	convenience init(literal: String) {
		let components: [String] = literal.components(separatedBy: "|")
		
		var itemId: String = "unsupported"
		var itemTitle: String?
		var itemSubtitle: String?
		var itemType = ItemType.simple
		var height: CGFloat?
		var valuePlaceholder: String?
		var valueMin: Double?
		var valueMax: Double?
		var valueMaxLength: Int?
		var value: String?
		var mandatory: Bool = false
		let radioGroup = RadioGroup()
		var selected: Bool = false
		var text: String?
		var alert: String?
		
		var dependsOn: String?
		var dependMin: Double?
		var dependMax: Double?
		
		//var
		print("--- \(components) ")
		for strItem in components {
			
			print("    \(strItem)  ")
			
			let strTrimmed = strItem.trimmingCharacters(in: .whitespacesAndNewlines)
			guard strTrimmed.hasPrefix("#") else { continue }
			
			let components: [String] = strTrimmed.components(separatedBy: ":")
			guard components.count == 2 else { continue }
			
			let trimmedKeyComponent = components[0].trimmingCharacters(in: .whitespacesAndNewlines)
			guard let key = PresentationKey(rawValue: trimmedKeyComponent) else { continue }
			
			let storedValue = components[1].trimmingCharacters(in: .whitespacesAndNewlines)
			
			switch key {
				case .id:
					itemId = storedValue
				
				case .title:
					itemTitle = storedValue
				
				case .subtitle:
					itemSubtitle = storedValue
				
				case .type:
					itemType = ItemType(rawValue: storedValue)!
				
				case .height:
					if let val = Int(storedValue) {
						height = CGFloat(val)
					}
				
				case .placeholder:
					valuePlaceholder = storedValue
				
				case .group:
					let start = storedValue.index(storedValue.startIndex, offsetBy: 1)
					let end = storedValue.index(storedValue.endIndex, offsetBy: -1)
					let range = start..<end
					let strList = storedValue.substring(with: range)
					let strTrimmed = strList.trimmingCharacters(in: .whitespacesAndNewlines)
					let radioComponents: [String] = strTrimmed.components(separatedBy: ",")
				
					for item in radioComponents {
						let radioId = item.trimmingCharacters(in: .whitespacesAndNewlines)
						radioGroup.addIdentifier(id: radioId)
					}
				
				case .subItems:
					let itemComponents: [String] = strTrimmed.components(separatedBy: ",")
				
					for item in itemComponents {
						let theId = item.trimmingCharacters(in: .whitespacesAndNewlines)
						//let eval = Ev
						//subItems.addIdentifier(id: theId)
					}
				
				case .min:
					valueMin = Double(storedValue)
				
				case .max:
					valueMax = Double(storedValue)
				
				case .maxLength:
					valueMaxLength = Int(storedValue)
				
				case .value:
					value = storedValue
				
				case .mandatory:
					mandatory = (storedValue == "1")
				
				case.selected:
					selected = (storedValue == "1")
				
				case .text:
					text = storedValue
				
				case .alert:
					alert = storedValue
				
				case .dependsOn:
					dependsOn = storedValue
			
				case .dependMin:
					dependMin = Double(storedValue)
			
				case .dependMax:
					dependMax = Double(storedValue)
			}
		}
		
		let createdGroup: RadioGroup? = radioGroup.group.count == 0 ? nil : radioGroup
		var storedValue: StoredValue?
		
		if let valueType = itemType.valueType() {
			storedValue = StoredValue(type: valueType,
			                          value: value,
			                          placeholder: valuePlaceholder,
			                          mandatory: mandatory,
			                          from: valueMin, to: valueMax,
			                          maxLength: valueMaxLength, inGroup: createdGroup)
		}
		
		let dependancyStruct: Dependancy? = (dependsOn != nil && dependMin != nil && dependMax != nil) ?
			Dependancy(dependsOn: dependsOn!, dependMinValue: dependMin!, dependMaxValue: dependMax!) : nil
		
		let form = ItemForm(type: itemType, height: height, selected: selected, alert: alert)
		self.init(id: itemId, title: itemTitle, subtitle: itemSubtitle, text: text,
		          form: form, dependancy: dependancyStruct, stored: storedValue)
	}
	
	
	func calculateCellHeight(forWidth cellWidth: CGFloat) -> CGFloat {
		
		let suggestedHeight = self.form.suggestedHeight
		
		if [.label, .textLeft, .mail, .integerLeft, .decimalLeft].contains(where: { $0 == form.itemType }) {
			return suggestedHeight
			
		} else if [.simple, .separator, .disclosureControl, .disclosureControlExpandable, .disclosureRadio, .disclosureWeather,  .disclosureVieved, .disclosureSimple,
		           .check, .radio, .textRight, .integerRight, .decimalRight, .minutesSeconds].contains(where: { $0 == form.itemType }) {
			
			var textWidth: CGFloat = 0.0
			switch form.itemType {
				
			case .disclosureControl, .disclosureControlExpandable, .disclosureRadio, .disclosureWeather:
				textWidth = cellWidth - 92.0
				
			case .disclosureVieved, .disclosureSimple:
				textWidth = cellWidth - 70.0
				
			case .check, .radio:
				textWidth = cellWidth - 66.0
				
			case .textRight, .integerRight, .decimalRight, .minutesSeconds:
				textWidth = cellWidth - 155.0
				
			default:
				textWidth = cellWidth - 24.0
			}
			
			let titleHeight = calculateTextHeight(message:  self.title, forWidth: textWidth, font: CVDStyle.style.currentFont)
			
			if titleHeight + 26.0 < suggestedHeight {
				return suggestedHeight
			} else if titleHeight + 16.0 < suggestedHeight + 10.0 {
				return suggestedHeight + 10.0
			} else if titleHeight + 16.0 < suggestedHeight + 20.0 {
				return suggestedHeight + 20.0
			} else if titleHeight + 16.0 < suggestedHeight + 30.0 {
				return suggestedHeight + 30.0
			} else if titleHeight + 16.0 < suggestedHeight + 40.0 {
				return suggestedHeight + 40.0
			} else if titleHeight + 16.0 < 110.0 {
				return 110.0
			} else {
				return titleHeight + 28.0
			}
			
		} else if [.partnerCard, .statusCard].contains(where: { $0 == form.itemType }) {
			return suggestedHeight
			
		} else if [.resultOutput].contains(where: { $0 == form.itemType }) {
			let textWidth = cellWidth - 32.0
			var sheetHeight: CGFloat = 20
			let titleHeight = calculateTextHeight(message:  self.title, forWidth: textWidth, font: ResultCellStyle.textFont)
			sheetHeight += titleHeight
			sheetHeight += 8.0
			if nil != subtitle {
				let subtitleHeight = calculateTextHeight(message:  self.subtitle!, forWidth: textWidth, font: ResultSubtitleStyle.textFont)
				sheetHeight += subtitleHeight
			}
			sheetHeight += 40
			return sheetHeight > self.form.suggestedHeight ? sheetHeight : self.form.suggestedHeight
			
		} else {
			return suggestedHeight
		}
	}
	
	
	func validateEvaluationItem() throws {
		for item in self.items {
			try item.storedValue?.validateValue()
		}
		for item in self.storedItems {
			try item.storedValue?.validateValue()
		}
	}
}
