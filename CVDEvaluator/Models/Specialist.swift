//
//  Specialist.swift
//  CVDEvaluator
//
//  Created by IgorKhomiak on 3/5/17.
//  Copyright © 2017 IgorKhomiak. All rights reserved.
//

import UIKit

class Specialist {

	let header: String
	let title: String
	let subtitle: String
	var descripption: String?
	
	init (header: String, title: String, subtitle: String, descripption: String? = nil) {
		self.header = header
		self.title = title
		self.subtitle = subtitle
		self.descripption = descripption
		
	}
}
