//
//  CodeAuthRequest.swift
//  CVDEvaluator
//
//  Created by Davis Chan on 9/28/17.
//  Copyright © 2017 IgorKhomiak. All rights reserved.
//

import Foundation


struct CodeAuthRequest {
	
	var email: String
	var registrationCode: String
	
	func toDictionary() -> Dictionary<String, AnyObject> {
		return ["Username": email as AnyObject, "RegistrationCode": registrationCode as AnyObject]
	}
}
