//
//  Renal.swift
//  CVDEvaluator
//
//  Created by Davis Chan on 9/5/17.
//  Copyright © 2017 IgorKhomiak. All rights reserved.
//

import Foundation


// MARK: - Renal

class Renal: EvaluationItem {
	
	let acuteRenalFailure = AcuteRenalFailure(literal: Presentation.acuteRF)
	let chronicKidneydisease = ChronicKidneyDisease(literal: Presentation.chronicKD)
	
	override var items: [EvaluationItem] {
		return [
			acuteRenalFailure,
			chronicKidneydisease
		]
	}
}


// MARK: - Renal -> Acute Renal Failure / Worsening Renal Function

class AcuteRenalFailure: EvaluationItem {
	
	let crinic = EvaluationItem(literal: Presentation.crinic)
	let cr48h = EvaluationItem(literal: Presentation.cr48h)
	let urinvolume = EvaluationItem(literal: Presentation.urinvolume)
	
	override var items: [EvaluationItem] {
		return [
			crinic,
			cr48h,
			urinvolume,
		]
	}
}


// MARK: - Renal -> Chronic Kidney Disease

class ChronicKidneyDisease: EvaluationItem {
	
	let copdex = EvaluationItem(literal: Presentation.copdex)
	let copdhos = EvaluationItem(literal: Presentation.copdhos)
	
	override var items: [EvaluationItem] {
		return [
			copdex,
			copdhos
		]
	}
}
