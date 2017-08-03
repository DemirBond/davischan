//
//  ThromboembolicVKA.swift
//  CVDEvaluator
//
//  Created by bogdankosh on 2/6/17.
//  Copyright © 2017 IgorKhomiak. All rights reserved.
//

import Foundation

class ThromboembolicVKA: EvaluationItem {
	let thromboembolicPrevention = ThromboembolicPrevention(literal: Presentation.thromboembolicPrevention)
	let valvularHeartDiseaseThromboembolicPreventionandTherapy = ValvularHeartDiseaseInThrombVKA(literal: Presentation.valvularHeartDiseaseThromboembolicPreventionandTherapy)
	let otherCardiacSourceOfEmbolism = OtherCardiacSourceOfEmbolism(literal: Presentation.otherCardiacSourceOfEmbolism)
	let miscellaneous = Miscellaneous(literal: Presentation.miscellaneous)
	
	override var items: [EvaluationItem] {
		return [
			thromboembolicPrevention,
			valvularHeartDiseaseThromboembolicPreventionandTherapy,
			otherCardiacSourceOfEmbolism,
			miscellaneous
		]
	}
}


class ThromboembolicPrevention: EvaluationItem {
	let inr = EvaluationItem(literal: Presentation.inr)
	let bleedingRisk = BleedingRisk(literal: Presentation.bleedingRisk)
	let proceduralBleedingRisk = ProceduralBleedingRisk(literal: Presentation.proceduralBleedingRisk)
	let deepVenousThrombosis = EvaluationItem(literal: Presentation.deepVenousThrombosis)
	let pulmonaryEmbolism = EvaluationItem(literal: Presentation.pulmonaryEmbolism)
	let dvtpeDiagnosisPrevention = DvtpeDiagnosisPrevention(literal: Presentation.dvtpeDiagnosisPrevention)
	let acuteCVA = AcuteCVA(literal: Presentation.acuteCVA)
	
	override var items: [EvaluationItem] {
		return [
			inr,
			bleedingRisk,
			proceduralBleedingRisk,
			deepVenousThrombosis,
			pulmonaryEmbolism,
			dvtpeDiagnosisPrevention,
			acuteCVA
		]
	}

}

class ValvularHeartDiseaseInThrombVKA: EvaluationItem {
	let blncage = EvaluationItem(literal: Presentation.blncage)
	let blnmech = EvaluationItem(literal: Presentation.blnmech)
	let blnMdav = EvaluationItem(literal: Presentation.blnMdav)
	let blnRMVD = RMVD(literal: Presentation.blnRMVD)
	let blnbiop = EvaluationItem(literal: Presentation.blnbiop)
	let blnsysemb = EvaluationItem(literal: Presentation.blnsysemb)
	let blnIE = EvaluationItem(literal: Presentation.blnIE)
	let blnLPVT = EvaluationItem(literal: Presentation.blnLPVT)
	let blnRPVT = EvaluationItem(literal: Presentation.blnRPVT)
	
	override var items: [EvaluationItem] {
		return [
			blnsysemb,
			blncage,
			blnmech,
			blnMdav,
			blnRMVD,
			blnbiop,
			blnsysemb,
			blnIE,
			blnLPVT,
			blnRPVT
		]
	}
}

class RMVD: EvaluationItem {
	let blnLAthr = EvaluationItem(literal: Presentation.blnLAthr)
	let txtLAd = EvaluationItem(literal: Presentation.txtLAd)
	
	override var items: [EvaluationItem] {
		return [
			blnLAthr,
			txtLAd
		]
	}
}

class OtherCardiacSourceOfEmbolism: EvaluationItem {
	let blnArterialIschemic = EvaluationItem(literal: Presentation.blnArterialIschemic)
	let blnAorticArchAth = EvaluationItem(literal: Presentation.blnAorticArchAth)
	let blnLVt = EvaluationItem(literal: Presentation.blnLVt)
	let blnPFO = EvaluationItem(literal: Presentation.blnPFO)
	let blnMVP = EvaluationItem(literal: Presentation.blnMVP)
	let blnMitralAnnular = EvaluationItem(literal: Presentation.blnMitralAnnular)
	let blnCalcificAortic = EvaluationItem(literal: Presentation.blnCalcificAortic)
//	let blnHeparinIndThrom = EvaluationItem(literal: Presentation.blnHeparinIndThrom)
//	let blnApoA1 = EvaluationItem(literal: Presentation.blnApoA1)
//	let blnCerebralVenous = EvaluationItem(literal: Presentation.blnCerebralVenous)
	
	override var items: [EvaluationItem] {
		return [
			blnArterialIschemic,
			blnAorticArchAth,
			blnLVt,
			blnPFO,
			blnMVP,
			blnMitralAnnular,
			blnCalcificAortic
//			blnHeparinIndThrom,
//			blnApoA1,
//			blnCerebralVenous
		]
	}

}

class Miscellaneous: EvaluationItem {
	let hit = EvaluationItem(literal: Presentation.hit)
	let cerebralVenousThrombosis = EvaluationItem(literal: Presentation.cerebralVenousThrombosis)
	let hypercoagulableState = EvaluationItem(literal: Presentation.hypercoagulableState)
	
	override var items: [EvaluationItem] {
		return [
			hit,
			cerebralVenousThrombosis,
			hypercoagulableState
		]
	}
}

class BleedingRisk: EvaluationItem {
	let activeGastroduodenalUlcer = EvaluationItem(literal: Presentation.activeGastroduodenalUlcer)
	let bleedIn3MoBeforeAdmission = EvaluationItem(literal: Presentation.bleedIn3MoBeforeAdmission)
	let plateletCountLess50x190L = EvaluationItem(literal: Presentation.plateletCountLess50x190L)
	let icuOrCCUAdmission = EvaluationItem(literal: Presentation.icuOrCCUAdmission)
	let centralVenousCatheter = EvaluationItem(literal: Presentation.centralVenousCatheter)
	let rheumaticDisease = EvaluationItem(literal: Presentation.rheumaticDisease)

	override var items: [EvaluationItem] {
		return [
			activeGastroduodenalUlcer,
			bleedIn3MoBeforeAdmission,
			plateletCountLess50x190L,
			icuOrCCUAdmission,
			centralVenousCatheter,
			rheumaticDisease
		]
	}
}


// addbleeding
class ProceduralBleedingRisk: EvaluationItem {
	let priorBleedDuringBridgingSimilar = EvaluationItem(literal: Presentation.priorBleedDuringBridgingSimilar)
	let priorASAUse = EvaluationItem(literal: Presentation.priorASAUse)
	let riskClinicallyNotImportant = EvaluationItem(literal: Presentation.riskClinicallyNotImportant)
	let riskUncertain = EvaluationItem(literal: Presentation.riskUncertain)
	let riskIntermediateHigh = EvaluationItem(literal: Presentation.riskIntermediateHigh)
	
	override var items: [EvaluationItem] {
		return [
			priorBleedDuringBridgingSimilar,
			priorASAUse,
			riskClinicallyNotImportant,
			riskUncertain,
			riskIntermediateHigh
		]
	}
}

class DvtpeDiagnosisPrevention: EvaluationItem {

	let blngeneral = EvaluationItem(literal: Presentation.blngeneral)
	let blnurology = EvaluationItem(literal: Presentation.blnurology)
	let blnknee = EvaluationItem(literal: Presentation.blnknee)
	let blnhip = EvaluationItem(literal: Presentation.blnhip)
	let blnHPS = EvaluationItem(literal: Presentation.blnHPS)
	let blncancer = EvaluationItem(literal: Presentation.blncancer)
	let blnspinal = EvaluationItem(literal: Presentation.blnspinal)
	let blnacute = MedicalIllness(literal: Presentation.blnacute)

	
	override var items: [EvaluationItem] {
		return [
		blngeneral,
		blnurology,
		blnknee,
		blnhip,
		blnHPS,
		blncancer,
		blnspinal,
		blnacute
		]
	}
}

class MedicalIllness: EvaluationItem {
	
	let blnswelling = EvaluationItem(literal: Presentation.blnswelling)
	let blnactivecancer = EvaluationItem(literal: Presentation.blnactivecancer)
	let blnPVTE = EvaluationItem(literal: Presentation.blnPVTE)
	let blnRF = EvaluationItem(literal: Presentation.blnRF)
	let blnthrombo = EvaluationItem(literal: Presentation.blnthrombo)
	let blnrecent = EvaluationItem(literal: Presentation.blnrecent)
	let blnreduced = EvaluationItem(literal: Presentation.blnreduced)
	let blnhormone = EvaluationItem(literal: Presentation.blnhormone)
	let blninfection = EvaluationItem(literal: Presentation.blninfection)
	
	override var items: [EvaluationItem] {
		return [
			blnswelling,
			blnactivecancer,
//			blnPVTE,
			blnRF,
			blnthrombo,
			blnrecent,
			blnreduced,
			blnhormone,
			blninfection
		]
	}


}

class AcuteCVA: EvaluationItem {
	let nihss = EvaluationItem(literal: Presentation.nihss)
	let unilateralWeakness = EvaluationItem(literal: Presentation.unilateralWeakness)
	let speechDisturbance = EvaluationItem(literal: Presentation.speechDisturbance)
	let durationOfSymptoms = EvaluationItem(literal: Presentation.durationOfSymptoms)
	let preHospitalCare = EvaluationItem(literal: Presentation.preHospitalCare)

	override var items: [EvaluationItem] {
		return [
			nihss,
			unilateralWeakness,
			speechDisturbance,
			durationOfSymptoms,
			preHospitalCare
		]
	}

}
