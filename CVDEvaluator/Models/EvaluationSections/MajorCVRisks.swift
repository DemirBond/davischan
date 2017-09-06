//
//  MajorCVRisks.swift
//  CVDEvaluator
//
//  Created by bogdankosh on 2/9/17.
//  Copyright © 2017 IgorKhomiak. All rights reserved.
//

import Foundation


// MARK: - MajorCVRisks

class MajorCVRisks: EvaluationItem {

	let diabetes = Diabetes(literal: Presentation.diabetes)
	let systemicArterialHypertension = SystemicArterialHypertension(literal: Presentation.systemicArterialHypertension)
	let tobaccoUse = EvaluationItem(literal: Presentation.tobaccoUse)
	let familyHistory = EvaluationItem(literal: Presentation.familyHistory)
	
	override var items: [EvaluationItem] {
		return [
			diabetes,
			systemicArterialHypertension,
			tobaccoUse,
			familyHistory,
		]
	}
}


// MARK: - MajorCVRisks -> Diabetes

class Diabetes: EvaluationItem {
	
	let typeIIDM = TypeIIDM(literal: Presentation.typeIIDM)
	let typeIDM = TypeIDM(literal: Presentation.typeIDM)
	let gestationalDM = EvaluationItem(literal: Presentation.gestationalDM)
	let retinopathy = EvaluationItem(literal: Presentation.retinopathy)
	
	override var items: [EvaluationItem] {
		return [
			typeIIDM,
			typeIDM,
			gestationalDM,
			retinopathy
		]
	}
}


// MARK: - MajorCVRisks -> Diabetes -> Type II DM

class TypeIIDM: EvaluationItem{
	
	let DMNP = EvaluationItem(literal: Presentation.DMNP)
	let DMCKD = EvaluationItem(literal: Presentation.DMCKD)
	let DMother = EvaluationItem(literal: Presentation.DMother)
	let DMarthro = EvaluationItem(literal: Presentation.DMarthro)
	let DMoral = EvaluationItem(literal: Presentation.DMoral)
	let DMskin = EvaluationItem(literal: Presentation.DMskin)
	let DMhypo = EvaluationItem(literal: Presentation.DMhypo)
	let DMhypocoma = EvaluationItem(literal: Presentation.DMhypocoma)
	let DMhyper = EvaluationItem(literal: Presentation.DMhyper)
	let DMmono = EvaluationItem(literal: Presentation.DMmono)
	let DMpoly = EvaluationItem(literal: Presentation.DMpoly)
	let DMautonom = EvaluationItem(literal: Presentation.DMautonom)
	let DMangio = EvaluationItem(literal: Presentation.DMangio)
	let DMothercirc = EvaluationItem(literal: Presentation.DMothercirc)
	let DMgangrene = EvaluationItem(literal: Presentation.DMgangrene)
	let DMothercomp = EvaluationItem(literal: Presentation.DMothercomp)
	let DMunspec = EvaluationItem(literal: Presentation.DMunspec)
	let DMwithout = EvaluationItem(literal: Presentation.DMwithout)
	
	override var items: [EvaluationItem]{
		return [
			DMNP,
			DMCKD,
			DMother,
			DMmono,
			DMpoly,
			DMautonom,
			DMangio,
			DMothercirc,
			DMgangrene,
			DMarthro,
			DMskin,
			DMoral,
			DMhypo,
			DMhypocoma,
			DMhyper,
			DMothercomp,
			DMunspec,
			DMwithout
		]
	}
}


// MARK: - MajorCVRisks -> Diabetes -> Type I DM

class TypeIDM: EvaluationItem{
	
	let DMNP = EvaluationItem(literal: Presentation.DMNP)
	let DMCKD = EvaluationItem(literal: Presentation.DMCKD)
	let DMother = EvaluationItem(literal: Presentation.DMother)
	let DMarthro = EvaluationItem(literal: Presentation.DMarthro)
	let DMoral = EvaluationItem(literal: Presentation.DMoral)
	let DMskin = EvaluationItem(literal: Presentation.DMskin)
	let DMhypo = EvaluationItem(literal: Presentation.DMhypo)
	let DMhypocoma = EvaluationItem(literal: Presentation.DMhypocoma)
	let DMhyper = EvaluationItem(literal: Presentation.DMhyper)
	let DMmono = EvaluationItem(literal: Presentation.DMmono)
	let DMpoly = EvaluationItem(literal: Presentation.DMpoly)
	let DMautonom = EvaluationItem(literal: Presentation.DMautonom)
	let DMangio = EvaluationItem(literal: Presentation.DMangio)
	let DMothercirc = EvaluationItem(literal: Presentation.DMothercirc)
	let DMgangrene = EvaluationItem(literal: Presentation.DMgangrene)
	let DMothercomp = EvaluationItem(literal: Presentation.DMothercomp)
	let DMunspec = EvaluationItem(literal: Presentation.DMunspec)
	let DMwithout = EvaluationItem(literal: Presentation.DMwithout)
	
	override var items: [EvaluationItem]{
		return [
			DMNP,
			DMCKD,
			DMother,
			DMmono,
			DMpoly,
			DMautonom,
			DMangio,
			DMothercirc,
			DMgangrene,
			DMarthro,
			DMskin,
			DMoral,
			DMhypo,
			DMhypocoma,
			DMhyper,
			DMothercomp,
			DMunspec,
			DMwithout
		]
	}
}


// MARK: - MajorCVRisks -> Systemic Arterial Hypertension

class SystemicArterialHypertension: EvaluationItem {

	let ambSBP = EvaluationItem(literal: Presentation.ambSBP)
	let ambDBP = EvaluationItem(literal: Presentation.ambDBP)
	let checkLVHOnEKGIfApplicableLabel = EvaluationItem(literal: Presentation.checkLVHOnEKGIfApplicableLabel)
	let SBPTreated = EvaluationItem(literal: Presentation.sbpTreated)
	let primaryHypertensionLabel = EvaluationItem(literal: Presentation.primaryHypertensionLabel)
	let africanAmerican = EvaluationItem(literal: Presentation.africanAmerican)
	let primaryHyperaldesteronism = EvaluationItem(literal: Presentation.primaryHyperaldesteronism)
	let renovascularAtheroscleotic = EvaluationItem(literal: Presentation.renovascularAtheroscleotic)
	let pheocromocytoma = EvaluationItem(literal: Presentation.pheocromocytoma)
	let osa = EvaluationItem(literal: Presentation.osa)
	let secondaryHypertensionLabel = EvaluationItem(literal: Presentation.secondaryHypertensionLabel)
	let headachedBlurredVisionOrAMS = EvaluationItem(literal: Presentation.headachedBlurredVisionAMS)
	let epistaxis = EvaluationItem(literal: Presentation.epistaxis)
	let chestBackPainDyspnea = EvaluationItem(literal: Presentation.chestBackPainDyspnea)
	
	override var items: [EvaluationItem] {
		return [
			ambSBP,
			ambDBP,
			checkLVHOnEKGIfApplicableLabel,
			SBPTreated,
			africanAmerican,
			primaryHypertensionLabel,
			primaryHyperaldesteronism,
			renovascularAtheroscleotic,
			pheocromocytoma,
			osa,
			secondaryHypertensionLabel,
			headachedBlurredVisionOrAMS,
			epistaxis,
			chestBackPainDyspnea
		]
	}
}
