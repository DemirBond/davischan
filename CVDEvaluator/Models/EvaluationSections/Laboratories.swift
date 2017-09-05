//
//  Laboratories.swift
//  CVDEvaluator
//
//  Created by bogdankosh on 2/9/17.
//  Copyright © 2017 IgorKhomiak. All rights reserved.
//

import Foundation


// MARK: - Laboratories

class Laboratories: EvaluationItem {
	
	let chemBasicLabel = EvaluationItem(literal: Presentation.chemBasicLabel)
	let nameqlValue = EvaluationItem(literal: Presentation.nameqlValue)
	let kmeql = EvaluationItem(literal: Presentation.kmeql)
	let creatinineMgDl = EvaluationItem(literal: Presentation.creatinineMgDl)
	let bunMgDl = EvaluationItem(literal: Presentation.bunMgDl)
	let fastingPlasmaGlucose = EvaluationItem(literal: Presentation.fastingPlasmaGlucose)
	let gfrMlMin173M2 = EvaluationItem(literal: Presentation.gfrMlMin173M2)
	let worseningRenalFx = EvaluationItem(literal: Presentation.worseningRenalFx)
	
	let lipidProfileLabel = EvaluationItem(literal: Presentation.lipidProfileLabel)
	let alreadyOnStatin = EvaluationItem(literal: Presentation.alreadyOnStatin)
	let statinIntolerance = EvaluationItem(literal: Presentation.statinIntolerance)
	let cholesterol = EvaluationItem(literal: Presentation.cholesterol)
	let trg = EvaluationItem(literal: Presentation.trg)
	let ldlc = EvaluationItem(literal: Presentation.ldlc)
	let hdlc = EvaluationItem(literal: Presentation.hdlc)
	let apoB = EvaluationItem(literal: Presentation.apoB)
	let ldlp = EvaluationItem(literal: Presentation.ldlp)
	let lpaMgdl = EvaluationItem(literal: Presentation.lpaMgdl)
	let ascvdRisk = EvaluationItem(literal: Presentation.ascvdRisk)
	
	let othersLabel = EvaluationItem(literal: Presentation.othersLabel)
	let hba1c = EvaluationItem(literal: Presentation.hba1c)
	let crpMgl = EvaluationItem(literal: Presentation.crpMgl)
	let ntProBNPPgMl = EvaluationItem(literal: Presentation.ntProBNPPgMl)
	let bnpPgMl = EvaluationItem(literal: Presentation.bnpPgMl)
	let albuminuriaMgGmOrMg24hr = EvaluationItem(literal: Presentation.albuminuriaMgGmOrMg24hr)
	let abnormalurinsediment = AbnormalUrinSediment(literal: Presentation.abnormalurinsediment)
	
	override var items: [EvaluationItem] {
		return [
			chemBasicLabel,
			nameqlValue,
			kmeql,
			creatinineMgDl,
			bunMgDl,
			fastingPlasmaGlucose,
			gfrMlMin173M2,
			worseningRenalFx,
			
			lipidProfileLabel,
			alreadyOnStatin,
			statinIntolerance,
			cholesterol,
			trg,
			ldlc,
			hdlc,
			apoB,
			ldlp,
			lpaMgdl,
			ascvdRisk,
			
			othersLabel,
			hba1c,
			crpMgl,
			ntProBNPPgMl,
			bnpPgMl,
			albuminuriaMgGmOrMg24hr,
			abnormalurinsediment
		]
	}
}


// MARK: - Laboratories -> Nameql

class Nameql: EvaluationItem {
	
	let urineNaMeql = EvaluationItem(literal: Presentation.urineNaMeql)
	let serumOsmolality = EvaluationItem(literal: Presentation.serumOsmolality)
	let urineOsmolality = EvaluationItem(literal: Presentation.urineOsmolality)
	
	override var items: [EvaluationItem] {
		return [
			urineNaMeql,
			serumOsmolality,
			urineOsmolality
		]
	}
}


// MARK: - Laboratories -> Abnormal Urin Sediment

class AbnormalUrinSediment: EvaluationItem {
	
	let isolatedrbc = EvaluationItem(literal: Presentation.isolatedrbc)
	let rbccast = EvaluationItem(literal: Presentation.rbccast)
	let wbccast = EvaluationItem(literal: Presentation.wbccast)
	let granularcast = EvaluationItem(literal: Presentation.granularcast)
	let ovalcellbodies = EvaluationItem(literal: Presentation.ovalcellbodies)
	
	override var items: [EvaluationItem] {
		return [
			isolatedrbc,
			rbccast,
			wbccast,
			granularcast,
			ovalcellbodies
		]
	}
}
