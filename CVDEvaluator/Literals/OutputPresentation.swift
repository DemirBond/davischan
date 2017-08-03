//
//  OutputPresentation.swift
//  CVDEvaluator
//
//  Created by IgorKhomiak on 2/28/17.
//  Copyright © 2017 IgorKhomiak. All rights reserved.
//
// Updated by EvrimGuler on 4/5/2017

import UIKit

struct OutputPresentation {
	static let outputSampleCell = "#id: overview | #title: Overview | #type: #statusCard | #subtitle: This is a placeholder for a description of what the output/results may be. This can also be omitted altogether. The background color for the output will serve as a severity of the prognosis."
	
	static let outputSampleCell2 = "#id: overview | #title: Overview | #type: #statusCard | #subtitle: This is a placeholder for a description of what the output/results may be. This can also be omitted altogether. The background color for the output will serve as a severity of the prognosis."
	
	static let resultOutputBad = "#id: resultOutputBad | #title: Output | #type: #resultOutput | #subtitle: Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident."
	
	static let resultOutputGood = "#id: resultOutputGood | #title: Output | #type: #resultOutput | #subtitle: Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident."
	
	static let resultOutputCaution = "#id: resultOutputCaution | #title: Output | #type: #resultOutput |  #subtitle: No output"
	
	static let diagnosticsResult = "#id: diagnostics | #title: Diagnostics | #type: #resultOutput | #subtitle: No diagnostic"
	
	static let therapeuticsResult = "#id: Therapeutics | #title: Therapeutics | #type: #resultOutput | #subtitle: No therapeutic"
	
	static let icd10Result = "#id: icd10Result | #title: ICD 10 | #type: #resultOutput | #subtitle: No icd result"
	
	static let references = "#id: references | #title: References | #type: #referencesCard | #subtitle: No reference"

	static let piedmostPartnerCard = "#id: piedmostPartnerCard | #title: References | #type: #partnerCard | #subtitle: Department Name."
}
