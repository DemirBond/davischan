//
//  Symptoms.swift
//  CVDEvaluator
//
//  Created by IgorKhomiak on 2/3/17.
//  Copyright © 2017 IgorKhomiak. All rights reserved.
//

import UIKit

class Dyspnea: EvaluationItem {
	
	enum Admission: Int {
		case unknown
		case outpatient
		case emergency
	}

	enum InHospital: Int {
		case unknown
		case day1
		case day2
		case day3
	}

	enum hf: Int {
		case unknown
		case chronicHFWithKnownEtiology
		case newOnsetSuspectedHF
	}
	
	let outpatient = EvaluationItem(literal: Presentation.outpatient)
	let emergencyRoom = EvaluationItem(literal: Presentation.emergencyRoom)
	
	let separator1 = EvaluationItem(literal: Presentation.separator)
	
	let inHospitalLabel = InHospitalLabel(literal: Presentation.inHospitalLabel)
	
	
	let pleaseSelectOneLabel = EvaluationItem(literal: Presentation.pleaseSelectOneLabel)

	let chronicHFWithKnownEtiology = EvaluationItem(literal: Presentation.chronicHFWithKnownEtiology)
	let newOnsetSuspectedHF = EvaluationItem(literal: Presentation.newOnsetSuspectedHF)
	
	let dyspneaOnExertionNotAtRest = DyspneaOnExertionNotAtRest(literal: Presentation.dyspneaOnExertionNotAtRest)
	
	let nyhaaClass1  = EvaluationItem(literal: Presentation.NYHACCSVClass1)
	let nyhaaClass2  = EvaluationItem(literal: Presentation.NYHACCSVClass2)
	let nyhaaClass3  = EvaluationItem(literal: Presentation.NYHACCSVClass3)
	let dyspneaAtRestOrphopnea = NYHAClass(literal: Presentation.dyspneaAtRestOrphopnea)
	// let dyspneaAtRestOrphopnea = EvaluationItem(literal: Presentation.dyspneaAtRestOrphopnea)
	let nyhaaClass4  = EvaluationItem(literal: Presentation.NYHACCSVClass4)
	
	let weightGain = EvaluationItem(literal: Presentation.weightGain)
	// MARK: Need to clarify placeholder's string
	let hfDiagnosisDurationPerWeek = EvaluationItem(literal: Presentation.hfDiagnosisDurationPerWeek)
	let previousHFHospitalization = EvaluationItem(literal: Presentation.previousHFHospitalization)
	let spicd = EvaluationItem(literal: Presentation.spicd)
	let lvef = EvaluationItem(literal: Presentation.lvef)
	
	// TODO: Separator
	let separator = EvaluationItem(literal: Presentation.separator)

	
	override var items: [EvaluationItem] {
		return [
			pleaseSelectOneLabel,
			chronicHFWithKnownEtiology,
			newOnsetSuspectedHF,
			separator1,
			outpatient,
			emergencyRoom,
			inHospitalLabel,
			separator1,
			dyspneaOnExertionNotAtRest,
			
			nyhaaClass1,
			nyhaaClass2,
			nyhaaClass3,
			dyspneaAtRestOrphopnea,
			nyhaaClass4,
			
			
			weightGain,

		]
	}
}


class InHospitalLabel: EvaluationItem{
	let day1 = EvaluationItem(literal: Presentation.day1)
	let day2 = EvaluationItem(literal: Presentation.day2)
	let day3 = EvaluationItem(literal: Presentation.day3)
	
	override var items: [EvaluationItem]{
		return [
			day1,
			day2,
			day3
		]
	}
	
}

class DyspneaOnExertionNotAtRest: EvaluationItem {
	
	let strenousExertion = EvaluationItem(literal: Presentation.strenousExertion)
	let moreThanDailyRoutine = EvaluationItem(literal: Presentation.moreThanDailyRoutine)
	let dailyRoutineMinimalActivities = EvaluationItem(literal: Presentation.dailyRoutineMinimalActivities)
	
	override var items: [EvaluationItem] {
		return [strenousExertion, moreThanDailyRoutine, dailyRoutineMinimalActivities]
	}
}

class NYHAClass: EvaluationItem {
	let atHighRiskOfHF = EvaluationItem(literal: Presentation.atHighRiskOfHF)
	let structuralHeartDeseaseNoSymptoms = EvaluationItem(literal: Presentation.structuralHeartDeseaseNoSymptoms)
	let structuralHeartDeseaseSymptoms = EvaluationItem(literal: Presentation.structuralHeartDeseaseSymptoms)
	
	let refactoryHFInterventions = RefactoryHFInterventions(literal: Presentation.refactoryHFInterventions)

	let NYHACCSVClass1 = EvaluationItem(literal: Presentation.NYHACCSVClass1)
	let NYHACCSVClass2 = EvaluationItem(literal: Presentation.NYHACCSVClass2)
	let NYHACCSVClass3 = EvaluationItem(literal: Presentation.NYHACCSVClass3)
	let NYHACCSVClass4 = EvaluationItem(literal: Presentation.NYHACCSVClass4)
	
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

class ChestPain: EvaluationItem {
	let emergencyRoom = EmergencyRoomInChestPain(literal: Presentation.emergencyRoomInChestPain)
	var typicalAnginaNew = TypicalAnginaNewInChestPain(literal: Presentation.typicalAnginaNewInChestPain)
	let probableAngina = ProbableAnginaInChestPain(literal: Presentation.probablyAnginaNewInChestPain)
	var undeterminedCP = UndeterminedCPInChestPain(literal: Presentation.undeterminedCPNewInChestPain)
	let unableToExercise = EvaluationItem(literal: Presentation.unableToExerciseInChestPain)
	
	override var items: [EvaluationItem] {
		return [
			emergencyRoom,
			typicalAnginaNew,
			probableAngina,
			undeterminedCP,
			unableToExercise
		]
	}
}

class EmergencyRoomInChestPain: EvaluationItem {
	let more2TypicalOrProbableAngina = EvaluationItem(literal: Presentation.more2TypicalOrProbableAngina)
	let typicalOrProbableAnginaMore20Min = EvaluationItem(literal: Presentation.typicalOrProbableAnginaMore20Min)
	let ASAUseInPast1Week = EvaluationItem(literal: Presentation.ASAUseInPast1Week)
	let positiveTroponin = PositiveTroponin(literal: Presentation.positiveTroponin)
		override var items: [EvaluationItem] {
		return [more2TypicalOrProbableAngina, typicalOrProbableAnginaMore20Min, ASAUseInPast1Week, positiveTroponin]
	}
}

class TypicalAnginaNewInChestPain: EvaluationItem {
	var escaladingInFrequency = EvaluationItem(literal: Presentation.escalatingInFrequency)
	
	override var items: [EvaluationItem] {
		return [escaladingInFrequency]
	}
}

// MARK: - Undetermined

class UndeterminedCPInChestPain: EvaluationItem {
	let sideSemithorax = SideSemithorax(literal: Presentation.sideSemithorax)
	let intercostalCP = IntercostalCP(literal: Presentation.intercostalCP)
	let сentralPrecordialCP = CentralPrecordialCP(literal: Presentation.сentralPrecordialCP)
	override var items: [EvaluationItem] {
		return [sideSemithorax, intercostalCP, сentralPrecordialCP]
	}
}

class ProbableAnginaInChestPain: EvaluationItem {
	let probableEscalatingInFrequency = EvaluationItem(literal: Presentation.probableEscalatingInFrequency)
	
	override var items: [EvaluationItem] {
		return [probableEscalatingInFrequency]
	}
}

//
class SideSemithorax: EvaluationItem {
	
	let separator = EvaluationItem(literal: Presentation.separator)
	let qualityLabel = EvaluationItem(literal: Presentation.qualityLabel)
	let aggravatedByLabel = EvaluationItem(literal: Presentation.aggravatedByLabel)
	let relievedByLabel = EvaluationItem(literal: Presentation.relievedByLabel)
	let radiationLabel = EvaluationItem(literal: Presentation.radiationLabel)
	let associatedWithLabel = EvaluationItem(literal: Presentation.associatedWithLabel)
	let lastingLabel = EvaluationItem(literal: Presentation.lastingLabel)
	
	let blnCPSharp = EvaluationItem(literal: Presentation.blnCPSharp)
	let blnCPPressure = EvaluationItem(literal: Presentation.blnCPPressure)
	let blnCPTightness = EvaluationItem(literal: Presentation.blnCPTightness)
	let blnCPSoreness = EvaluationItem(literal: Presentation.blnCPSoreness)
	let blnTearing = EvaluationItem(literal: Presentation.blnTearing)
	let blnCPLying = EvaluationItem(literal: Presentation.blnCPLying)
	let blnCPBreathing = EvaluationItem(literal: Presentation.blnCPBreathing)
	let blnCPCoughing = EvaluationItem(literal: Presentation.blnCPCoughing)
	let blnCPExertion = EvaluationItem(literal: Presentation.blnCPExertion)
	let blnCPPalpation = EvaluationItem(literal: Presentation.blnCPPalpation)
	let blnCPNTG = EvaluationItem(literal: Presentation.blnCPNTG)
	let blnCPRest = EvaluationItem(literal: Presentation.blnCPRest)
	let blnCPSitting = EvaluationItem(literal: Presentation.blnCPSitting)
	let blnCPlyingside = EvaluationItem(literal: Presentation.blnCPlyingside)
	let blnCPAnalgesics = EvaluationItem(literal: Presentation.blnCPAnalgesics)
	let blnCPJaw = EvaluationItem(literal: Presentation.blnCPJaw)
	let blnCPBack = EvaluationItem(literal: Presentation.blnCPBack)
	let blnCPArm = EvaluationItem(literal: Presentation.blnCPArm)
	let blnCPDyspnea = EvaluationItem(literal: Presentation.blnCPDyspnea)
	let blnCPNausea = EvaluationItem(literal: Presentation.blnCPNausea)
	let blnCPDiaph = EvaluationItem(literal: Presentation.blnCPDiaph)
	let blnCPFaint = EvaluationItem(literal: Presentation.blnCPFaint)
	let blnCPPalpitations = EvaluationItem(literal: Presentation.blnCPPalpitations)
	let blnCPseconds = EvaluationItem(literal: Presentation.blnCPseconds)
	let blnCPminutes = EvaluationItem(literal: Presentation.blnCPminutes)
	let blnCPhours = EvaluationItem(literal: Presentation.blnCPhours)
	let blnCPconstant = EvaluationItem(literal: Presentation.blnCPconstant)

	
	override var items: [EvaluationItem] {
		return [
			qualityLabel,
			blnCPSharp,
			blnCPPressure,
			blnCPTightness,
			blnCPSoreness,
			blnTearing,
			
//			separator,
			aggravatedByLabel,
			
			blnCPLying,
			blnCPBreathing,
			blnCPCoughing,
			blnCPExertion,
			blnCPPalpation,
			
//			separator,
			relievedByLabel,
			blnCPNTG,
			blnCPRest,
			blnCPSitting,
			blnCPlyingside,
			blnCPAnalgesics,
			
//			separator,
			radiationLabel,
			blnCPJaw,
			blnCPBack,
			blnCPArm,
			
//			separator,
			associatedWithLabel,
			blnCPDyspnea,
			blnCPNausea,
			blnCPDiaph,
			blnCPFaint,
			blnCPPalpitations,
			
//			separator,
			lastingLabel,
			blnCPseconds,
			blnCPminutes,
			blnCPhours,
			blnCPconstant
		]
	}
}

class IntercostalCP: EvaluationItem {
	
	let separator = EvaluationItem(literal: Presentation.separator)
	let qualityLabel = EvaluationItem(literal: Presentation.qualityLabel)
	let aggravatedByLabel = EvaluationItem(literal: Presentation.aggravatedByLabel)
	let relievedByLabel = EvaluationItem(literal: Presentation.relievedByLabel)
	let radiationLabel = EvaluationItem(literal: Presentation.radiationLabel)
	let associatedWithLabel = EvaluationItem(literal: Presentation.associatedWithLabel)
	let lastingLabel = EvaluationItem(literal: Presentation.lastingLabel)
	
	let blnCPSharp = EvaluationItem(literal: Presentation.blnCPSharp)
	let blnCPPressure = EvaluationItem(literal: Presentation.blnCPPressure)
	let blnCPTightness = EvaluationItem(literal: Presentation.blnCPTightness)
	let blnCPSoreness = EvaluationItem(literal: Presentation.blnCPSoreness)
	let blnTearing = EvaluationItem(literal: Presentation.blnTearing)
	let blnCPLying = EvaluationItem(literal: Presentation.blnCPLying)
	let blnCPBreathing = EvaluationItem(literal: Presentation.blnCPBreathing)
	let blnCPCoughing = EvaluationItem(literal: Presentation.blnCPCoughing)
	let blnCPExertion = EvaluationItem(literal: Presentation.blnCPExertion)
	let blnCPPalpation = EvaluationItem(literal: Presentation.blnCPPalpation)
	let blnCPNTG = EvaluationItem(literal: Presentation.blnCPNTG)
	let blnCPRest = EvaluationItem(literal: Presentation.blnCPRest)
	let blnCPSitting = EvaluationItem(literal: Presentation.blnCPSitting)
	let blnCPlyingside = EvaluationItem(literal: Presentation.blnCPlyingside)
	let blnCPAnalgesics = EvaluationItem(literal: Presentation.blnCPAnalgesics)
	let blnCPJaw = EvaluationItem(literal: Presentation.blnCPJaw)
	let blnCPBack = EvaluationItem(literal: Presentation.blnCPBack)
	let blnCPArm = EvaluationItem(literal: Presentation.blnCPArm)
	let blnCPDyspnea = EvaluationItem(literal: Presentation.blnCPDyspnea)
	let blnCPNausea = EvaluationItem(literal: Presentation.blnCPNausea)
	let blnCPDiaph = EvaluationItem(literal: Presentation.blnCPDiaph)
	let blnCPFaint = EvaluationItem(literal: Presentation.blnCPFaint)
	let blnCPPalpitations = EvaluationItem(literal: Presentation.blnCPPalpitations)
	let blnCPseconds = EvaluationItem(literal: Presentation.blnCPseconds)
	let blnCPminutes = EvaluationItem(literal: Presentation.blnCPminutes)
	let blnCPhours = EvaluationItem(literal: Presentation.blnCPhours)
	let blnCPconstant = EvaluationItem(literal: Presentation.blnCPconstant)
	
	override var items: [EvaluationItem] {
		return [
			qualityLabel,
			blnCPSharp,
			blnCPPressure,
			blnCPTightness,
			blnCPSoreness,
			blnTearing,
			
//			separator,
			aggravatedByLabel,
			
			blnCPLying,
			blnCPBreathing,
			blnCPCoughing,
			blnCPExertion,
			blnCPPalpation,
			blnCPNTG,
			
//			separator,
			relievedByLabel,
			blnCPRest,
			blnCPSitting,
			blnCPlyingside,
			blnCPAnalgesics,
			
//			separator,
			radiationLabel,
			blnCPJaw,
			blnCPBack,
			blnCPArm,
			
//			separator,
			associatedWithLabel,
			blnCPDyspnea,
			blnCPNausea,
			blnCPDiaph,
			blnCPFaint,
			blnCPPalpitations,
			
//			separator,
			lastingLabel,
			blnCPseconds,
			blnCPminutes,
			blnCPhours,
			blnCPconstant
		]
	}
}

class CentralPrecordialCP: EvaluationItem {
	
	let separator = EvaluationItem(literal: Presentation.separator)
	let qualityLabel = EvaluationItem(literal: Presentation.qualityLabel)
	let aggravatedByLabel = EvaluationItem(literal: Presentation.aggravatedByLabel)
	let relievedByLabel = EvaluationItem(literal: Presentation.relievedByLabel)
	let radiationLabel = EvaluationItem(literal: Presentation.radiationLabel)
	let associatedWithLabel = EvaluationItem(literal: Presentation.associatedWithLabel)
	let lastingLabel = EvaluationItem(literal: Presentation.lastingLabel)
	
	let blnCPSharp = EvaluationItem(literal: Presentation.blnCPSharp)
	let blnCPPressure = EvaluationItem(literal: Presentation.blnCPPressure)
	let blnCPTightness = EvaluationItem(literal: Presentation.blnCPTightness)
	let blnCPSoreness = EvaluationItem(literal: Presentation.blnCPSoreness)
	let blnTearing = EvaluationItem(literal: Presentation.blnTearing)
	let blnCPLying = EvaluationItem(literal: Presentation.blnCPLying)
	let blnCPBreathing = EvaluationItem(literal: Presentation.blnCPBreathing)
	let blnCPCoughing = EvaluationItem(literal: Presentation.blnCPCoughing)
	let blnCPExertion = EvaluationItem(literal: Presentation.blnCPExertion)
	let blnCPPalpation = EvaluationItem(literal: Presentation.blnCPPalpation)
	let blnCPNTG = EvaluationItem(literal: Presentation.blnCPNTG)
	let blnCPRest = EvaluationItem(literal: Presentation.blnCPRest)
	let blnCPSitting = EvaluationItem(literal: Presentation.blnCPSitting)
	let blnCPlyingside = EvaluationItem(literal: Presentation.blnCPlyingside)
	let blnCPAnalgesics = EvaluationItem(literal: Presentation.blnCPAnalgesics)
	let blnCPJaw = EvaluationItem(literal: Presentation.blnCPJaw)
	let blnCPBack = EvaluationItem(literal: Presentation.blnCPBack)
	let blnCPArm = EvaluationItem(literal: Presentation.blnCPArm)
	let blnCPDyspnea = EvaluationItem(literal: Presentation.blnCPDyspnea)
	let blnCPNausea = EvaluationItem(literal: Presentation.blnCPNausea)
	let blnCPDiaph = EvaluationItem(literal: Presentation.blnCPDiaph)
	let blnCPFaint = EvaluationItem(literal: Presentation.blnCPFaint)
	let blnCPPalpitations = EvaluationItem(literal: Presentation.blnCPPalpitations)
	let blnCPseconds = EvaluationItem(literal: Presentation.blnCPseconds)
	let blnCPminutes = EvaluationItem(literal: Presentation.blnCPminutes)
	let blnCPhours = EvaluationItem(literal: Presentation.blnCPhours)
	let blnCPconstant = EvaluationItem(literal: Presentation.blnCPconstant)
	
	override var items: [EvaluationItem] {
		return [
			qualityLabel,
			blnCPSharp,
			blnCPPressure,
			blnCPTightness,
			blnCPSoreness,
			blnTearing,
			
//			separator,
			aggravatedByLabel,
			
			blnCPLying,
			blnCPBreathing,
			blnCPCoughing,
			blnCPExertion,
			blnCPPalpation,
			blnCPNTG,
			
//			separator,
			relievedByLabel,
			blnCPRest,
			blnCPSitting,
			blnCPlyingside,
			blnCPAnalgesics,
			
//			separator,
			radiationLabel,
			blnCPJaw,
			blnCPBack,
			blnCPArm,
			
//			separator,
			associatedWithLabel,
			blnCPDyspnea,
			blnCPNausea,
			blnCPDiaph,
			blnCPFaint,
			blnCPPalpitations,
			
//			separator,
			lastingLabel,
			blnCPseconds,
			blnCPminutes,
			blnCPhours,
			blnCPconstant
		]
	}
}

class Weakness: EvaluationItem {
	let weakness = EvaluationItem(literal: Presentation.malaiseFatigue)
	
	override var items: [EvaluationItem] {
		return [weakness ]
	}
}

class AbdominalPain: EvaluationItem {
	
	 //
	let qualityAbdominalPainLabel = EvaluationItem(literal: Presentation.qualityAbdominalPainLabel)
	let sharpQualityAbdominalPain = EvaluationItem(literal: Presentation.sharpQualityAbdominalPain)
	let colickyQualityAbdominalPain = EvaluationItem(literal: Presentation.colickyQualityAbdominalPain)
	let achingQualityAbdominalPain = EvaluationItem(literal: Presentation.achingQualityAbdominalPain)
	
	//
	let locationAbdominalPainLabel = EvaluationItem(literal: Presentation.locationAbdominalPainLabel)
	let epigastricFindAbdominalPain = EvaluationItem(literal: Presentation.epigastricFindAbdominalPain)
	let periumbilicalLocationAbdominalPain = EvaluationItem(literal: Presentation.periumbilicalLocationAbdominalPain)
	let suprapubicEdemaLocationAbdominalPain = EvaluationItem(literal: Presentation.suprapubicEdemaLocationAbdominalPain)
	let refferedAbdominalPain = EvaluationItem(literal: Presentation.refferedAbdominalPain)
	
	//
	let associatedFindingsAbdominalPainLabel = EvaluationItem(literal: Presentation.associatedFindingsAbdominalPainLabel)
	let abdominalFindings = EvaluationItem(literal: Presentation.abdominalFindings)
	let reboundFindings = EvaluationItem(literal: Presentation.reboundFindings)
	let pulsatileFindings = EvaluationItem(literal: Presentation.pulsatileFindings)
	let bowelFindings = EvaluationItem(literal: Presentation.bowelFindings)
	let psoasFindings = EvaluationItem(literal: Presentation.psoasFindings)
	let mcburneyFindings = EvaluationItem(literal: Presentation.mcburneyFindings)
	let rovsingsignFindings = EvaluationItem(literal: Presentation.rovsingsignFindings)
	let murphysignFindings = EvaluationItem(literal: Presentation.murphysignFindings)
	let obturatorFindings = EvaluationItem(literal: Presentation.obturatorFindings)
	let carnettsignFindings = EvaluationItem(literal: Presentation.carnettsignFindings)
	let costovertebralFindings = EvaluationItem(literal: Presentation.costovertebralFindings)
	let skinfindingsFindings = SkinAbdominalPain(literal: Presentation.skinfindingsFindings)
	
	//
	let associatedSymptomsAbdominalPainLabel = EvaluationItem(literal: Presentation.associatedSymptomsAbdominalPainLabel)
	let vomitingAbdominalPain = VomitAbdominalPain(literal: Presentation.vomitingSymptoms)
	let anorexiaSymptoms = EvaluationItem(literal: Presentation.anorexiaSymptoms)
	let bowelHabitSymptoms = EvaluationItem(literal: Presentation.bowelHabitSymptoms)
	let operativeSymptoms = EvaluationItem(literal: Presentation.operativeSymptoms)
	let familyhistorySymptoms = EvaluationItem(literal: Presentation.familyhistorySymptoms)
	let obgynSymptoms = EvaluationItem(literal: Presentation.obgynSymptoms)
	let hematuriaSymptoms = EvaluationItem(literal: Presentation.hematuriaSymptoms)
	let urinarySymptoms = EvaluationItem(literal: Presentation.urinarySymptoms)
	
	
	override var items: [EvaluationItem] {
		return [
			qualityAbdominalPainLabel,
			sharpQualityAbdominalPain,
		   colickyQualityAbdominalPain,
		   achingQualityAbdominalPain,
		   locationAbdominalPainLabel,
			epigastricFindAbdominalPain,
			periumbilicalLocationAbdominalPain,
			suprapubicEdemaLocationAbdominalPain,
			refferedAbdominalPain,
			
			
			associatedFindingsAbdominalPainLabel,
			abdominalFindings,
			reboundFindings,
			pulsatileFindings,
			bowelFindings,
			psoasFindings,
			mcburneyFindings,
			rovsingsignFindings,
			murphysignFindings,
			rovsingsignFindings,
			murphysignFindings,
			obturatorFindings,
			carnettsignFindings,
			costovertebralFindings,
			skinfindingsFindings,
			
			
		   associatedSymptomsAbdominalPainLabel,
			vomitingAbdominalPain,
			anorexiaSymptoms,
			bowelHabitSymptoms,
			operativeSymptoms,
			familyhistorySymptoms,
			obgynSymptoms,
			hematuriaSymptoms,
			urinarySymptoms
		]
	}
	
	
	/*
	let abdominalFindings = EvaluationItem(literal: Presentation.abdominalFindings)
	let reboundFindings = EvaluationItem(literal: Presentation.reboundFindings)
	let pulsatileFindings = EvaluationItem(literal: Presentation.pulsatileFindings)
	let bowelFindings = EvaluationItem(literal: Presentation.bowelFindings)
	let psoasFindings = EvaluationItem(literal: Presentation.psoasFindings)
	let mcburneyFindings = EvaluationItem(literal: Presentation.mcburneyFindings)
	let rovsingsignFindings = EvaluationItem(literal: Presentation.rovsingsignFindings)
	let murphysignFindings = EvaluationItem(literal: Presentation.murphysignFindings)
	let obturatorFindings = EvaluationItem(literal: Presentation.obturatorFindings)
	let carnettsignFindings = EvaluationItem(literal: Presentation.carnettsignFindings)
	let costovertebralFindings = EvaluationItem(literal: Presentation.costovertebralFindings)
	let skinfindingsFindings = SkinAbdominalPain(literal: Presentation.skinfindingsFindings)
	//let skinfindingsFindings = EvaluationItem(literal: Presentation.skinfindingsFindings)
	
	override var items: [EvaluationItem] {
		return [
			abdominalFindings,
			reboundFindings,
			pulsatileFindings,
			bowelFindings,
			psoasFindings,
			mcburneyFindings,
			rovsingsignFindings,
			murphysignFindings,
			obturatorFindings,
			carnettsignFindings,
			costovertebralFindings,
			skinfindingsFindings
		]
	}
	*/
	
	class SkinAbdominalPain: EvaluationItem {
		
		let wallSkinFindings = EvaluationItem(literal: Presentation.wallSkinFindings)
		let herpesSkinFindings = EvaluationItem(literal: Presentation.herpesSkinFindings)
		let rashSkinFindings = EvaluationItem(literal: Presentation.rashSkinFindings)
		let celulitisSkinFindings = EvaluationItem(literal: Presentation.celulitisSkinFindings)
		let jaundiceSkinFindings = EvaluationItem(literal: Presentation.jaundiceSkinFindings)
		let caoutmedusaSkinFindings = EvaluationItem(literal: Presentation.caoutmedusaSkinFindings)
		
		
		
		override var items: [EvaluationItem] {
			return [
				wallSkinFindings,
				herpesSkinFindings,
				rashSkinFindings,
				celulitisSkinFindings,
				jaundiceSkinFindings,
				caoutmedusaSkinFindings
			]
		}
		
	}
	
	class VomitAbdominalPain: EvaluationItem {
		
		let vomitingVomitSymptoms = EvaluationItem(literal: Presentation.vomitingVomitSymptoms)
		let abdominalVomitSymptoms = EvaluationItem(literal: Presentation.abdominalVomitSymptoms)
		
		override var items: [EvaluationItem] {
			return [
				vomitingVomitSymptoms,
				abdominalVomitSymptoms
			]
		}
		
	}

}

class Palpitations: EvaluationItem  {
	
	// frequency
	let frequencyPalpitationsLabel = EvaluationItem(literal: Presentation.frequencyPalpitationsLabel)
	let dailyFreqPalpitations = EvaluationItem(literal: Presentation.dailyFreqPalpitations)
	let weeklyFreqPalpitations = EvaluationItem(literal: Presentation.weeklyFreqPalpitations)
	let monthlyFreqPalpitations = EvaluationItem(literal: Presentation.monthlyFreqPalpitations)
	let yearlyFreqPalpitations = EvaluationItem(literal: Presentation.yearlyFreqPalpitations)
	
	// type
	let typePalpitationsLabel = EvaluationItem(literal: Presentation.typePalpitationsLabel)
	let extrasystolicTypePalpitations = EvaluationItem(literal: Presentation.extrasystolicTypePalpitations)
	let tachycardicTypePalpitations = TachycardicPalpitations(literal: Presentation.tachycardicTypePalpitations)
	let anxietyTypePalpitations = EvaluationItem(literal: Presentation.anxietyTypePalpitations)
	let pulsationTypePalpitations = EvaluationItem(literal: Presentation.pulsationTypePalpitations)
	
	// duration
	let durationPalpitationsLabel = EvaluationItem(literal: Presentation.durationPalpitationsLabel)
	let secondsDurationPalpitations = EvaluationItem(literal: Presentation.secondsDurationPalpitations)
	let minutesDurationPalpitations = EvaluationItem(literal: Presentation.minutesDurationPalpitations)
	let hoursDurationPalpitations = EvaluationItem(literal: Presentation.hoursDurationPalpitations)
	
	// syncope
	let syncopePalpitationsLabel = EvaluationItem(literal: Presentation.syncopePalpitationsLabel)
	let palSyncopePalpitations = EvaluationItem(literal: Presentation.palSyncopePalpitations)
	let anginaSyncopePalpitations = EvaluationItem(literal: Presentation.anginaSyncopePalpitations)
	let pulsationsSyncopePalpitations = EvaluationItem(literal: Presentation.pulsationsSyncopePalpitations)
	let polyuriaSyncopePalpitations = EvaluationItem(literal: Presentation.polyuriaSyncopePalpitations)
	
	// ekg
	let ekgPalpitationsLabel = EvaluationItem(literal: Presentation.ekgPalpitationsLabel)
	let nsrEkgPalpitations = EvaluationItem(literal: Presentation.nsrEkgPalpitations)
	let regularEkgPalpitations = EvaluationItem(literal: Presentation.regularEkgPalpitations)
	let irregularEkgPalpitations = EvaluationItem(literal: Presentation.irregularEkgPalpitations)
	
	// onset
	let onsetPalpitationsLabel = EvaluationItem(literal: Presentation.onsetPalpitationsLabel)
	let suddenOnsetPalpitations = EvaluationItem(literal: Presentation.suddenOnsetPalpitations)
	let positionOnsetPalpitations = EvaluationItem(literal: Presentation.positionOnsetPalpitations)
	let exertionOnsetPalpitations = EvaluationItem(literal: Presentation.exertionOnsetPalpitations)
	let postexertionOnsetPalpitations = EvaluationItem(literal: Presentation.postexertionOnsetPalpitations)
	
	class TachycardicPalpitations: EvaluationItem {
		
		let abruptTachycardicTypePalpitations = EvaluationItem(literal: Presentation.abruptTachycardicTypePalpitations)
		let gradualTachycardicTypePalpitations = EvaluationItem(literal: Presentation.gradualTachycardicTypePalpitations)
		let noresponseTachycardicTypePalpitations = EvaluationItem(literal: Presentation.noresponseTachycardicTypePalpitations)
		
		override var items: [EvaluationItem] {
			return [
				abruptTachycardicTypePalpitations,
				gradualTachycardicTypePalpitations,
				noresponseTachycardicTypePalpitations
			]
		}
	}
	
	override var items: [EvaluationItem] {
		
		return [
			
			frequencyPalpitationsLabel,
			dailyFreqPalpitations,
			weeklyFreqPalpitations,
			monthlyFreqPalpitations,
			yearlyFreqPalpitations,
			
			typePalpitationsLabel,
			extrasystolicTypePalpitations,
			tachycardicTypePalpitations,
			anxietyTypePalpitations,
			pulsationTypePalpitations,
			
			durationPalpitationsLabel,
			secondsDurationPalpitations,
			minutesDurationPalpitations,
			hoursDurationPalpitations,
			
			syncopePalpitationsLabel,
			palSyncopePalpitations,
			anginaSyncopePalpitations,
			pulsationsSyncopePalpitations,
			polyuriaSyncopePalpitations,
			
			ekgPalpitationsLabel,
			nsrEkgPalpitations,
			regularEkgPalpitations,
			irregularEkgPalpitations,
			
			onsetPalpitationsLabel,
			suddenOnsetPalpitations,
			positionOnsetPalpitations,
			exertionOnsetPalpitations,
			postexertionOnsetPalpitations
		]
	}
	
	/*
	class DurationPalpitations: EvaluationItem {
		
		let secondsDurationPalpitations = EvaluationItem(literal: Presentation.secondsDurationPalpitations)
		let minutesDurationPalpitations = EvaluationItem(literal: Presentation.minutesDurationPalpitations)
		let hoursDurationPalpitations = EvaluationItem(literal: Presentation.hoursDurationPalpitations)
		
		override var items: [EvaluationItem] {
			return [
				secondsDurationPalpitations,
				minutesDurationPalpitations,
				hoursDurationPalpitations
			]
		}
		
	}
	
	class SyncopePalpitations: EvaluationItem {
		
		let palSyncopePalpitations = EvaluationItem(literal: Presentation.palSyncopePalpitations)
		let anginaSyncopePalpitations = EvaluationItem(literal: Presentation.anginaSyncopePalpitations)
		let pulsationsSyncopePalpitations = EvaluationItem(literal: Presentation.pulsationsSyncopePalpitations)
		let polyuriaSyncopePalpitations = EvaluationItem(literal: Presentation.polyuriaSyncopePalpitations)
		
		
		override var items: [EvaluationItem] {
			return [
				palSyncopePalpitations,
				anginaSyncopePalpitations,
				pulsationsSyncopePalpitations,
				polyuriaSyncopePalpitations
			]
			
		}
		
	}
	
	class EKGPalpitations: EvaluationItem {
		
		let nsrEkgPalpitations = EvaluationItem(literal: Presentation.nsrEkgPalpitations)
		let regularEkgPalpitations = EvaluationItem(literal: Presentation.regularEkgPalpitations)
		let irregularEkgPalpitations = EvaluationItem(literal: Presentation.irregularEkgPalpitations)
		
		override var items: [EvaluationItem] {
			return [
				nsrEkgPalpitations,
				regularEkgPalpitations,
				irregularEkgPalpitations
			]
		}
		
	}
	
	class OnsetPalpitations: EvaluationItem {
		
		let suddenOnsetPalpitations = EvaluationItem(literal: Presentation.suddenOnsetPalpitations)
		let positionOnsetPalpitations = EvaluationItem(literal: Presentation.positionOnsetPalpitations)
		let exertionOnsetPalpitations = EvaluationItem(literal: Presentation.exertionOnsetPalpitations)
		let postexertionOnsetPalpitations = EvaluationItem(literal: Presentation.postexertionOnsetPalpitations)
		
		
		override var items: [EvaluationItem] {
			return [
				suddenOnsetPalpitations,
				positionOnsetPalpitations,
				exertionOnsetPalpitations,
				postexertionOnsetPalpitations
			]
		}
	}
	*/
	
	
}

class Symptoms: EvaluationItem {
	var dyspnea = Dyspnea(literal: Presentation.dyspnea)
	var chestPain = ChestPain(literal: Presentation.chestPain)
	var syncope = Syncope(literal: Presentation.syncope)
	
	let edema = EdemaInPhysicalExam(literal: Presentation.edemaInSymptoms )
	let weakness  = Weakness(literal: Presentation.weakness )
	let palpitations = Palpitations(literal: Presentation.palpitationsInSymptoms)
	let abdominalPain  = AbdominalPain(literal: Presentation.abdominalPain )
	let shock = ShockInPhysicalExam(literal: Presentation.shock )
	
	override var items: [EvaluationItem] {

		return [dyspnea,
		        chestPain,
		        syncope,
				  edema,
				  weakness,
				  palpitations,
				  abdominalPain,
				  shock
		]
	}
}

class PositiveTroponin: EvaluationItem {
	let blntrop2 = EvaluationItem(literal: Presentation.blntrop2)
	let blntrop3 = EvaluationItem(literal: Presentation.blntrop3)
	
	override var items: [EvaluationItem] {
		return [blntrop2, blntrop3]
	}
}
