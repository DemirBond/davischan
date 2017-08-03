//
//  EvaluationRequest.swift
//  CVDEvaluator
//
//  Created by Ahmet Küçük on 3/17/17.
//  Copyright © 2017 IgorKhomiak. All rights reserved.
//

//http://www.cvdevaluator.com/api/api/values isPAH=false&gender=1&age=25&SBP=125&DBP=65&inputs=chkNYHA1%7CchkDOE
import Foundation


struct EvaluationRequest{
	
	var isSave: Bool
	var age: Int
	var isPAH: String
	var name: String
	var gender: Int
	var SBP: Int
	var DBP: Int
	var inputs: String
	
	func toDictionary() -> Dictionary<String, AnyObject> {
		var dict = ["age": age as AnyObject, "isPAH": isPAH as AnyObject, "gender": gender as AnyObject, "SBP": SBP as AnyObject, "DBP": DBP as AnyObject, "inputs": inputs as AnyObject]
		if (isSave) {
			dict["name"] = name as AnyObject
		}
		return dict
	}
}
