

//
//  File.swift
//  CVDEvaluator
//
//  Created by Ahmet Küçük on 3/17/17.
//  Copyright © 2017 IgorKhomiak. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class RestClient: NSObject {
	
	static let client = RestClient()
	static let baseUrl: String = "http://www.cvdevaluator.com/api/"
	static let loginUrl: String = baseUrl + "token"
	static let registerUrl: String = baseUrl + "api/account/register"
	static let computeEvaluationUrl: String = baseUrl + "api/values"
	static let retreiveEvaluationsUrl: String = baseUrl + "api/values"
	
	var token: String = ""
	var isLoggedIn: Bool = false
	
	func computeEvaluation(evaluationRequest: EvaluationRequest, success:@escaping (JSON) -> Void, failure:@escaping (Error) -> Void)
	{
		if (!isLoggedIn) {
			let error : Error = NSError(domain: "please login before compute", code: 123, userInfo: nil)
			failure(error)
			return
		}
		
		let headers: HTTPHeaders = [
			"Authorization": token,
			"Accept": "application/json"
		]
		
		Alamofire.request(RestClient.computeEvaluationUrl, method: .get, parameters: evaluationRequest.toDictionary(), headers: headers).responseJSON { (responseObject) -> Void in
			//print(responseObject)
			if responseObject.result.isSuccess {
				let resJson = JSON(responseObject.result.value!)
				//let title = resJson["title"].string
				//print(title!)
				success(resJson)
			}
			
			if responseObject.result.isFailure {
				let error : Error = responseObject.result.error!
				failure(error)
			}
		}
	}
	
	func login(username: String, password: String, success:@escaping (JSON) -> Void, failure:@escaping (Error) -> Void)
	{
		print("Login Called with " + username + " " + password)
		let params: Dictionary = ["grant_type": "password", "username": username, "password": password]
		Alamofire.request(RestClient.loginUrl, method: .post, parameters: params).responseJSON {(responseObject) -> Void in
			//print(responseObject)
			if responseObject.result.isSuccess {
				let resJson = JSON(responseObject.result.value!)
				if(resJson["access_token"].exists()) {
					self.isLoggedIn = true
					self.token = resJson["token_type"].stringValue + " " + resJson["access_token"].stringValue
					success(resJson)
				} else {
					let error = NSError(domain: "RestClientLogin", code: 501, userInfo: ["message" : "Username or password is incorrect"])
					failure(error)
				}
			}
			
			if responseObject.result.isFailure {
				let error : Error = responseObject.result.error!
				failure(error)
			}
		}
	}
	
	func register(registerRequest: RegisterRequest, success:@escaping (RegisterResponse) -> Void, failure:@escaping (Error) -> Void)
	{
		let params = registerRequest.toDictionary()
		//Server side does not return anything other than 200 Ok
		Alamofire.request(RestClient.registerUrl, method: .post, parameters: params).responseString {(responseObject) -> Void in
				if responseObject.response?.statusCode == 200 {
					success(RegisterResponse(isSuccess: true, message: ""))
				} else {
					let resJson = JSON.parse(responseObject.result.value ?? "{}")
					print(success(RegisterResponse(isSuccess: false, message: resJson["Message"].stringValue)))
				}
			
			if responseObject.result.isFailure {
				let error : Error = responseObject.error!
				failure(error)
			}
		}
	}
	
	func retrieveSavedEvaluations(success:@escaping (JSON) -> Void, failure:@escaping (Error) -> Void)
	{
		let params = [String: String]()
		let headers: HTTPHeaders = [
			"Authorization": token,
			"Accept": "application/json"
		]
		Alamofire.request(RestClient.retreiveEvaluationsUrl, method: .get, parameters: params, headers:headers).responseJSON {(responseObject) -> Void in
			print(responseObject)
			if responseObject.result.isSuccess {
				let resJson = JSON(responseObject.result.value!)
				success(resJson)
			}
			
			if responseObject.result.isFailure {
				let error : Error = responseObject.result.error!
				failure(error)
			}
		}
	}
	
	func retrieveEvaluationByID(id: Int, success:@escaping (JSON) -> Void, failure:@escaping (Error) -> Void)
	{
		let params: Dictionary = ["ID": id]
		let headers: HTTPHeaders = [
			"Authorization": token,
			"Accept": "application/json"
		]
		Alamofire.request(RestClient.retreiveEvaluationsUrl, method: .get, parameters: params, headers:headers).responseJSON {(responseObject) -> Void in
			if responseObject.result.isSuccess {
				let resJson = JSON(responseObject.result.value!)
				success(resJson)
			}
			
			if responseObject.result.isFailure {
				let error : Error = responseObject.result.error!
				failure(error)
			}
		}
	}
}
