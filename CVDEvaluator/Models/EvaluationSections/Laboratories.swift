//
//  Laboratories.swift
//  CVDEvaluator
//
//  Created by bogdankosh on 2/9/17.
//  Copyright © 2017 IgorKhomiak. All rights reserved.
//

import Foundation

class Laboratories: EvaluationItem {
	
	let chemBasicLabel = EvaluationItem(literal: Presentation.chemBasicLabel)
	let nameqlValue = EvaluationItem(literal: Presentation.nameqlValue)
	
	let urineNaMeql = EvaluationItem(literal: Presentation.urineNaMeql)
	let serumOsmolality = EvaluationItem(literal: Presentation.serumOsmolality)
	let urineOsmolality = EvaluationItem(literal: Presentation.urineOsmolality)

	
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
	
	// MARK: Fill up the rest of it and fill up items array
	
	override var items: [EvaluationItem] {
		return [
			chemBasicLabel,
			nameqlValue,
			//urineNaMeql,
			//serumOsmolality,
			//urineOsmolality,
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
			albuminuriaMgGmOrMg24hr
		]
	}
	
}

class Nameql: EvaluationItem {
	
	override var items: [EvaluationItem] {
		return [
//			urineNaMeql,
//			serumOsmolality,
//			urineOsmolality
		]
	}
}
