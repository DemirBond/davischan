//
//  CoronaryHeartDisease.swift
//  CVDEvaluator
//
//  Created by bogdankosh on 2/6/17.
//  Copyright © 2017 IgorKhomiak. All rights reserved.
//

import UIKit

class CoronaryHeartDisease: EvaluationItem {
	let acuteCoronarySyndrome = AcuteCoronarySyndrome(literal: Presentation.acuteCoronarySyndrome)
	let pcicabg = PCICABG(literal: Presentation.pcicabg)
	let stableAng = StableAng(literal: Presentation.stableAng)
	let icd10 = ICD10(literal: Presentation.icd10)
	let lm = EvaluationItem(literal: Presentation.lm)
	let lad = EvaluationItem(literal: Presentation.lad)
	let rca = EvaluationItem(literal: Presentation.rca)
	let lcx = EvaluationItem(literal: Presentation.lcx)
	let vesselmore50 = EvaluationItem(literal: Presentation.vesselmore50)
	let lvefInCHD = EvaluationItem(literal: Presentation.lvefInCHD)
		override var items: [EvaluationItem] {
		return [acuteCoronarySyndrome, pcicabg, stableAng, lm, lad, rca, lcx, icd10, vesselmore50, lvefInCHD]
	}
}

class AcuteCoronarySyndrome: EvaluationItem {
	let moreAnginaIn24Hours = EvaluationItem(literal: Presentation.moreAnginaIn24Hours)
	let anginaMore20min = EvaluationItem(literal: Presentation.anginaMore20min)
	let asaUseInPast1Week = EvaluationItem(literal: Presentation.asaUseInPast1Week)
	let postiveTropIorT = EvaluationItem(literal: Presentation.postiveTropIorT)
	let moreTwoAntanginal = EvaluationItem(literal: Presentation.moreTwoAntanginal)
	let stemi = STEMI(literal: Presentation.stemi)
	let refractoryAngina = EvaluationItem(literal: Presentation.refractoryAngina)
	let changingTropI = EvaluationItem(literal: Presentation.changingTropI)
	
	override var items: [EvaluationItem] {
		return
			[
				moreAnginaIn24Hours,
				anginaMore20min,
				asaUseInPast1Week,
				postiveTropIorT,
				moreTwoAntanginal,
				stemi,
				refractoryAngina,
				changingTropI
		]
	}
}

class STEMI: EvaluationItem {
	let anteriorSTEMI = EvaluationItem(literal: Presentation.anteriorSTEMI)
	let inferiorSTEMI = EvaluationItem(literal: Presentation.inferiorSTEMI)
	let otherSTEMI = EvaluationItem(literal: Presentation.otherSTEMI)
	
	override var items: [EvaluationItem] {
		return [anteriorSTEMI, inferiorSTEMI, otherSTEMI]
	}
}

class PCICABG: EvaluationItem {
	let lastProcedureYearsAgo = EvaluationItem(literal: Presentation.lastProcedureYearsAgo)
	let bms = EvaluationItem(literal: Presentation.bms)
	let des = EvaluationItem(literal: Presentation.des)
	let cabg = CABG(literal: Presentation.cabg)
	
	override var items: [EvaluationItem] {
		return [
			lastProcedureYearsAgo,
			bms,
			des,
			cabg
		]
	}
}

class CABG: EvaluationItem {
	let autoVein = EvaluationItem(literal: Presentation.autoVein)
	let autoArtery = EvaluationItem(literal: Presentation.autoArtery)
	let nonAuto = EvaluationItem(literal: Presentation.nonAuto)
	
	override var items: [EvaluationItem] {
		return [
			autoVein,
			autoArtery,
			nonAuto
		]
	}
}

class StableAng: EvaluationItem {
	let nyhaccvsClass1 = EvaluationItem(literal: Presentation.nyhaccvsClass1)
	let nyhaccvsClass2 = EvaluationItem(literal: Presentation.nyhaccvsClass2)
	let nyhaccvsClass3 = EvaluationItem(literal: Presentation.nyhaccvsClass3)
	let nyhaccvsClass4 = EvaluationItem(literal: Presentation.nyhaccvsClass4)
	
	override var items: [EvaluationItem] {
		return [nyhaccvsClass1, nyhaccvsClass2, nyhaccvsClass3, nyhaccvsClass4]
	}

}

class ICD10: EvaluationItem {
	let chronicTotalOcclusion = EvaluationItem(literal: Presentation.chronicTotalOcclusion)
	let coronoaryAneurysm = EvaluationItem(literal: Presentation.coronoaryAneurysm)
	let coronaryDissection = EvaluationItem(literal: Presentation.coronaryDissection)
	let calcifiedCoronaryLesion = EvaluationItem(literal: Presentation.calcifiedCoronaryLesion)
	let lipidRichPlaque = EvaluationItem(literal: Presentation.lipidRichPlaque)
	let documentedVasospasm = EvaluationItem(literal: Presentation.documentedVasospasm)
	
	override var items: [EvaluationItem] {
		return [
			chronicTotalOcclusion,
			coronoaryAneurysm,
			coronaryDissection,
			calcifiedCoronaryLesion,
			lipidRichPlaque,
			documentedVasospasm
		]
	}
}
