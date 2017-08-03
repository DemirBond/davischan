//
//  AtrialFibrilation.swift
//  CVDEvaluator
//
//  Created by bogdankosh on 2/6/17.
//  Copyright © 2017 IgorKhomiak. All rights reserved.
//

import Foundation

class AtrialFibrilation: EvaluationItem {
	
	let symptomatic = Symptomatic(literal: Presentation.symptomatic)
	let chronicAF = EvaluationItem(literal: Presentation.chronicAF)
	let persistentAF = EvaluationItem(literal: Presentation.persistentAF)
	let paroxymalAF = EvaluationItem(literal: Presentation.paroxymalAF)
	let durationDays = EvaluationItem(literal: Presentation.durationDays)
	let spSuccessfulAblation = EvaluationItem(literal: Presentation.spSuccessfulAblation)
	let separator = EvaluationItem(literal: Presentation.separator)
	let ventricularRateControl = EvaluationItem(literal: Presentation.ventricularRateControl)
	let rhythmControl = EvaluationItem(literal: Presentation.rhythmControl)
	let previousTIACVA = EvaluationItem(literal: Presentation.previousTIACVA)
	let thyrotoxicosis = EvaluationItem(literal: Presentation.thyrotoxicosis)
	let lastthromboembolicevent = EvaluationItem(literal: Presentation.lastthromboembolicevent)
//	let atrialFibrillationLabel = AtrialFibrilationLabel(literal: Presentation.atrialFibrillationLabel)
	let atrialFibrillationLabel = EvaluationItem(literal: Presentation.atrialFibrillationLabel)
	
	override var items: [EvaluationItem] {
		return [
					atrialFibrillationLabel,
					ventricularRateControl,
					rhythmControl,
					separator,
		        	chronicAF,
		        	persistentAF,
		        	paroxymalAF,
		        	durationDays,
		        	spSuccessfulAblation,
					symptomatic,
					previousTIACVA,
					lastthromboembolicevent
		]
	}
}

class Symptomatic: EvaluationItem {
	
	let acutely = EvaluationItem(literal: Presentation.acutely)
	override var items: [EvaluationItem] {
		return [acutely]
	}
}

class AtrialFibrilationLabel: EvaluationItem {
	let ventricularRateControl = VentricularRateControl(literal: Presentation.ventricularRateControl)
	let rhythmControl = RhythmControl(literal: Presentation.rhythmControl)
	
	override var items: [EvaluationItem] {
		return [ventricularRateControl,
		rhythmControl]
	}
}

class VentricularRateControl: EvaluationItem {
	let heartRateWithActivity = EvaluationItem(literal: Presentation.heartRateWithActivity)
	override var items: [EvaluationItem] {
		return [heartRateWithActivity]
	}
}

class RhythmControl: EvaluationItem {
	let blnCAA = CurrentAntiarrythmicTherapy(literal: Presentation.blnCAA)
	let blnliver = EvaluationItem(literal: Presentation.blnliver)
	
	override var items: [EvaluationItem] {
		return [
			blnCAA,
			blnliver
		]
	}
}

class CurrentAntiarrythmicTherapy: EvaluationItem {
	let blnclass1AA = EvaluationItem(literal: Presentation.blnclass1AA)
	let blnclass3AA = EvaluationItem(literal: Presentation.blnclass3AA)
	
	override var items: [EvaluationItem] {
		return [
			blnclass1AA,
			blnclass3AA
		]
	}
}


