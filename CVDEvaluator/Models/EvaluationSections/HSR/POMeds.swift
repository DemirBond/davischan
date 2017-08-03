//
//  POMeds.swift
//  CVDEvaluator
//
//  Created by bogdankosh on 2/14/17.
//  Copyright © 2017 IgorKhomiak. All rights reserved.
//

import Foundation

class POMeds: EvaluationItem {
	let bBlocker = BBlocker(literal: Presentation.bBlocker)
	let acelARB = AcelARB(literal: Presentation.acelARB)
	let poDiuretic = PODiuretic(literal: Presentation.poDiuretic)
	let ccbOtherVasolidators = EvaluationItem(literal: Presentation.ccbOtherVasolidators)
	let currentVKATherapy = EvaluationItem(literal: Presentation.currentVKATherapy)
	let directThrombinInhibitors = EvaluationItem(literal: Presentation.directThrombinInhibitors)
	let factorXaInhibitors = EvaluationItem(literal: Presentation.factorXaInhibitors)
	
	override var items: [EvaluationItem] {
		return [
			bBlocker,
			acelARB,
			poDiuretic,
			ccbOtherVasolidators,
			currentVKATherapy,
			directThrombinInhibitors,
			factorXaInhibitors
		]
	}
}

class AcelARB: EvaluationItem {
	let lisinopril5 = EvaluationItem(literal: Presentation.lisinopril5)
	let chklisinopril10 = EvaluationItem(literal: Presentation.chklisinopril10)
	let chklisinopril20 = EvaluationItem(literal: Presentation.chklisinopril20)
	 
	override var items: [EvaluationItem] {
		return [
			lisinopril5,
			chklisinopril10,
			chklisinopril20
		]
	}
}

class BBlocker: EvaluationItem {
	
}

class PODiuretic: EvaluationItem {
	let furosemide40 = EvaluationItem(literal: Presentation.furosemide40)
	let furosemide80 = EvaluationItem(literal: Presentation.furosemide80)
	let furosemide80Plus = EvaluationItem(literal: Presentation.furosemide80Plus)
	let bumex1 = EvaluationItem(literal: Presentation.bumex1)
	let bumex2 = EvaluationItem(literal: Presentation.bumex2)
	let bumex2Plus = EvaluationItem(literal: Presentation.bumex2Plus)
	let torsemide20 = EvaluationItem(literal: Presentation.torsemide20)
	let torsemide40 = EvaluationItem(literal: Presentation.torsemide40)
	let torsemide50Plus = EvaluationItem(literal: Presentation.torsemide50Plus)
	let hctz = EvaluationItem(literal:Presentation.hctz)
	let indapamide = EvaluationItem(literal: Presentation.indapamide)
	let chlorthalidoneMetolazone = EvaluationItem(literal: Presentation.chlorthalidoneMetolazone)
	
	override var items: [EvaluationItem] {
		return [
			furosemide40,
			furosemide80,
			furosemide80Plus,
			bumex1,
			bumex2,
			bumex2Plus,
			torsemide20,
			torsemide40,
			torsemide50Plus,
			hctz,
			indapamide,
			chlorthalidoneMetolazone
		]
	}
}
