//
//  CVProfile.swift
//  CVDEvaluator
//
//  Created by IgorKhomiak on 2/3/17.
//  Copyright © 2017 IgorKhomiak. All rights reserved.
//

import UIKit


// MARK: - CVProfile

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


// MARK: - CVProfile -> Coronary Heart Disease

class CoronaryHeartDisease: EvaluationItem {
	
	let acuteCoronarySyndrome = AcuteCoronarySyndrome(literal: Presentation.acuteCoronarySyndrome)
	let pcicabg = PCICABG(literal: Presentation.pcicabg)
	let stableAng = StableAng(literal: Presentation.stableAng)
	let lm = EvaluationItem(literal: Presentation.lm)
	let lad = EvaluationItem(literal: Presentation.lad)
	let rca = EvaluationItem(literal: Presentation.rca)
	let lcx = EvaluationItem(literal: Presentation.lcx)
	let icd10 = ICD10(literal: Presentation.icd10)
	let vesselmore50 = EvaluationItem(literal: Presentation.vesselmore50)
	let lvefInCHD = EvaluationItem(literal: Presentation.lvefInCHD)

	override var items: [EvaluationItem] {
		return [
			acuteCoronarySyndrome,
			pcicabg,
			stableAng,
			lm,
			lad,
			rca,
			lcx,
			icd10,
			vesselmore50,
			lvefInCHD
		]
	}
}


// MARK: - CVProfile -> Coronary Heart Disease -> Acute Coronary Syndrome

class AcuteCoronarySyndrome: EvaluationItem {
	
	let moreAnginaIn24Hours = EvaluationItem(literal: Presentation.moreAnginaIn24Hours)
	let anginaMore20min = EvaluationItem(literal: Presentation.anginaMore20min)
	let asaUseInPast1Week = EvaluationItem(literal: Presentation.ASAUseInPast1Week)
	let postiveTropIorT = EvaluationItem(literal: Presentation.postiveTropIorT)
	let moreTwoAntanginal = EvaluationItem(literal: Presentation.moreTwoAntanginal)
	let stemi = STEMI(literal: Presentation.stemi)
	let refractoryAngina = EvaluationItem(literal: Presentation.refractoryAngina)
	let changingTropI = EvaluationItem(literal: Presentation.changingTropI)
	
	override var items: [EvaluationItem] {
		return [
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


// MARK: - CVProfile -> Coronary Heart Disease -> Acute Coronary Syndrome -> STEMI

class STEMI: EvaluationItem {
	
	let durationhoursSTEMI = EvaluationItem(literal: Presentation.durationhoursSTEMI)
	let anteriorSTEMI = EvaluationItem(literal: Presentation.anteriorSTEMI)
	let inferiorSTEMI = EvaluationItem(literal: Presentation.inferiorSTEMI)
	let otherSTEMI = EvaluationItem(literal: Presentation.otherSTEMI)
	
	override var items: [EvaluationItem] {
		return [
			durationhoursSTEMI,
			anteriorSTEMI,
			inferiorSTEMI,
			otherSTEMI
		]
	}
}


// MARK: - CVProfile -> Coronary Heart Disease -> PCI/CABG

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


// MARK: - CVProfile -> Coronary Heart Disease -> PCI/CABG -> CABG

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


// MARK: - CVProfile -> Coronary Heart Disease -> STABLE ANG

class StableAng: EvaluationItem {
	
	let nyhaccvsClass1 = EvaluationItem(literal: Presentation.nyhaccvsClass1)
	let nyhaccvsClass2 = EvaluationItem(literal: Presentation.nyhaccvsClass2)
	let nyhaccvsClass3 = EvaluationItem(literal: Presentation.nyhaccvsClass3)
	let nyhaccvsClass4 = EvaluationItem(literal: Presentation.nyhaccvsClass4)
	
	override var items: [EvaluationItem] {
		return [
			nyhaccvsClass1,
			nyhaccvsClass2,
			nyhaccvsClass3,
			nyhaccvsClass4
		]
	}
}


// MARK: - CVProfile -> Coronary Heart Disease -> ICD-10

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


// MARK: - CVProfile -> Heart Failure

class HeartFailure: EvaluationItem {
	
	let separator = EvaluationItem(literal: Presentation.separator)
	
	let hfDiagnosisDurationPerWeekInHF = EvaluationItem(literal: Presentation.hfDiagnosisDurationPerWeekInHF)
	let previousHFHospitalizationInHF = EvaluationItem(literal: Presentation.previousHFHospitalizationInHF)
	let spicdInHF = EvaluationItem(literal: Presentation.spicdInHF)
	let cRTI = EvaluationItem(literal: Presentation.cRTI)
	let lvefInHF = EvaluationItem(literal: Presentation.lvefInHF)
	let nyhaClass = NYHAClass(literal: Presentation.nyhaClass)
	
	let idiopathicDCMNonischemic = EvaluationItem(literal: Presentation.idiopathicDCMNonischemic)
	let postMIMore45Days = PostMIMore45Days(literal: Presentation.postMIMore45Days)
	let ischemicPostMILess45Day = EvaluationItem(literal: Presentation.ischemicPostMILess45Day)
	let cardiotoxis = EvaluationItem(literal: Presentation.cardiotoxis)
	let familiarCMPSuddenDeath = EvaluationItem(literal: Presentation.familiarCMPSuddenDeath)
	let myocarditis = EvaluationItem(literal: Presentation.myocarditis)
	let RVDysplasia = EvaluationItem(literal: Presentation.rvDysplasia)
	var hocm = HOCM(literal: Presentation.hocm)
	var peripartumCMP = EvaluationItem(literal: Presentation.peripartumCMP)
	
	override var items: [EvaluationItem] {
		return [
			hfDiagnosisDurationPerWeekInHF,
			previousHFHospitalizationInHF,
			spicdInHF,
			cRTI,
			lvefInHF,
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


// MARK: - CVProfile -> Heart Failure -> Heart Failure Stage

class NYHAClass: EvaluationItem {
	
	let atHighRiskOfHF = EvaluationItem(literal: Presentation.atHighRiskOfHF)
	let structuralHeartDeseaseNoSymptoms = EvaluationItem(literal: Presentation.structuralHeartDeseaseNoSymptoms)
	let structuralHeartDeseaseSymptoms = EvaluationItem(literal: Presentation.structuralHeartDeseaseSymptoms)
	
	let refactoryHFInterventions = RefactoryHFInterventions(literal: Presentation.refactoryHFInterventions)
	
	let NYHACCSVClass1 = EvaluationItem(literal: Presentation.nyhaccvsClass1)
	let NYHACCSVClass2 = EvaluationItem(literal: Presentation.nyhaccvsClass2)
	let NYHACCSVClass3 = EvaluationItem(literal: Presentation.nyhaccvsClass3)
	let NYHACCSVClass4 = EvaluationItem(literal: Presentation.nyhaccvsClass4)
	
	override var items: [EvaluationItem] {
		return [
			atHighRiskOfHF,
			structuralHeartDeseaseNoSymptoms,
			structuralHeartDeseaseSymptoms,
			refactoryHFInterventions //,
			//NYHACCSVClass1,
			//NYHACCSVClass2,
			//NYHACCSVClass3,
			//NYHACCSVClass4
		]
	}
}


// MARK: - CVProfile -> Heart Failure -> Heart Failure Stage -> Refactory HF Interventions

class RefactoryHFInterventions: EvaluationItem {
	
	let calculateHFSS = EvaluationItem(literal: Presentation.calculateHFSS)
	let noSignificantComorbidities = EvaluationItem(literal: Presentation.noSignificantComorbidities)
	let vo2maxkg = EvaluationItem(literal: Presentation.vo2maxkg)
	
	override var items: [EvaluationItem] {
		return [
			calculateHFSS,
			noSignificantComorbidities,
			vo2maxkg
		]
	}
}


// MARK: - CVProfile -> Heart Failure -> Post MI

class PostMIMore45Days: EvaluationItem {
	
	let lvAneurysm = EvaluationItem(literal: Presentation.lvAneurysm)
	
	override var items: [EvaluationItem] {
		return [lvAneurysm]
	}
}


// MARK: - CVProfile -> Heart Failure -> HOCM

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


// MARK: - CVProfile -> Atrial Fibrillation

class AtrialFibrilation: EvaluationItem {
	
	let chronicAF = EvaluationItem(literal: Presentation.chronicAF)
	let persistentAF = EvaluationItem(literal: Presentation.persistentAF)
	let paroxymalAF = EvaluationItem(literal: Presentation.paroxymalAF)
	let spSuccessfulAblation = EvaluationItem(literal: Presentation.spSuccessfulAblation)
	
	let atrialFibrillationLabel = EvaluationItem(literal: Presentation.atrialFibrillationLabel)
	let rhythmControl = EvaluationItem(literal: Presentation.rhythmControl)
	let ventricularRateControl = EvaluationItem(literal: Presentation.ventricularRateControl)
	//let atrialFibrillationLabel = AtrialFibrilationLabel(literal: Presentation.atrialFibrillationLabel)
	
	let symptomatic = Symptomatic(literal: Presentation.symptomatic)
	let durationDays = EvaluationItem(literal: Presentation.durationDays)
	let separator = EvaluationItem(literal: Presentation.separator)
	
	let previousTIACVA = EvaluationItem(literal: Presentation.previousTIACVA)
	let lastthromboembolicevent = EvaluationItem(literal: Presentation.lastthromboembolicevent)
	
	override var items: [EvaluationItem] {
		return [
			chronicAF,
			persistentAF,
			paroxymalAF,
			spSuccessfulAblation,
			
			atrialFibrillationLabel,
			rhythmControl,
			ventricularRateControl,
			separator,
			
			symptomatic,
			durationDays,
			separator,
			
			previousTIACVA,
			lastthromboembolicevent
		]
	}
}


// MARK: - CVProfile -> Atrial Fibrillation -> Select VR Control

class AtrialFibrilationLabel: EvaluationItem {
	let rhythmControl = RhythmControl(literal: Presentation.rhythmControl)
	let ventricularRateControl = VentricularRateControl(literal: Presentation.ventricularRateControl)
	
	override var items: [EvaluationItem] {
		return [
			rhythmControl,
			ventricularRateControl
		]
	}
}


// MARK: - CVProfile -> Atrial Fibrillation -> Rhythm Control

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


// MARK: - CVProfile -> Atrial Fibrillation -> Rhythm Control -> Current Antiarrythmic Therapy

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


// MARK: - CVProfile -> Atrial Fibrillation -> VR Control

class VentricularRateControl: EvaluationItem {
	let heartRateWithActivity = EvaluationItem(literal: Presentation.heartRateWithActivity)
	override var items: [EvaluationItem] {
		return [heartRateWithActivity]
	}
}


// MARK: - CVProfile -> Atrial Fibrillation -> Symptomatic

class Symptomatic: EvaluationItem {
	
	let acutely = EvaluationItem(literal: Presentation.acutely)
	
	override var items: [EvaluationItem] {
		return [acutely]
	}
}


// MARK: - CVProfile -> Thromboembolic/VKA

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


// MARK: - CVProfile -> Thromboembolic/VKA -> Thromboembolism / VKA

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


// MARK: - CVProfile -> Thromboembolic/VKA -> Thromboembolism / VKA -> Patient Related Bleeding Risk

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
			//rheumaticDisease
		]
	}
}


// MARK: - CVProfile -> Thromboembolic/VKA -> Thromboembolism / VKA -> Procedure related Bleeding Risk

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


// MARK: - CVProfile -> Thromboembolic/VKA -> Thromboembolism / VKA -> DVT/PE Diagnosis/Prevention

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


// MARK: - CVProfile -> Thromboembolic/VKA -> Thromboembolism / VKA -> DVT/PE Diagnosis/Prevention -> Medical Illness

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
			//blnPVTE,
			blnRF,
			blnthrombo,
			blnrecent,
			blnreduced,
			blnhormone,
			blninfection
		]
	}
}


// MARK: - CVProfile -> Thromboembolic/VKA -> Thromboembolism / VKA -> Acute CVA

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


// MARK: - CVProfile -> Thromboembolic/VKA -> Valvular Heart Disease

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


// MARK: - CVProfile -> Thromboembolic/VKA -> Valvular Heart Disease -> Rheumatic Mitral Valve Disease

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


// MARK: - CVProfile -> Thromboembolic/VKA -> Other Cardiac Source of Embolism

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
			//blnHeparinIndThrom,
			//blnApoA1,
			//blnCerebralVenous
		]
	}
}


// MARK: - CVProfile -> Thromboembolic/VKA -> Miscellaneous

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


// MARK: - CVProfile -> Ventricular Tachyarrthymias

class VentricularTachyarrthymias: EvaluationItem {
	
	let nsvt = EvaluationItem(literal: Presentation.nsvt)
	let monomorphicVT = EvaluationItem(literal: Presentation.monomorphicVT)
	let repetitiveMonomorphicVT = EvaluationItem(literal: Presentation.repetitiveMonomorphicVT)
	let polymorphicVT = EvaluationItem(literal: Presentation.polymorphicVT)
	let torsades = EvaluationItem(literal: Presentation.torsades)
	let incessantVT = EvaluationItem(literal: Presentation.incessantVT)
	let idiopathicVT = EvaluationItem(literal: Presentation.idiopathicVT)
	
	override var items: [EvaluationItem] {
		return [
			nsvt,
			monomorphicVT,
			repetitiveMonomorphicVT,
			polymorphicVT,
			torsades,
			incessantVT,
			idiopathicVT
		]
	}	
}


// MARK: - CVProfile -> Bradyarrthymia/Syncope

class BradyarrthymiaSyncope: EvaluationItem {
	
	let symptomaticSinusNodeDysfunction = EvaluationItem(literal: Presentation.symptomaticSinusNodeDysfunction)
	let highGradeAVNodeDisease = EvaluationItem(literal: Presentation.highGradeAVNodeDisease)
	let isolatedNeurocardionegicUnexplainedSyncope = EvaluationItem(literal: Presentation.isolatedNeurocardionegicUnexplainedSyncope)
	let carotidSinusHypersensitivity = EvaluationItem(literal: Presentation.carotidSinusHypersensitivity)
	let pots = EvaluationItem(literal: Presentation.pots)
	let autonomicFailureSyndrome = EvaluationItem(literal: Presentation.autonomicFailureSyndrome)
	let historyOfCardiacArrest = EvaluationItem(literal: Presentation.historyOfCardiacArrest)
	let brugadaSyndrome = EvaluationItem(literal: Presentation.brugadaSyndrome)
	let longQT = EvaluationItem(literal: Presentation.longQT)
	let sarcoidosisGiantCellChagas = EvaluationItem(literal: Presentation.sarcoidosisGiantCellChagas)
	
	override var items: [EvaluationItem] {
		return [
			symptomaticSinusNodeDysfunction,
			highGradeAVNodeDisease,
			isolatedNeurocardionegicUnexplainedSyncope,
			carotidSinusHypersensitivity,
			pots,
			autonomicFailureSyndrome,
			historyOfCardiacArrest,
			brugadaSyndrome,
			longQT,
			sarcoidosisGiantCellChagas
		]
	}
}


// MARK: - CVProfile -> Valvular Heart Disease

class ValvularHeartDisease: EvaluationItem {
	// TODO: Content is missing or unclear

/*	let newonsetAF = EvaluationItem(literal: Presentation.newonsetAF)
	let aorticStenosis = EvaluationItem(literal: Presentation.aorticStenosis)
	let secvalvular = EvaluationItem(literal: Presentation.secvalvular)
	let calcAortValve = EvaluationItem(literal: Presentation.calcAortValve)
	let reumaticAV = EvaluationItem(literal: Presentation.reumaticAV)
	let congenStenAortValve = EvaluationItem(literal: Presentation.congenStenAortValve)
	let calcAortValveArea  = EvaluationItem(literal: Presentation.calcAortValveArea )
	let aortMeanPressGradient = EvaluationItem(literal: Presentation.aortMeanPressGradient)
	let aortRootDiameter = EvaluationItem(literal: Presentation.aortRootDiameter)
	
	let mitralStenosis = EvaluationItem(literal: Presentation.mitralStenosis)
	let mVA = EvaluationItem(literal: Presentation.mVA)
	let pHT = EvaluationItem(literal: Presentation.pHT)
	let rheumaticMV = EvaluationItem(literal: Presentation.rheumaticMV)
	let favValveMorph = EvaluationItem(literal: Presentation.favValveMorph )
	let lAClot = EvaluationItem(literal: Presentation.lAClot)
	let pulmonicStenosis  = EvaluationItem(literal: Presentation.pulmonicStenosis)
	let tricuspidStenosis = EvaluationItem(literal: Presentation.tricuspidStenosis)
	let pulValveVel = EvaluationItem(literal: Presentation.pulValveVel)
	let aorticRegurgitation = EvaluationItem(literal: Presentation.aorticRegurgitation)
	let holodiastolicRev = EvaluationItem(literal: Presentation.holodiastolicRev)
	let venaContractaWidth2 = EvaluationItem(literal: Presentation.venaContractaWidth2)
	let venaContractaWidth = EvaluationItem(literal: Presentation.venaContractaWidth)
	let regurVolume = EvaluationItem(literal: Presentation.regurVolume)
	let regurFrac = EvaluationItem(literal: Presentation.regurFrac)
	let eRO  = EvaluationItem(literal: Presentation.eRO)
	let lVESd = EvaluationItem(literal: Presentation.lVESd)
	let lVEDd = EvaluationItem(literal: Presentation.lVEDd)
	
	let aorticRootDiameter = EvaluationItem(literal: Presentation.aorticRootDiameter)
	let mitralRegurgitation = EvaluationItem(literal: Presentation.mitralRegurgitation)
	let tricuspidRegurgitation = EvaluationItem(literal: Presentation.tricuspidRegurgitation)
	let annularDiameter = EvaluationItem(literal: Presentation.annularDiameter)
	let centralJetArea = EvaluationItem(literal: Presentation.centralJetArea)
	let hepaticVeinFlowRev = EvaluationItem(literal: Presentation.hepaticVeinFlowRev)
	let abTVleaflet  = EvaluationItem(literal: Presentation.abTVleaflet)
	let pulmonicRegurgitation = EvaluationItem(literal: Presentation.pulmonicRegurgitation)
	let wideRegurJet = EvaluationItem(literal: Presentation.wideRegurJet)
	let abnpulval = EvaluationItem(literal: Presentation.abnpulval)
	let valvular_surgery_risk = EvaluationItem(literal: Presentation.valvular_surgery_risk)
	let vavularRiskLabel = EvaluationItem(literal: Presentation.vavularRiskLabel)
	let lowrisk = EvaluationItem(literal: Presentation.lowrisk)
	let intermediaterisk = EvaluationItem(literal: Presentation.intermediaterisk)
	let highrisk = EvaluationItem(literal: Presentation.highrisk)
	let prohibitive  = EvaluationItem(literal: Presentation.prohibitive)
	let other_surgical_risk = EvaluationItem(literal: Presentation.other_surgical_risk)
	let sep = EvaluationItem(literal: Presentation.separator)
	let vascular  = EvaluationItem(literal: Presentation.vascular)
	let lowriskelec = EvaluationItem(literal: Presentation.lowriskelec)
	let cardiac  = EvaluationItem(literal: Presentation.cardiac)
	
	override var items: [EvaluationItem] {
		return [
			newonsetAF,
			aorticStenosis,
			secvalvular,
			calcAortValve,
			reumaticAV,
			congenStenAortValve,
			calcAortValveArea,
			aortMeanPressGradient,
			aortRootDiameter,
			mitralStenosis,
			mVA,
			pHT,
			rheumaticMV,
			favValveMorph,
			lAClot,
			pulmonicStenosis,
			tricuspidStenosis,
			pulValveVel,
			aorticRegurgitation,
			holodiastolicRev,
			venaContractaWidth2,
			venaContractaWidth,
			regurVolume,
			regurFrac,
			eRO,
			lVESd,
			lVEDd,
			
			aorticRootDiameter,
			mitralRegurgitation,
			tricuspidRegurgitation,
			annularDiameter,
			centralJetArea,
			hepaticVeinFlowRev,
			abTVleaflet,
			pulmonicRegurgitation,
			wideRegurJet,
			abnpulval,
			valvular_surgery_risk,
			vavularRiskLabel,
			lowrisk,
			intermediaterisk,
			highrisk,
			prohibitive,
			other_surgical_risk,
			sep,
			vascular,
			lowriskelec,
			cardiac
		]
	}*/
}


// MARK: - CVProfile -> Pulmonary Hybertension

class PulmonaryHypertension: EvaluationItem {
	// TODO: Content is missing or unclear
}


// MARK: - CVProfile -> Vascular Disease

class VascularDisease: EvaluationItem {
	
	let symptomaticCarotidDisease = SymptomaticCarotidDisease(literal: Presentation.symptomaticCarotidDisease)
	let periphericVascularDisease = PeriphericVascularDisease(literal: Presentation.periphericVascularDisease)
	let abdomialAoritcAneurysm = AbdomialAoritcAneurysm(literal: Presentation.abdomialAoritcAneurysm)
	
	override var items: [EvaluationItem] {
		return [
			symptomaticCarotidDisease,
			periphericVascularDisease,
			abdomialAoritcAneurysm
		]
	}
}


// MARK: - CVProfile -> Vascular Disease -> Symptomatic Carotid Disease

class SymptomaticCarotidDisease: EvaluationItem {
	
	let noncardioembolicVCATIAAssoicaedWithCarotidPlaque = NoncardioembolicVCATIAAssoicaedWithCarotidPlaque(literal: Presentation.noncardioembolicVCATIAAssoicaedWithCarotidPlaque)
	let more50CarotidStenosisSPCEA = EvaluationItem(literal: Presentation.more50CarotidStenosisSPCEA)
	let noncardioembolicTIAAssoicaedWithCarotidPlaque = EvaluationItem(literal: Presentation.noncardioembolicTIAAssoicaedWithCarotidPlaque)
	
	override var items: [EvaluationItem] {
		return [
			noncardioembolicVCATIAAssoicaedWithCarotidPlaque,
			noncardioembolicTIAAssoicaedWithCarotidPlaque,
			more50CarotidStenosisSPCEA
		]
	}
}


// MARK: - CVProfile -> Vascular Disease -> Symptomatic Carotid Disease -> Noncardioembolic VCA/TIA Associated with Carotid Plaque

class NoncardioembolicVCATIAAssoicaedWithCarotidPlaque: EvaluationItem {
	// Mark: Content misssing
}


// MARK: - CVProfile -> Vascular Disease -> Peripheric Vascular Disease

class PeriphericVascularDisease: EvaluationItem {
	
	let abiLess09 = EvaluationItem(literal: Presentation.abiLess09)
	let claudication = EvaluationItem(literal: Presentation.claudication)
	let criticalLimbIschemia = EvaluationItem(literal: Presentation.criticalLimbIschemia)
	let endovascularRevascularization = EvaluationItem(literal: Presentation.endovascularRevascularization)
	let peripheralArteryBypassGraft = EvaluationItem(literal: Presentation.peripheralArteryBypassGraft)
	
	override var items: [EvaluationItem] {
		return [
			abiLess09,
			claudication,
			criticalLimbIschemia,
			endovascularRevascularization,
			peripheralArteryBypassGraft
		]
	}
}


// MARK: - CVProfile -> Vascular Disease -> Abdominal Aoritc Aneurysm

class AbdomialAoritcAneurysm: EvaluationItem {
	
	let aaDiameteMore5cm = EvaluationItem(literal: Presentation.aaDiameteMore5cm)
	let thoracic = EvaluationItem(literal: Presentation.thoracic)
	let thoracoabdominal = EvaluationItem(literal: Presentation.thoracoabdominal)
	
	override var items: [EvaluationItem] {
		return [
			aaDiameteMore5cm,
			thoracic,
			thoracoabdominal
		]
	}
}
