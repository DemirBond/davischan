//
//  ControllerStyle.swift
//  CVDEvaluator
//
//  Created by Ihor on 2/26/17.
//  Copyright © 2017 IgorKhomiak. All rights reserved.
//

import UIKit

enum ControllerStyle: String {
	case login =				 "login"
	case registration =		 "registration"
	case resetAccount =		 "resetAccount"
	case codeAutorization =  "codeAutorization"
	case home =					 "home"
	case profile =				 "profile"
	case about =				 "about"
	case demo =					 "demo"
	case evaluationList =	 "evaluationList"
	case evaluation =			 "evaluation"
	case rootview =			 "rootview"
	case bio =					 "bio"
	case gender =				 "gender"
	case generated =			 "generated"
	case outputInMain =		 "outputInMain"
	case hypertension =		 "hypertension"

	func styleInfo() -> Dictionary<String, String>? {
		switch self {
		case .login:
			return ["title": "Sign In", "leftButton" : "Cancel"]
			
		case .registration:
			return ["title": "Sign Up", "leftButton" : "Cancel"]
			
		case .resetAccount:
			return ["title": "Reset Password", "leftButton" : "Cancel"]
			
		case .codeAutorization:
			return ["title": "Verification", "leftButton" : "Cancel"]
			
		case .home:
			return ["title": "Heart Check", "rightMenuButton" : "Settings"]
			
		case .profile:
			return ["title": "Profile"/*, "rightTextButton": "Aa"*/]
			
		case .about:
			return ["title": "About"/*, "rightTextButton": "Aa"*/]
			
		case .demo:
			return ["title": "Evaluation Demo", "rightBottom1": "Skip", "rightBottom" : "Next"]
			
		case .evaluationList:
			return ["title": "Evaluations"]
			
		case .rootview:
			return ["title": " "]
			
		case .evaluation:
			return ["title": "Evaluation", "rightTextButton": "Aa", "rightMenuButton" : "Settings", "rightBottom" : "Compute"]
			
		case .bio:
			return ["title": "Bio", "rightTextButton": "Aa", "rightMenuButton" : "Settings"]
			
		case .gender:
			return [:]
			
		case .outputInMain:
			return ["rightTextButton": "Aa", "rightMenuButton" : "Settings"]

		case .generated, .hypertension:
			return ["rightTextButton": "Aa", "rightListButton":"list", "rightMenuButton" : "Settings"]
			
		}
		
	}
}

class TextItemStyle {
	class var fontSize:  CGFloat { return 17.0 }
	class var fontColor: UIColor { return UIColor(palette: ColorPalette.almostBlack)! }
	class var tintColor: UIColor { return UIColor(palette: ColorPalette.lighterPurple)! }
	class var fontName:  String? { return "HelveticaNeue-Medium" }

	class var textFont: UIFont {
		if nil != fontName {
			return UIFont(name: fontName!, size: CGFloat(fontSize))!
		} else {
			return UIFont.systemFont(ofSize: CGFloat(fontSize))
		}
	}
	
	class var attributes: Dictionary<String, Any> {
		
		var dict = Dictionary<String, Any>()
		dict[NSForegroundColorAttributeName] = fontColor
		dict[NSFontAttributeName] = textFont
		
		return dict
	}
	
}

class BarItemStyle : TextItemStyle {
	override class var fontSize: CGFloat {	return 19.0 }
}


class BarButtonStyle : TextItemStyle {
	override class var fontColor: UIColor { return UIColor(palette: ColorPalette.lighterPurple)! }
}


class AlertTitleStyle : TextItemStyle {
	override class var fontSize: CGFloat { return 21.0 }
}


class SectionButttonStyle : TextItemStyle {
	override class var fontSize: CGFloat { return 17.0 }
	override class var fontColor: UIColor { return UIColor(palette: ColorPalette.warmGrey)! }
}


class ResultCellStyle: TextItemStyle {
	override class var fontSize: CGFloat { return 24.0 }
}


class ResultSubtitleStyle: TextItemStyle {
	override class var fontSize: CGFloat { return 19.0 }
	override class var fontColor: UIColor { return UIColor(palette: ColorPalette.subtitleGray)! }
}


struct CVDLink {
	let screens: Array<String>
	let link: String
}


class CVDStyle {
	
	static var style = CVDStyle()
	
	let defaultFontName: String = "HelveticaNeue-Medium"
	let defaultFontSize: CGFloat = 17.0
	let defaultFontColor = UIColor(palette: ColorPalette.almostBlack)!
	let subtitleColor = UIColor(palette: ColorPalette.spanishGray)!
//	let leftFieldColor = UIColor(palette: ColorPalette.spanishGray)!
	let leftFieldColor = UIColor(palette: ColorPalette.greyishBrown)!
	let rightFieldColor = UIColor(palette: ColorPalette.lighterPurple)!
	let purpleColor = UIColor(palette: ColorPalette.purple)!
	
	let fontSizeArray: [CGFloat] = [15.0, 17.0, 19.0, 21.0, 23.0]
	var currentFont: UIFont
	
	var currentFontSize: CGFloat {
		didSet {
			UserDefaults.standard.set(currentFontSize, forKey: "currentFontSize")
		}
	}
	
	let symptomsLink = CVDLink(screens: ["bio"], link: "symptoms")
	let reviewOfSystemLink = CVDLink(screens:["symptoms", "dyspnea", "chestpain", "syncope"], link: "reviewOfSystem")
	let physicalExamLink = CVDLink(screens: ["reviewOfSystem"], link: "currentPastCVProfile")
	let cvProfileLink = CVDLink(screens: ["currentPastCVProfile", "heartMurmurInPhysicalExam", "systolicMurmur",
		"diastolicMurmur", "blnCresDecres", "blnPlateuShaped"], link: "cvProfile")
	let s2AorticLink = CVDLink(screens:["siMitral"], link: "s2Aortic")
	let p2PulmonicLink = CVDLink(screens:["s2Aortic"], link: "p2Pulmonic")
	let s1TricuspidLink = CVDLink(screens:["p2Pulmonic"], link: "s1Tricuspid")
	let murmurLink = CVDLink(screens:["s1Tricuspid"], link: "murmur")
	
	let pulmonaryRenalLink = CVDLink(screens: ["cvProfile"], link: "pulmonary")
	let renalLink = CVDLink(screens: ["pulmonary"], link: "renal")
	let riskFactorsLink = CVDLink(screens: ["renal", "thromboembolicVKA", "ventricularTachyarrthymias", "bradyarrthymiaSyncope"], link: "riskFactors")
	let heartFailureLink = CVDLink(screens: ["coronaryHeartDisease"], link: "heartFailure")
	let atrialFibrillationLink = CVDLink(screens: ["heartFailure"], link: "atrialFibrillation")
	let thromboembolicLink = CVDLink(screens: ["atrialFibrillation"], link: "thromboembolicVKA")
	let pulmonaryLink = CVDLink(screens: ["valvularHeartDisease"], link: "pulmonaryHypertension")
	let surgicalRiskLink = CVDLink(screens: ["riskFactors"], link: "surgicalRisk")
	let laboratoriesLink = CVDLink(screens: ["surgicalRisk"], link: "laboratories")
	let diagnosticsLink = CVDLink(screens: ["laboratories"], link: "diagnostics")
	let nsrLink = CVDLink(screens: ["diagnostics"], link: "nsr")
	let heartSpecialistLink = CVDLink(screens: ["nsr"], link: "heartSpecialistManagement")
	
	// Heart Management Specialist
	let pahLink = CVDLink(screens: ["bioPAHMain"], link: "pah")
	let valvularInHSMLink = CVDLink(screens: ["pah"], link: "valvularInHSM")
	let advancedLHFLink = CVDLink(screens: ["valvularInHSM"], link: "advancedLHF")
	let echocardiographyLink = CVDLink(screens: ["advancedLHF"], link: "echocardiographyInHSM")
	let laboratoryEKGLink = CVDLink(screens: ["echocardiographyInHSM"], link: "laboratoryEKG")
	let rhcInHSMLink = CVDLink(screens: ["laboratoryEKG"], link: "rhcInHSM")
	
	var links: [CVDLink] {
		return [symptomsLink, reviewOfSystemLink, physicalExamLink, cvProfileLink, s2AorticLink, p2PulmonicLink, s1TricuspidLink, murmurLink,
		        pulmonaryRenalLink, renalLink,
		        riskFactorsLink, heartFailureLink, atrialFibrillationLink, thromboembolicLink, pulmonaryLink, surgicalRiskLink,
		        laboratoriesLink, diagnosticsLink, nsrLink, heartSpecialistLink,
		        pahLink,
		        valvularInHSMLink,
		        advancedLHFLink,
		        echocardiographyLink,
		        laboratoryEKGLink,
		        rhcInHSMLink,
		]
	}
	
	var fonts: [UIFont] {
		var arr = [UIFont] ()
		for dim in fontSizeArray {
			let font = UIFont(name: defaultFontName, size: dim)!
			arr.append(font)
		}
		return arr
	}
	
	
	init() {
		var fontSize: CGFloat = CGFloat(UserDefaults.standard.double(forKey: "currentFontSize"))
		if fontSize < 15.0 || fontSize > 23.0 { fontSize = defaultFontSize }
		currentFontSize = fontSize
		currentFont = UIFont(name: defaultFontName, size: CGFloat(currentFontSize))!
	}
	
	
	func setup() {
		UINavigationBar.appearance().titleTextAttributes = BarItemStyle.attributes
		UINavigationBar.appearance().tintColor = BarItemStyle.tintColor
		UIBarButtonItem.appearance().setTitleTextAttributes(BarButtonStyle.attributes, for: UIControlState.normal)
		UIButton.appearance().titleLabel?.font = AlertTitleStyle.textFont
	}
	
	
	func smartLink(from identifier: String) -> String? {
		for smart in links {
			if smart.screens.contains(where: { $0 == identifier}) {
				return smart.link
			}
		}
		return nil
	}
	
}
