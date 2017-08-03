//
//  Syncope.swift
//  CVDEvaluator
//
//  Created by bogdankosh on 2/8/17.
//  Copyright © 2017 IgorKhomiak. All rights reserved.
//

import Foundation

class Syncope: EvaluationItem {
	
	let circumstanceLabel = EvaluationItem(literal: Presentation.circumstanceLabel)
	let uprightPositionPostExertion = EvaluationItem(literal: Presentation.uprightPositionPostExertion)
	let suddenNoiseOrEmotion = EvaluationItem(literal: Presentation.suddenNoiseOrEmotion)
	let neckMovementManipulation = EvaluationItem(literal: Presentation.neckMovementManipulation)
	let exertional = EvaluationItem(literal: Presentation.exertional)
	let sporadic = EvaluationItem(literal: Presentation.sporadic)
	
	let separator = EvaluationItem(literal: Presentation.separator)
	
	let prodromalSymptoms = EvaluationItem(literal: Presentation.prodromalSymptoms)
	let nausea = EvaluationItem(literal: Presentation.nausea)
	let dizziness = EvaluationItem(literal: Presentation.dizziness)
	let palpitations = EvaluationItem(literal: Presentation.palpitations)
	let chestPainInProdromalSymptoms = EvaluationItem(literal: Presentation.chestPainInProdromalSymptoms)
	let aura = EvaluationItem(literal: Presentation.aura)
	
	let syncopeDurationDuringSyncope = EvaluationItem(literal: Presentation.syncopeDurationDuringSyncope)
	let durationMinutesSeconds = EvaluationItem(literal: Presentation.durationMinutesSeconds)
	let cyanosis = EvaluationItem(literal: Presentation.cyanosisInPhysicalExam)
	let pallorDiaphoresis = EvaluationItem(literal: Presentation.pallorDiaphoresis)
	let unusualPosture = EvaluationItem(literal: Presentation.unusualPosture)
	
	let postictalSymptoms = EvaluationItem(literal: Presentation.postictalSymptoms)
	let disorientation = EvaluationItem.init(literal: Presentation.disorientation)
	let paralysis = EvaluationItem(literal: Presentation.paralysis)
	let chestPainInPostictalSymptoms = EvaluationItem(literal: Presentation.chestPainInPostictalSymptoms)
	let prolongedFatigue = EvaluationItem(literal: Presentation.prolongedFatigue)
	let traumaticInjury = EvaluationItem(literal: Presentation.traumaticInjury)
	
	override var items: [EvaluationItem] {
		return [
			circumstanceLabel,
			uprightPositionPostExertion,
			suddenNoiseOrEmotion,
			neckMovementManipulation,
			exertional,
			sporadic,
			
//			separator,
			
			prodromalSymptoms,
			nausea,
			dizziness,
			palpitations,
			chestPainInProdromalSymptoms,
			aura,
			
//			separator,
			
			syncopeDurationDuringSyncope,
			durationMinutesSeconds,
			cyanosis,
			pallorDiaphoresis,
			unusualPosture,
			
//			separator,
			
			postictalSymptoms,
			disorientation,
			paralysis,
			chestPainInPostictalSymptoms,
			prolongedFatigue,
			traumaticInjury
		]
	}
}
