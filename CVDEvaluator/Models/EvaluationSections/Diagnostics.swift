//
//  Diagnostics.swift
//  CVDEvaluator
//
//  Created by bogdankosh on 2/14/17.
//  Copyright © 2017 IgorKhomiak. All rights reserved.
//

import Foundation

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

class EKG: EvaluationItem {
//	let urineNaMeqlInEKG = EvaluationItem(literal: Presentation.urineNaMeqlInEKG)
//	let serumOsmolalityInEKG = EvaluationItem(literal: Presentation.serumOsmolalityInEKG)
	let stDeviation05mm = EvaluationItem(literal: Presentation.stDeviation05mm)
	let stressTestingInEKG = EvaluationItem(literal: Presentation.stressTestingInEKG)
	let tWaveInversion1mm = EvaluationItem(literal: Presentation.tWaveInversion1mm)
	let lowVoltageQRS = EvaluationItem(literal: Presentation.lowVoltageQRS)
	let abnormalQWaves = EvaluationItem(literal: Presentation.abnormalQWaves)
	let lbbb = EvaluationItem(literal: Presentation.lbbb)
	let lvh = EvaluationItem(literal: Presentation.lvh)
	let atrialPrematureDepolarization = EvaluationItem(literal: Presentation.atrialPrematureDepolarization)
	let junctionalPrematureDepolarization = EvaluationItem(literal: Presentation.junctionalPrematureDepolarization)
	let frequentVentricularPacingOrEctopy = EvaluationItem(literal: Presentation.frequentVentricularPacingOrEctopy)
	let infrequentVentricularPacingOrEctopy = EvaluationItem(literal: Presentation.infrequentVentricularPacingOrEctopy)
	let wpw = EvaluationItem(literal: Presentation.wpw)
	let svt = EvaluationItem(literal: Presentation.svt)
	let rbbb = EvaluationItem(literal: Presentation.rbbb)
	let intraventicularBlock = EvaluationItem(literal: Presentation.intraventicularBlock)
	let atrialFibrillationInEKG = EvaluationItem(literal: Presentation.atrialFibrillationInEKG)
	let atrialFlutter = AtrialFlutter(literal: Presentation.atrialFlutter)
	let prDuration  = EvaluationItem(literal: Presentation.prDuration)
	let qrsDuration = EvaluationItem(literal: Presentation.qrsDuration)
	
	let nonspecificSTAbnormality = EvaluationItem(literal: Presentation.nonspecificSTAbnormality)
	let firstDegreeAVBlock = EvaluationItem(literal: Presentation.firstDegreeAVBlock)
	let secondDegreeAVBlock = SecondDegreeAVBlock(literal: Presentation.secondDegreeAVBlock)
	let thirdDegreeAVBlock = EvaluationItem(literal: Presentation.thirdDegreeAVBlock)
	let NSRInEKG = EvaluationItem(literal: Presentation.nsrInEKG)
	let bifascicular = EvaluationItem(literal: Presentation.bifascicular)
	let lahb = EvaluationItem(literal: Presentation.lahb)
	let lphb = EvaluationItem(literal: Presentation.lphb)
	
	
	
	override var items: [EvaluationItem] {
		return [
			
			
			
			
			
			intraventicularBlock,
			atrialFibrillationInEKG,
			atrialFlutter,
			nonspecificSTAbnormality,
			
			NSRInEKG,
			stDeviation05mm,
			tWaveInversion1mm,
			lowVoltageQRS,
			abnormalQWaves,
			lbbb,
			bifascicular,
			lahb,
			lphb,
			wpw,
			svt,
			rbbb,
			lvh,
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

class StressTesting: EvaluationItem {
	let dukeTreadmillScore = EvaluationItem(literal: Presentation.dukeTreadmillScore)
	let serumStressSummedScore = EvaluationItem(literal: Presentation.serumStressSummedScore)
	let dseIschemicThreshold = EvaluationItem(literal: Presentation.dseIschemicThreshold)
	let dseOrStressMRI = EvaluationItem(literal: Presentation.dseOrStressMRI)
	let stressDifferenceScore = EvaluationItem(literal: Presentation.stressDifferenceScore)
	let percentIschemicMyocardiumonMPS = EvaluationItem(literal: Presentation.percentIschemicMyocardiumonMPS)
	let exTimeMin = EvaluationItem(literal: Presentation.exTimeMin)
	let maxSTMm = EvaluationItem(literal: Presentation.maxSTMm)
	let anginaIndex = AnginaIndex(literal: Presentation.anginaIndex)
	let stElevation = EvaluationItem(literal: Presentation.stElevation)
	let abnormalBPResponse = EvaluationItem(literal: Presentation.abnormalBPResponse)
	let ventricularTachycardia = EvaluationItem(literal: Presentation.ventricularTachycardia)
	let prolongSTDepression = EvaluationItem(literal: Presentation.prolongSTDepression)
	let tidOrSignificantDysfunction = EvaluationItem(literal: Presentation.tidOrSignificantDysfunction)
	let fixedPerfusionDefects = FixedPerfusionDefects(literal: Presentation.fixedPerfusionDefects)
	let artifactualUninterpretableImages = EvaluationItem(literal: Presentation.artifactualUninterpretableImages)
	
	override var items: [EvaluationItem] {
		return [
			dukeTreadmillScore,
			serumStressSummedScore,
			dseIschemicThreshold,
			dseOrStressMRI,
			stressDifferenceScore,
			percentIschemicMyocardiumonMPS,
			exTimeMin,
			maxSTMm,
			anginaIndex,
			stElevation,
			abnormalBPResponse,
			ventricularTachycardia,
			prolongSTDepression,
			tidOrSignificantDysfunction,
			fixedPerfusionDefects,
			artifactualUninterpretableImages
		]
	}
	
}

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

class FixedPerfusionDefects: EvaluationItem {
	let viabilityPresent = EvaluationItem(literal: Presentation.viabilityPresent)
	
	override var items: [EvaluationItem] {
		return [viabilityPresent]
	}
}

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

class ChestXRay: EvaluationItem {
	let rightPleuralEffusion = EvaluationItem(literal: Presentation.rightPleuralEffusion)
	let leftPleuralEffusion = EvaluationItem(literal: Presentation.leftPleuralEffusion)
	let pulmonaryEdema = EvaluationItem(literal: Presentation.pulmonaryEdema)
	let enlargedCardiacSolhouette = EvaluationItem(literal: Presentation.enlargedCardiacSolhouette)
	let widenedMediasteneum = EvaluationItem(literal: Presentation.widenedMediasteneum)
	let pneumothorax = EvaluationItem(literal: Presentation.pneumothorax)
	
	override var items: [EvaluationItem] {
		return [
			rightPleuralEffusion,
			leftPleuralEffusion,
			pulmonaryEdema,
			enlargedCardiacSolhouette,
			widenedMediasteneum,
			pneumothorax
		]
	}
}

class RHC: EvaluationItem {
	
}



class AtrialFlutter: EvaluationItem {
	let typicalAF = EvaluationItem(literal: Presentation.typicalAF)
	let atypicalAF = EvaluationItem(literal: Presentation.atypicalAF)
	
	override var items: [EvaluationItem] {
		return [typicalAF, atypicalAF]
	}
}

class SecondDegreeAVBlock: EvaluationItem {
	let type1 = EvaluationItem(literal: Presentation.type1)
	let type2 = EvaluationItem(literal: Presentation.type2)
	
	override var items: [EvaluationItem] {
		return [type1, type2]
	}
}
