//
//  Diagnostics.swift
//  CVDEvaluator
//
//  Created by bogdankosh on 2/14/17.
//  Copyright © 2017 IgorKhomiak. All rights reserved.
//

import Foundation


// MARK: - Diagnostics

class Diagnostics: EvaluationItem {
	
	let ekg = EKG(literal: Presentation.ekg)
	let stressTesting = StressTesting(literal: Presentation.stressTesting)
	let echocardiography = Echocardiography(literal: Presentation.echocardiography)
	let chestXRay = ChestXRay(literal: Presentation.chestXRay)
	let rhc = RHC(literal: Presentation.rhc)
	let coronaryCalciumScore = EvaluationItem(literal: Presentation.coronaryCalciumScore)
	let total = EvaluationItem(literal: Presentation.total)

	override var items: [EvaluationItem] {
		return [
			ekg,
			stressTesting,
			echocardiography,
			chestXRay,
			rhc,
			coronaryCalciumScore,
			total
		]
	}
}


// MARK: - Diagnostics -> EKG

class EKG: EvaluationItem {
	
	let NSRInEKG = EvaluationItem(literal: Presentation.nsrInEKG)
	let svt = EvaluationItem(literal: Presentation.svt)
	let atrialFibrillationInEKG = EvaluationItem(literal: Presentation.atrialFibrillationInEKG)
	let atrialFlutter = AtrialFlutter(literal: Presentation.atrialFlutter)
	let prDuration  = EvaluationItem(literal: Presentation.prDuration)
	let qrsDuration = EvaluationItem(literal: Presentation.qrsDuration)
	let nonspecificSTAbnormality = EvaluationItem(literal: Presentation.nonspecificSTAbnormality)
	let stDeviation05mm = EvaluationItem(literal: Presentation.stDeviation05mm)
	let tWaveInversion1mm = EvaluationItem(literal: Presentation.tWaveInversion1mm)
	let lvh = EvaluationItem(literal: Presentation.lvh)
	let lowVoltageQRS = EvaluationItem(literal: Presentation.lowVoltageQRS)
	let abnormalQWaves = EvaluationItem(literal: Presentation.abnormalQWaves)
	let lbbb = EvaluationItem(literal: Presentation.lbbb)
	let bifascicular = EvaluationItem(literal: Presentation.bifascicular)
	let lahb = EvaluationItem(literal: Presentation.lahb)
	let lphb = EvaluationItem(literal: Presentation.lphb)
	let wpw = EvaluationItem(literal: Presentation.wpw)
	let vpace = EvaluationItem(literal: Presentation.vpace)
	let rbbb = EvaluationItem(literal: Presentation.rbbb)
	let intraventicularBlock = EvaluationItem(literal: Presentation.intraventicularBlock)
	let atrialPrematureDepolarization = EvaluationItem(literal: Presentation.atrialPrematureDepolarization)
	let junctionalPrematureDepolarization = EvaluationItem(literal: Presentation.junctionalPrematureDepolarization)
	let frequentVentricularPacingOrEctopy = EvaluationItem(literal: Presentation.frequentVentricularPacingOrEctopy)
	let infrequentVentricularPacingOrEctopy = EvaluationItem(literal: Presentation.infrequentVentricularPacingOrEctopy)
	let firstDegreeAVBlock = EvaluationItem(literal: Presentation.firstDegreeAVBlock)
	let secondDegreeAVBlock = SecondDegreeAVBlock(literal: Presentation.secondDegreeAVBlock)
	let thirdDegreeAVBlock = EvaluationItem(literal: Presentation.thirdDegreeAVBlock)
	
//	let urineNaMeqlInEKG = EvaluationItem(literal: Presentation.urineNaMeqlInEKG)
//	let serumOsmolalityInEKG = EvaluationItem(literal: Presentation.serumOsmolalityInEKG)
//	let stressTestingInEKG = EvaluationItem(literal: Presentation.stressTestingInEKG)

	override var items: [EvaluationItem] {
		return [
			NSRInEKG,
			svt,
			atrialFibrillationInEKG,
			atrialFlutter,
			prDuration,
			qrsDuration,
			nonspecificSTAbnormality,
			stDeviation05mm,
			tWaveInversion1mm,
			lvh,
			lowVoltageQRS,
			abnormalQWaves,
			lbbb,
			bifascicular,
			lahb,
			lphb,
			wpw,
			vpace,
			rbbb,
			intraventicularBlock,
			atrialPrematureDepolarization,
			junctionalPrematureDepolarization,
			frequentVentricularPacingOrEctopy,
			infrequentVentricularPacingOrEctopy,
			firstDegreeAVBlock,
			secondDegreeAVBlock,
			thirdDegreeAVBlock
		]
	}
}


// MARK: - Diagnostics -> EKG -> AtrialFlutter

class AtrialFlutter: EvaluationItem {
	
	let typicalAF = EvaluationItem(literal: Presentation.typicalAF)
	let atypicalAF = EvaluationItem(literal: Presentation.atypicalAF)
	
	override var items: [EvaluationItem] {
		return [typicalAF, atypicalAF]
	}
}


// MARK: - Diagnostics -> EKG -> SecondDegreeAVBlock

class SecondDegreeAVBlock: EvaluationItem {
	
	let type1 = EvaluationItem(literal: Presentation.type1)
	let type2 = EvaluationItem(literal: Presentation.type2)
	
	override var items: [EvaluationItem] {
		return [type1, type2]
	}
}


// MARK: - Diagnostics -> Stress Testing

class StressTesting: EvaluationItem {
	
	let dukeTreadmillScore = EvaluationItem(literal: Presentation.dukeTreadmillScore)
	let serumStressSummedScore = EvaluationItem(literal: Presentation.serumStressSummedScore)
	let stressDifferenceScore = EvaluationItem(literal: Presentation.stressDifferenceScore)
	let percentIschemicMyocardiumonMPS = EvaluationItem(literal: Presentation.percentIschemicMyocardiumonMPS)
	let tidOrSignificantDysfunction = EvaluationItem(literal: Presentation.tidOrSignificantDysfunction)
	let exTimeMin = EvaluationItem(literal: Presentation.exTimeMin)
	let maxSTMm = EvaluationItem(literal: Presentation.maxSTMm)
	let anginaIndex = AnginaIndex(literal: Presentation.anginaIndex)
	let stElevation = EvaluationItem(literal: Presentation.stElevation)
	let abnormalBPResponse = EvaluationItem(literal: Presentation.abnormalBPResponse)
	let ventricularTachycardia = EvaluationItem(literal: Presentation.ventricularTachycardia)
	let prolongSTDepression = EvaluationItem(literal: Presentation.prolongSTDepression)
	let fixedPerfusionDefects = FixedPerfusionDefects(literal: Presentation.fixedPerfusionDefects)
	let dseIschemicThreshold = EvaluationItem(literal: Presentation.dseIschemicThreshold)
	let dseOrStressMRI = EvaluationItem(literal: Presentation.dseOrStressMRI)
	let artifactualUninterpretableImages = EvaluationItem(literal: Presentation.artifactualUninterpretableImages)
	
	override var items: [EvaluationItem] {
		return [
			dukeTreadmillScore,
			serumStressSummedScore,
			stressDifferenceScore,
			percentIschemicMyocardiumonMPS,
			tidOrSignificantDysfunction,
			exTimeMin,
			maxSTMm,
			anginaIndex,
			stElevation,
			abnormalBPResponse,
			ventricularTachycardia,
			prolongSTDepression,
			fixedPerfusionDefects,
			dseIschemicThreshold,
			dseOrStressMRI,
			artifactualUninterpretableImages
		]
	}
}


// MARK: - Diagnostics -> Stress Testing -> AnginaIndex

class AnginaIndex: EvaluationItem {
	
	let noAnginaDuringExercise = EvaluationItem(literal: Presentation.noAnginaDuringExercise)
	let nonLimitingAngina = EvaluationItem(literal: Presentation.nonLimitingAngina)
	let exerciseLimitingAngina = EvaluationItem(literal: Presentation.exerciseLimitingAngina)
	
	override var items: [EvaluationItem] {
		return [
			noAnginaDuringExercise,
			nonLimitingAngina,
			exerciseLimitingAngina
		]
	}
}


// MARK: - Diagnostics -> Stress Testing -> Fixed Perfusion Defects

class FixedPerfusionDefects: EvaluationItem {
	
	let viabilityPresent = EvaluationItem(literal: Presentation.viabilityPresent)
	
	override var items: [EvaluationItem] {
		return [viabilityPresent]
	}
}


// MARK: - Diagnostics -> Echocardiography

class Echocardiography: EvaluationItem {
	
	let pericardialEffusion = EvaluationItem(literal: Presentation.pericardialEffusion)
	let rwma = EvaluationItem(literal: Presentation.rwma)
	let enlargedLAOrLVH = EvaluationItem(literal: Presentation.enlargedLAOrLVH)
	let ea05AndDTMore280ms = EvaluationItem(literal: Presentation.ea05AndDTMore280ms)
	let gradeMore2DiastolicDysfunction = EvaluationItem(literal: Presentation.gradeMore2DiastolicDysfunction)
	let respiratoryIVSShift = EvaluationItem(literal: Presentation.respiratoryIVSShift)
	let mitralEVariation = EvaluationItem(literal: Presentation.mitralEVariation)
	let hepaticVeinExpDiastolicReversal = EvaluationItem(literal: Presentation.hepaticVeinExpDiastolicReversal)
	let enlargedRA = EvaluationItem(literal: Presentation.enlargedRA)
	let enlargedRV = EvaluationItem(literal: Presentation.enlargedRV)
	let midsystolicNotch = EvaluationItem(literal: Presentation.midsystolicNotch)
	let lvLaterealAnnulusEE = EvaluationItem(literal: Presentation.lvLaterealAnnulusEE)
	let lvefInEchocardiography = EvaluationItem(literal: Presentation.lvefInEchocardiography)
	let trjVelocityMsec = EvaluationItem(literal: Presentation.trjVelocityMsec)
	
	override var items: [EvaluationItem] {
		return [
			pericardialEffusion,
			rwma,
			enlargedLAOrLVH,
			ea05AndDTMore280ms,
			gradeMore2DiastolicDysfunction,
			respiratoryIVSShift,
			mitralEVariation,
			hepaticVeinExpDiastolicReversal,
			enlargedRA,
			enlargedRV,
			midsystolicNotch,
			lvLaterealAnnulusEE,
			lvefInEchocardiography,
			trjVelocityMsec
		]
	}
}


// MARK: - Diagnostics -> Chest X-Ray

class ChestXRay: EvaluationItem {
	
	let rightPleuralEffusion = EvaluationItem(literal: Presentation.rightPleuralEffusion)
	let leftPleuralEffusion = EvaluationItem(literal: Presentation.leftPleuralEffusion)
	let pulmonaryEdema = EvaluationItem(literal: Presentation.pulmonaryEdema)
	let enlargedCardiacSolhouette = EvaluationItem(literal: Presentation.enlargedCardiacSolhouette)
	let widenedMediasteneum = EvaluationItem(literal: Presentation.widenedMediasteneum)
	let pneumothorax = EvaluationItem(literal: Presentation.pneumothorax)
	let infiltrate = EvaluationItem(literal: Presentation.infiltrate)
	let consolidation = EvaluationItem(literal: Presentation.consolidation)
	
	override var items: [EvaluationItem] {
		return [
			rightPleuralEffusion,
			leftPleuralEffusion,
			pulmonaryEdema,
			enlargedCardiacSolhouette,
			widenedMediasteneum,
			pneumothorax,
			infiltrate,
			consolidation
		]
	}
}


// MARK: - Diagnostics -> RHC

class RHC: EvaluationItem {
	
}
