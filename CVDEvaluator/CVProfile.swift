//
//  CVProfile.swift
//  CVDEvaluator
//
//  Created by IgorKhomiak on 2/3/17.
//  Copyright © 2017 IgorKhomiak. All rights reserved.
//

import UIKit

class CVProfile: EvaluationItem {
	let coronaryHeartDisease = CoronaryHeartDisease(literal: Presentation.coronaryHeartDisease)
	let heartFailure = HeartFailure(literal: Presentation.heartFailure)
	let atrialFibrillation = AtrialFibrilation(literal: Presentation.atrialFibrillation)
	let thromboembolicVKA = ThromboembolicVKA(literal: Presentation.thromboembolicVKA)
	let ventricularTachyarrthymias = VentricularTachyarrthymias(literal: Presentation.ventricularTachyarrthymias)
	let bradyarrthymiaSyncope = BradyarrthymiaSyncope(literal: Presentation.bradyarrthymiaSyncope)
	let valvularHeartDisease = ValvularHeartDisease(literal: Presentation.valvularHeartDisease)
	let pulmonaryHypertension = PulmonaryHypertension(literal: Presentation.pulmonaryHypertension)
	let vascularDiseases = VascularDisease(literal: Presentation.vascularDisease)
	
	override var items: [EvaluationItem] {
		return [
			coronaryHeartDisease,
			heartFailure,
			atrialFibrillation,
			thromboembolicVKA,
			ventricularTachyarrthymias,
			bradyarrthymiaSyncope,
			valvularHeartDisease,
			pulmonaryHypertension,
			vascularDiseases
		]
	}
}
