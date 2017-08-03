//
//  RegisterRequest.swift
//  CVDEvaluator
//
//  Created by Ahmet Küçük on 5/2/17.
//  Copyright © 2017 IgorKhomiak. All rights reserved.
//

import Foundation


struct RegisterRequest {

	var name: String
	var username: String
	var password: String
	var confirmPassword: String
	
	func toDictionary() -> Dictionary<String, AnyObject> {
		return ["name": name as AnyObject, "username": username as AnyObject, "password": password as AnyObject, "ConfirmPassword": confirmPassword as AnyObject]
	}
}
