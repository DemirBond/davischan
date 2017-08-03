//
//  Settings.swift
//  CVDEvaluator
//
//  Created by IgorKhomiak on 3/15/17.
//  Copyright © 2017 IgorKhomiak. All rights reserved.
//

import UIKit


class Settings: EvaluationItem {


	let about = AboutPage(literal: General.about)
	
	let separator3 = EvaluationItem(literal: General.separator3)
	let profile = Profile(literal: General.profile)
	
	let separator4 = EvaluationItem(literal: General.separator4)
	let privacyPolicy = EvaluationItem(literal: General.privacyPolicy)
	let termsOfUse = EvaluationItem(literal: General.termsOfUse)
	let helpSupport = Support(literal: General.helpSupport)
	let separator5 = EvaluationItem(literal: General.separator5)
	let logOut = EvaluationItem(literal: General.logOut)
	
	override var items: [EvaluationItem] {
		return [ about, separator3, profile, separator4, privacyPolicy, termsOfUse, helpSupport, separator5, logOut]
	}

}


class AboutPage: EvaluationItem {
	
	let version = EvaluationItem(literal: General.version)
	let appCell = EvaluationItem(literal: General.appCell)
	let rateApp = RateApp(literal: General.rateApp)
	let writeAReview = EvaluationItem(literal: General.writeAReview)
	
	override var items: [EvaluationItem] {
		return [version, appCell, rateApp, writeAReview]
	}
}

class RateApp: EvaluationItem {
	 let rateAppCell = EvaluationItem(literal: General.rateAppCell)
	
	override var items: [EvaluationItem] {
		return [rateAppCell]
	}
}


class Support: EvaluationItem {
	
	let medical = EvaluationItem(literal: General.medicalSupport)
	let developer = EvaluationItem(literal: General.technicalSupport)
	
	override var items: [EvaluationItem] {
		return [medical, developer]
	}
}
