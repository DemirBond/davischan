//
//  VascularDisease.swift
//  CVDEvaluator
//
//  Created by bogdankosh on 2/6/17.
//  Copyright © 2017 IgorKhomiak. All rights reserved.
//

import Foundation

class VascularDisease: EvaluationItem {
	let symptomaticCarotidDisease = SymptomaticCarotidDisease(literal: Presentation.symptomaticCarotidDisease)
	let periphericVascularDisease = PeriphericVascularDisease(literal: Presentation.periphericVascularDisease)
	let abdomialAoritcAneurysm = AbdomialAoritcAneurysm(literal: Presentation.abdomialAoritcAneurysm)
	
	override var items: [EvaluationItem] {
		return [
			symptomaticCarotidDisease,
			periphericVascularDisease,
			abdomialAoritcAneurysm
		]
	}

}

class SymptomaticCarotidDisease: EvaluationItem {
	let noncardioembolicVCATIAAssoicaedWithCarotidPlaque = NoncardioembolicVCATIAAssoicaedWithCarotidPlaque(literal: Presentation.noncardioembolicVCATIAAssoicaedWithCarotidPlaque)
	let more50CarotidStenosisSPCEA = EvaluationItem(literal: Presentation.more50CarotidStenosisSPCEA)
	let noncardioembolicTIAAssoicaedWithCarotidPlaque = EvaluationItem(literal: Presentation.noncardioembolicTIAAssoicaedWithCarotidPlaque)
	
	override var items: [EvaluationItem] {
		return [
			noncardioembolicVCATIAAssoicaedWithCarotidPlaque,
			noncardioembolicTIAAssoicaedWithCarotidPlaque,
			more50CarotidStenosisSPCEA
		]
	}
}

class NoncardioembolicVCATIAAssoicaedWithCarotidPlaque: EvaluationItem {
	// MARK: Content misssing
	
}
class PeriphericVascularDisease: EvaluationItem {
	let abiLess09 = EvaluationItem(literal: Presentation.abiLess09)
	let claudication = EvaluationItem(literal: Presentation.claudication)
	let criticalLimbIschemia = EvaluationItem(literal: Presentation.criticalLimbIschemia)
	let endovascularRevascularization = EvaluationItem(literal: Presentation.endovascularRevascularization)
	let peripheralArteryBypassGraft = EvaluationItem(literal: Presentation.peripheralArteryBypassGraft)
	override var items: [EvaluationItem] {
		return [
			abiLess09,
			claudication,
			criticalLimbIschemia,
			endovascularRevascularization,
			peripheralArteryBypassGraft
		]
	}
}
class AbdomialAoritcAneurysm: EvaluationItem {
	let aaDiameteMore5cm = EvaluationItem(literal: Presentation.aaDiameteMore5cm)
	let thoracic = EvaluationItem(literal: Presentation.thoracic)
	let thoracoabdominal = EvaluationItem(literal: Presentation.thoracoabdominal)
	
	override var items: [EvaluationItem] {
		return [aaDiameteMore5cm,
		        thoracic,
		        thoracoabdominal
		]
	}
}

class SuperGayPenisAneurysm: EvaluationItem {
	let aaDiameteMore5cm = EvaluationItem(literal: Presentation.aaDiameteMore5cm)
	let thoracic = EvaluationItem(literal: Presentation.thoracic)
	let thoracoabdominal = EvaluationItem(literal: Presentation.thoracoabdominal)
	
	override var items: [EvaluationItem] {
		return [aaDiameteMore5cm,
		        thoracic,
		        thoracoabdominal
		]
	}
}
