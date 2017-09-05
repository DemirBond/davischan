//
//  ReviewOfSystem.swift
//  CVDEvaluator
//
//  Created by bogdankosh on 3/21/17.
//  Copyright © 2017 IgorKhomiak. All rights reserved.
//

import UIKit

class ReviewOfSystem: EvaluationItem {
	
	let weightChangeInROS = EvaluationItem(literal: Presentation.weightChangeInROS)
	let thyrotoxicosisInROS = EvaluationItem(literal: Presentation.thyrotoxicosisInROS)
	let palpitationsInROS = EvaluationItem(literal: Presentation.palpitationsInROS)
	let osaSymptomsInROS = EvaluationItem(literal: Presentation.osaSymptomsInROS)
	let sinusSymptomsInROS = EvaluationItem(literal: Presentation.sinusSymptomsInROS)
	let coughSymptomsInROS = EvaluationItem(literal: Presentation.coughSymptomsInROS)
	let sputumSymptomsInROS = EvaluationItem(literal: Presentation.sputumSymptomsInROS)
	let previousDVTPEInROS = EvaluationItem(literal: Presentation.previousDVTPEInROS)
	let activePepticUlcerDiseaseInROS = EvaluationItem(literal: Presentation.activePepticUlcerDiseaseInROS)
	let liverDiseaseInROS = EvaluationItem(literal: Presentation.liverDiseaseInROS)
	let bleedInThePast3MonthsInROS = EvaluationItem(literal: Presentation.bleedInThePast3MonthsInROS)
	let tiaInROS = EvaluationItem(literal: Presentation.tiaInROS)
	let hypothyroidismInROS = EvaluationItem(literal: Presentation.hypothyroidismInROS)
	let claudicationInROS = EvaluationItem(literal: Presentation.claudicationInROS)
	let ulcerInROS = EvaluationItem(literal: Presentation.ulcerInROS)
	let rheumInROS = EvaluationItem(literal: Presentation.rheumInROS)
	let blnhemoptysis = EvaluationItem(literal: Presentation.blnhemoptysis)
	let blnunilateral = EvaluationItem(literal: Presentation.blnunilateral)
	let pnd = EvaluationItem(literal: Presentation.pndInROS)
	let orthopnea = EvaluationItem(literal: Presentation.orthopneaInROS)
	let previousDVT = EvaluationItem(literal: Presentation.previousDVTEInROS)
	
	override var items: [EvaluationItem] {
		return [
			weightChangeInROS,
			thyrotoxicosisInROS,
			hypothyroidismInROS,
			osaSymptomsInROS,
			sinusSymptomsInROS,
			coughSymptomsInROS,
			sputumSymptomsInROS,
			blnhemoptysis,
			previousDVTPEInROS,
			pnd,
			orthopnea,
			palpitationsInROS,
			activePepticUlcerDiseaseInROS,
			liverDiseaseInROS,
			bleedInThePast3MonthsInROS,
			tiaInROS,
			claudicationInROS,
			ulcerInROS,
			blnunilateral,
			previousDVT,
			rheumInROS
		]
	}
}
