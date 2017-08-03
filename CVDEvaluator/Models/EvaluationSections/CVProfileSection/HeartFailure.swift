//
//  HeartFailure.swift
//  CVDEvaluator
//
//  Created by bogdankosh on 2/6/17.
//  Copyright © 2017 IgorKhomiak. All rights reserved.
//

import UIKit

class HeartFailure: EvaluationItem {
	let separator = EvaluationItem(literal: Presentation.separator)
	
	let lvefInHF = EvaluationItem(literal: Presentation.lvefInHF)
	let hfDiagnosisDurationPerWeekInHF = EvaluationItem(literal: Presentation.hfDiagnosisDurationPerWeekInHF)
	let previousHFHospitalizationInHF = EvaluationItem(literal: Presentation.previousHFHospitalizationInHF)
	let spicdInHF = EvaluationItem(literal: Presentation.spicdInHF)
	
	let cRTI = EvaluationItem(literal: Presentation.cRTI)
	let lVEF = EvaluationItem(literal: Presentation.lVEF)
	
	let idiopathicDCMNonischemic = EvaluationItem(literal: Presentation.idiopathicDCMNonischemic)
	let postMIMore45Days = PostMIMore45Days(literal: Presentation.postMIMore45Days)
	let ischemicPostMILess45Day = EvaluationItem(literal: Presentation.ischemicPostMILess45Day)
	let cardiotoxis = EvaluationItem(literal: Presentation.cardiotoxis)
	let familiarCMPSuddenDeath = EvaluationItem(literal: Presentation.familiarCMPSuddenDeath)
	let myocarditis = EvaluationItem(literal: Presentation.myocarditis)
	let RVDysplasia = EvaluationItem(literal: Presentation.rvDysplasia)
	var hocm = HOCM(literal: Presentation.hocm)
	var peripartumCMP = EvaluationItem(literal: Presentation.peripartumCMP)
	let nyhaClass = NYHAClass(literal: Presentation.nyhaClass)

	override var items: [EvaluationItem] {
		return [
			lvefInHF,
			separator,
			hfDiagnosisDurationPerWeekInHF,
			previousHFHospitalizationInHF,
			spicdInHF,
			
			//separator,
			cRTI,
			lVEF,
			
			nyhaClass,
			separator,
			idiopathicDCMNonischemic,
			postMIMore45Days,
			ischemicPostMILess45Day,
			cardiotoxis,
			familiarCMPSuddenDeath,
			myocarditis,
			RVDysplasia,
			hocm,
			peripartumCMP
		]
	}
}

class PostMIMore45Days: EvaluationItem {
	let lvAneurysm = EvaluationItem(literal: Presentation.lvAneurysm)
	
	override var items: [EvaluationItem] {
		return [lvAneurysm]
	}
}

class HOCM: EvaluationItem {
	let lvh30mm = EvaluationItem(literal: Presentation.lvh30mm)
	let abnormalBPResponsetoExercise = EvaluationItem(literal: Presentation.abnormalBPResponsetoExercise)
	let familyHistoryOfSuddenDeath = EvaluationItem(literal: Presentation.familyHistoryOfSuddenDeath)
	let restDynamicPeakLVOT = EvaluationItem(literal: Presentation.restDynamicPeakLVOT)
	
	override var items: [EvaluationItem] {
		return [
			lvh30mm,
			abnormalBPResponsetoExercise,
			familyHistoryOfSuddenDeath,
			restDynamicPeakLVOT
		]
	}
}
