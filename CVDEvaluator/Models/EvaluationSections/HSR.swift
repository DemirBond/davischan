//
//  HSR.swift
//  CVDEvaluator
//
//  Created by bogdankosh on 2/22/17.
//  Copyright © 2017 IgorKhomiak. All rights reserved.
//

import Foundation


// MARK: - Current Therapies

class HSR: EvaluationItem {
	
	let poMeds = POMeds(literal: Presentation.poMeds)
	let inHospital = InHospital(literal: Presentation.inHospital)
	
	override var items: [EvaluationItem] {
		return [poMeds, inHospital]
	}
}


// MARK: - HSR -> POMeds

class POMeds: EvaluationItem {
	
	let bBlocker = BBlocker(literal: Presentation.bBlocker)
	let acelARB = AcelARB(literal: Presentation.acelARB)
	let poDiuretic = PODiuretic(literal: Presentation.poDiuretic)
	let ccbOtherVasolidators = EvaluationItem(literal: Presentation.ccbOtherVasolidators)
	let currentVKATherapy = EvaluationItem(literal: Presentation.currentVKATherapy)
	let directThrombinInhibitors = EvaluationItem(literal: Presentation.directThrombinInhibitors)
	let factorXaInhibitors = EvaluationItem(literal: Presentation.factorXaInhibitors)
	
	override var items: [EvaluationItem] {
		return [
			bBlocker,
			acelARB,
			poDiuretic,
			ccbOtherVasolidators,
			currentVKATherapy,
			directThrombinInhibitors,
			factorXaInhibitors
		]
	}
}


// MARK: - HSR -> POMeds -> B Blocker

class BBlocker: EvaluationItem {
	
	let carvedilol3125bid = EvaluationItem(literal: Presentation.carvedilol3125bid)
	let carvedilol625bid = EvaluationItem(literal: Presentation.carvedilol625bid)
	let carvedilol125bid = EvaluationItem(literal: Presentation.carvedilol125bid)
	let carvedilol25bid = EvaluationItem(literal: Presentation.carvedilol25bid)
	let metoproloIER25qd = EvaluationItem(literal: Presentation.metoproloIER25qd)
	let metoproloIER50qd = EvaluationItem(literal: Presentation.metoproloIER50qd)
	let metoproloIER100qd = EvaluationItem(literal: Presentation.metoproloIER100qd)
	let metoproloIER150qd = EvaluationItem(literal: Presentation.metoproloIER150qd)
	let metoproloIER200qd = EvaluationItem(literal: Presentation.metoproloIER200qd)
	
	override var items: [EvaluationItem] {
		return [
			carvedilol3125bid,
			carvedilol625bid,
			carvedilol125bid,
			carvedilol25bid,
			metoproloIER25qd,
			metoproloIER50qd,
			metoproloIER100qd,
			metoproloIER150qd,
			metoproloIER200qd
		]
	}
}


// MARK: - HSR -> POMeds -> Acel/ARB

class AcelARB: EvaluationItem {
	
	let lisinopril5 = EvaluationItem(literal: Presentation.lisinopril5)
	let lisinopril10 = EvaluationItem(literal: Presentation.lisinopril10)
	let lisinopril20 = EvaluationItem(literal: Presentation.lisinopril20)
	let losartan25 = EvaluationItem(literal: Presentation.losartan25)
	let losartan50 = EvaluationItem(literal: Presentation.losartan50)
	let losartan100 = EvaluationItem(literal: Presentation.losartan100)
	
	override var items: [EvaluationItem] {
		return [
			lisinopril5,
			lisinopril10,
			lisinopril20,
			losartan25,
			losartan50,
			losartan100
		]
	}
}


// MARK: - HSR -> POMeds -> PO Diuretic

class PODiuretic: EvaluationItem {
	
	let furosemide40 = EvaluationItem(literal: Presentation.furosemide40)
	let furosemide80 = EvaluationItem(literal: Presentation.furosemide80)
	let furosemide80Plus = EvaluationItem(literal: Presentation.furosemide80Plus)
	let bumex1 = EvaluationItem(literal: Presentation.bumex1)
	let bumex2 = EvaluationItem(literal: Presentation.bumex2)
	let bumex2Plus = EvaluationItem(literal: Presentation.bumex2Plus)
	let torsemide20 = EvaluationItem(literal: Presentation.torsemide20)
	let torsemide40 = EvaluationItem(literal: Presentation.torsemide40)
	let torsemide50Plus = EvaluationItem(literal: Presentation.torsemide50Plus)
	let hctz = EvaluationItem(literal:Presentation.hctz)
	let indapamide = EvaluationItem(literal: Presentation.indapamide)
	let chlorthalidoneMetolazone = EvaluationItem(literal: Presentation.chlorthalidoneMetolazone)
	
	override var items: [EvaluationItem] {
		return [
			furosemide40,
			furosemide80,
			furosemide80Plus,
			bumex1,
			bumex2,
			bumex2Plus,
			torsemide20,
			torsemide40,
			torsemide50Plus,
			hctz,
			indapamide,
			chlorthalidoneMetolazone
		]
	}
}


// MARK: - HSR -> InHospital

class InHospital: EvaluationItem {
	
	let ivAntiarrythmic = IVAntiarrythmic(literal: Presentation.ivAntiarrythmic)
	let urgentCV = EvaluationItem(literal: Presentation.urgentCV)
	let defibrillationACLS = EvaluationItem(literal: Presentation.defibrillationACLS)
	let ivAntihypertensive = IVAntihypertensive(literal: Presentation.ivAntihypertensive)
	let ivVasoactive = IVVasoactive(literal: Presentation.ivVasoactive)
	let ivDiuretic = IVDiuretic(literal: Presentation.ivDiuretic)
	let mechanicalVentiallationOrNIPPV = MechanicalVentiallationOrNIPPV(literal: Presentation.mechanicalVentiallationOrNIPPV)
	let o2Supplement = EvaluationItem(literal: Presentation.o2Supplement)
	let ivVasopressors = EvaluationItem(literal: Presentation.ivVasopressors)
	let ultrafiltration = EvaluationItem(literal: Presentation.ultrafiltration)
	let iabp = EvaluationItem(literal: Presentation.iabp)
	let temporaryPM = EvaluationItem(literal: Presentation.temporaryPM)
	
	override var items: [EvaluationItem] {
		return [
			ivAntiarrythmic,
			urgentCV,
			defibrillationACLS,
			ivAntihypertensive,
			ivVasoactive,
			ivDiuretic,
			mechanicalVentiallationOrNIPPV,
			o2Supplement,
			ivVasopressors,
			ultrafiltration,
			iabp,
			temporaryPM
		]
	}
}


// MARK: - HSR -> InHospital -> IV Antiarrythmic

class IVAntiarrythmic: EvaluationItem {
	
	let continuousInAntiarrythmic = EvaluationItem(literal: Presentation.continuousInAntiarrythmic)
	let bolusInAntiarrythmic = EvaluationItem(literal: Presentation.bolusInAntiarrythmic)
	let titrationInAntiarrythmic = EvaluationItem(literal: Presentation.titrationInAntiarrythmic)
	let monitoringFrequencyQhrInAntiarrythmic = EvaluationItem(literal: Presentation.monitoringFrequencyQhrInAntiarrythmic)
	let transitionToPOAntiarrythmicInAntiarrythmic = EvaluationItem(literal: Presentation.transitionToPOAntiarrythmicInAntiarrythmic)
	
	override var items: [EvaluationItem] {
		return [
			continuousInAntiarrythmic,
			bolusInAntiarrythmic,
			titrationInAntiarrythmic,
			monitoringFrequencyQhrInAntiarrythmic,
			transitionToPOAntiarrythmicInAntiarrythmic
		]
	}
}


// MARK: - HSR -> InHospital -> iv Antihypertensive

class IVAntihypertensive: EvaluationItem {
	
	let blnIVHTcon = EvaluationItem(literal: Presentation.blnIVHTcon)
	let blnIVHTbolus = EvaluationItem(literal: Presentation.blnIVHTbolus)
	let blnIVHTtitr = EvaluationItem(literal: Presentation.blnIVHTtitr)
	let txtHTmonitor = EvaluationItem(literal: Presentation.txtHTmonitor)
	
	override var items: [EvaluationItem] {
		return [
			blnIVHTcon,
			blnIVHTbolus,
			blnIVHTtitr,
			txtHTmonitor
		]
	}
}


// MARK: - HSR -> InHospital -> IV Vasoactive

class IVVasoactive: EvaluationItem {
	
	let blnIVVAcon = EvaluationItem(literal: Presentation.blnIVVAcon)
	let blnIVVAbolus = EvaluationItem(literal: Presentation.blnIVVAbolus)
	let blnIVVAtitr = EvaluationItem(literal: Presentation.blnIVVAtitr)
	let txtVAmonitor = EvaluationItem(literal: Presentation.txtVAmonitor)
	let blnIVNPSz = EvaluationItem(literal: Presentation.blnIVNPSz)
	let blnIVNTG = EvaluationItem(literal: Presentation.blnIVNTG)
	let blnmilrinone = EvaluationItem(literal: Presentation.blnmilrinone)
	
	override var items: [EvaluationItem] {
		return [
			blnIVVAcon,
			blnIVVAbolus,
			blnIVVAtitr,
			txtVAmonitor,
			blnIVNPSz,
			blnIVNTG,
			blnmilrinone
		]
	}
}


// MARK: - HSR -> InHospital -> IV Diuretic

class IVDiuretic: EvaluationItem {
	
	let blncon = EvaluationItem(literal: Presentation.blncon)
	let blnPODI = EvaluationItem(literal: Presentation.blnPODI)
	let txtmonitor = EvaluationItem(literal: Presentation.txtmonitor)
	
	override var items: [EvaluationItem] {
		return [
			blncon,
			blnPODI,
			txtmonitor
		]
	}
}


// MARK: - HSR -> InHospital -> Mechanical Ventiallation or NIPPV

class MechanicalVentiallationOrNIPPV: EvaluationItem {
	
	let txtRI = EvaluationItem(literal: Presentation.txtRI)
	
	override var items: [EvaluationItem] {
		return [txtRI]
	}
}
