//
//  BradyarrthymiaSyncope.swift
//  CVDEvaluator
//
//  Created by bogdankosh on 2/6/17.
//  Copyright © 2017 IgorKhomiak. All rights reserved.
//

import Foundation

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
