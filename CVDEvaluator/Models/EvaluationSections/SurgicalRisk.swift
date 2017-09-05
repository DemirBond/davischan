//
//  SurgicalRisk.swift
//  CVDEvaluator
//
//  Created by bogdankosh on 2/9/17.
//  Copyright © 2017 IgorKhomiak. All rights reserved.
//

import Foundation


// MARK: - SurgicalRisk

class SurgicalRisk: EvaluationItem {
	
	let emergencySurgery = EvaluationItem(literal: Presentation.emergencySurgery)
	let intermediateRisk = EvaluationItem(literal: Presentation.intermediateRisk)
	let highRisk = EvaluationItem(literal: Presentation.highRisk)
	let familyLowRiskSurgery = EvaluationItem(literal: Presentation.familyLowRiskSurgery)
	let unableToExercise = EvaluationItem(literal: Presentation.unableToExercise)
	let mets = EvaluationItem(literal: Presentation.mets)
	let dukeActivityScoreIndex = EvaluationItem(literal: Presentation.dukeActivityScoreIndex)
	
	override var items: [EvaluationItem] {
		return [
			emergencySurgery,
			intermediateRisk,
			highRisk,
			familyLowRiskSurgery,
			unableToExercise,
			mets,
			dukeActivityScoreIndex
		]
	}	
}
