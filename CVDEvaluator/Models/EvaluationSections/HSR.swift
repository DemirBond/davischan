//
//  HSR.swift
//  CVDEvaluator
//
//  Created by bogdankosh on 2/22/17.
//  Copyright © 2017 IgorKhomiak. All rights reserved.
//

import Foundation

class HSR: EvaluationItem {
	let poMeds = POMeds(literal: Presentation.poMeds)
	let inHospital = InHospital(literal: Presentation.inHospital)
	
	override var items: [EvaluationItem] {
		return [poMeds, inHospital]
	}
}
