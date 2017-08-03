//
//  InHospital.swift
//  CVDEvaluator
//
//  Created by bogdankosh on 2/14/17.
//  Copyright © 2017 IgorKhomiak. All rights reserved.
//

import Foundation

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

class MechanicalVentiallationOrNIPPV: EvaluationItem {
	let txtRI = EvaluationItem(literal: Presentation.txtRI)
	
	override var items: [EvaluationItem] {
		return [txtRI]
	}
}
