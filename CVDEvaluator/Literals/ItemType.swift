//
//  ItemType.swift
//  CVDEvaluator
//
//  Created by Ihor on 2/12/17.
//  Copyright © 2017 IgorKhomiak. All rights reserved.
//

import Foundation
import UIKit

enum ValueType: Int {
	case noValue
	case checkValue
	case radioValue
	case boolean
	case integer
	case decimal
	case string
}

enum ItemType: String {
	case simple = "#simple"
	case label = "#label"
	case disclosureSimple = "#disclosureSimple"
	case disclosureSimpleExpandable = "#disclosureSimpleExpandable"
	case disclosureVieved = "#disclosureVieved"
	case disclosureControl = "#disclosureControl"
	case disclosureControlExpandable = "#disclosureControlExpandable"
	
	case expandableCell = "#expandableCell"
	
	case disclosureControlWithCheck = "#disclosureControlWithCheck"
	
	case disclosureRadio = "#disclosureRadio"
	case disclosureWeather = "#disclosureWeather"
	
	case disclousreNoArrow = "#disclousreNoArrow"
	
	case separator = "#separator"
	
	case textRight = "#textRight"
	case textLeft = "#textLeft"
	case mail = "#mail"
	case password = "#password"
	
	case integerRight = "#integerRight"
	case integerRightExpandable = "#integerRightExpandable"
	case integerLeft = "#integerLeft"
	
	case decimalRight = "#decimalRight"
	case decimalLeft = "#decimalLeft"
	
	case model = "#model"
	case check = "#check"
	case radio = "#radio"
	case custom = "#custom"
	case partnerCard = "#partnerCard"
	case referencesCard = "#referencesCard"
	case statusCard = "#statusCard"
	case resultOutput = "#resultOutput"
	
	case minutesSeconds = "#minutesSeconds"
	case segment = "#segment"
	case date = "#date"
	
	case appInfo = "#appInfo"
	
	
	func defaultHeight() -> CGFloat {
		switch self {
			
		case .separator:
			return 30.0
			
		case .segment:
			return 44.0    // segment height
			
		case .simple:
			return 50.0
			
		case .date:
			return 50.0
			
		case .label:
			return 50.0
			
		case .disclosureVieved, .disclosureControl, .disclosureRadio, .disclosureSimple, .disclosureSimpleExpandable,.disclosureWeather:
			return 55.0
			
		case .disclousreNoArrow:
			return 60.0
			
		case .textLeft, .integerLeft, .decimalLeft, .mail, .password:
			return 60.0
			
		case .textRight, .integerRight, .integerRightExpandable, .decimalRight, .check, .radio, .minutesSeconds:
			return 60.0
			
		case .partnerCard:
			return 417.0

		case .statusCard:
			return 120.0

		case .resultOutput:
			return 80.0
			
		case .referencesCard:
			return 120.0
			
		case .custom:
			return 70.0
			
		case .appInfo:
			return 200.0
			
		default:
			return 70.0
		}
	}
	
	
	func valueType() -> ValueType? {
		switch self {
			
		case .separator, .simple, .label, .segment:
			return nil
			
		case .partnerCard, .statusCard, .resultOutput:
			return nil
			
		case .disclosureVieved, .disclosureSimple, .disclosureSimpleExpandable, .disclosureWeather:
			return nil
			
		case .disclousreNoArrow:
			return nil
			
		case .model:
			return nil
			
		case .check, .disclosureControl, .disclosureControlExpandable:
			return .checkValue
			
		case .textLeft, .textRight, .mail, .password:
			return .string
			
		case .date:
			return .string
			
		case .integerLeft, .integerRight, .integerRightExpandable, .minutesSeconds:
			return .integer
			
		case .decimalLeft, .decimalRight:
			return .decimal
			
		case .radio, .disclosureRadio:
			return .radioValue
			
		case .appInfo:
			return nil
			
		default:
			return nil
		}
	}
	
	
	func reuseIdentifier() -> String {
		switch self {
		case .simple:
			return "SimpleCell"
			
		case .label:
			return "LabelCell"
			
		case .disclosureSimple:
			return "DisclosureSimpleCell"
		
		case .disclosureSimpleExpandable:
			return "DisclosureSimpleCellExpandable"
			
		case .disclosureVieved:
			return "DisclosureViewedCell"
			
		case .disclosureControl:
			return "DisclosureControlCell"
		
		case .disclosureControlExpandable:
			return "DisclosureControlCellExpandable"
			
		case .disclosureControlWithCheck:
			return "DisclosureControlCellWithCheck"
			
		case .disclosureRadio:
			return "DisclosureRadioCell"
			
		case .disclosureWeather:
			return "WeatherDisclosureCell"
			
		case .disclousreNoArrow:
			return "DisclosureSimpleCellNoArrow"
		
		case .separator:
			return "SeparatorCell"
			
		// Text Fields
		case .textLeft:
			return "LeftTextCell"
			
		case .mail:
			return "MailCell"
			
		case .password:
			return "PasswordCell"
			
		case .textRight:
			return "RightTextCell"
			
		// Integer Fields
		case .integerLeft:
			return "LeftIntegerCell"
			
		case .integerRight:
			return "RightIntegerCell"
		
		case .integerRightExpandable:
			return "RightIntegerCellExpandable"
			
		// Decimal Fields
		case .decimalLeft:
			return "LeftDecimalCell"
			
		case .decimalRight:
			return "RightDecimalCell"
			
		// Left buttons fields
		case .check:
			return "CheckBoxCell"
			
		case .radio:
			return "RadioButtonCell"
		case .date:
			return "DateCell"
			
		case .minutesSeconds:
			return "MinutesSecondsCell"
			
		case .partnerCard:
			return "PartnerCardCell"
		
		case .referencesCard:
			return "ReferencesCardCell"
			
		case .statusCard:
			return "StatusCardCell"
			
		case .resultOutput:
			return "OutputResultsCell"
			
		case .custom:
			return "CustomCell"
			
		case .appInfo:
			return "AboutCell"
			
		default:
			return ""
		}
	}
}
