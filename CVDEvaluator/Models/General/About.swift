//
//  About.swift
//  CVDEvaluator
//
//  Created by IgorKhomiak on 3/15/17.
//  Copyright © 2017 IgorKhomiak. All rights reserved.
//

import UIKit


class About: EvaluationItem {

	let version = EvaluationItem(literal: General.version)
	let appCell = EvaluationItem(literal: General.appCell)
//	let rateApp = RateApp(literal: General.rateApp)
//	let writeAReview = EvaluationItem(literal: General.writeAReview)
	
	let separator1 = EvaluationItem(literal: General.separator1)
	let privacyPolicy = EvaluationItem(literal: General.privacyPolicy)
	let termsOfUse = EvaluationItem(literal: General.termsOfUse)
	let helpSupport = Support(literal: General.helpSupport)
	
	override var items: [EvaluationItem] {
		return [
			version,
			appCell,
//			rateApp,
//			writeAReview,
			separator1,
			privacyPolicy,
			termsOfUse,
			helpSupport,
		]
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
