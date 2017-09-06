//
//  DataManager.swift
//  CVDEvaluator
//
//  Created by IgorKhomiak on 2/27/17.
//  Copyright © 2017 IgorKhomiak. All rights reserved.
//
//  Updated by EvrimGuler and AhmetKucuk on 4/10/2017

import UIKit
import CoreData
import SwiftyJSON


class DataManager {
	
	static var manager = DataManager()
	let formatter = DateFormatter()
	
	var currentDoctor: Doctor?
	var patients: [Patient]?
	var evaluation: Evaluation?
	var isPAH = false
	
	// output object
	var outputs = [String:Bool]()
	
	
	func setPAHValue(pah : Bool) -> Void{
		self.isPAH = pah
	}
	
	
	func getPAHValue() -> Bool {
		return self.isPAH
	}
	
	
	func registerWith(doctorName: String, loginName: String, password: String, completionHandler: @escaping (String?, NSError?) -> (Void)) {
		
		if let array = fetchDoctor(loginName: loginName), array.count > 0 {
			
			let returnError: String = "This email was used for sign up"
			let error = NSError(domain: "LoginManagerDomain", code: 501, userInfo: ["message" : returnError])
			completionHandler(nil, error)
			return
		}
		
		let registerReq = RegisterRequest(name: doctorName, username: loginName, password: password, confirmPassword: password)
		RestClient.client.register(registerRequest: registerReq, success: { (registerResponse) in
			
			if (registerResponse.isSuccess) {
				
				let entity =  NSEntityDescription.entity(forEntityName: "Doctor", in: self.managedObjectContext)
				let doc = NSManagedObject(entity: entity!, insertInto: self.managedObjectContext) as! Doctor
				doc.setValue(loginName, forKey: "loginName")
				doc.setValue(password, forKey: "password")
				doc.setValue(doctorName, forKey: "doctorName")
				self.saveContext()
				self.currentDoctor = doc
				completionHandler("success", nil)
				
			} else {
				let returnError: String = registerResponse.message
				let error = NSError(domain: "LoginManagerDomain", code: 501, userInfo: ["message" : returnError])
				completionHandler(nil, error)
			}

		}, failure: { (error) in
			
			let returnError: String = "This email was used for sign up"
			let error = NSError(domain: "LoginManagerDomain", code: 501, userInfo: ["message" : returnError])
			completionHandler(nil, error)
		})
	}
	
	
	func updateProfile(doctorName: String?, loginName: String?, password: String?, completionHandler: (String?, NSError?) -> (Void)) {
		
		if nil != loginName { currentDoctor?.setValue(loginName, forKey: "loginName") }
		if nil != password { currentDoctor?.setValue(password, forKey: "password") }
		if nil != doctorName { currentDoctor?.setValue(doctorName, forKey: "doctorName") }
		saveContext()
		completionHandler("success", nil)
	}

	
	func setup() {
		self.formatter.dateFormat = "MM/dd/yyyy HH:mm"
	}
	
	
	func hasSavedEvaluations() -> Bool {
		return currentDoctor != nil &&  patients != nil && patients!.count > 0
	}
	
	
	func signIn(with loginName: String, password: String, completionHandler: @escaping (String?, NSError?) -> (Void)) {
		
		if loginName == "demo" && password == "demo1" {
			if let doctor = fetchDoctor(loginName: loginName, password: password) {
				currentDoctor = doctor
				fetchEvaluations()
				completionHandler("success", nil)
				
			} else {
				let entity =  NSEntityDescription.entity(forEntityName: "Doctor", in: self.managedObjectContext)
				let doctor = NSManagedObject(entity: entity!, insertInto: self.managedObjectContext) as! Doctor
				doctor.setValue(loginName, forKey: "loginName")
				doctor.setValue(password, forKey: "password")
				saveContext()
				currentDoctor = doctor
				completionHandler("success", nil)
			}
			
		} else {
			RestClient.client.login(username: loginName, password: password,
				success: { (responseJson) in
				
					let doctor = (self.fetchDoctor(loginName: loginName))?[0]
					if ((doctor) == nil) {
						
						let entity =  NSEntityDescription.entity(forEntityName: "Doctor", in: self.managedObjectContext)
						let doc = NSManagedObject(entity: entity!, insertInto: self.managedObjectContext) as! Doctor
						doc.setValue(loginName, forKey: "loginName")
						doc.setValue(password, forKey: "password")
						doc.setValue(loginName, forKey: "doctorName")
						self.saveContext()
						
						self.currentDoctor = doc
						completionHandler("success", nil)
						
					}
					else {
						doctor?.setValue(password, forKey: "password")
						self.saveContext()

						self.currentDoctor = doctor
						self.fetchEvaluations()
						completionHandler("success", nil)
					}
					
				},
				
				failure: { (error) in
					//TODO change this error with actual error coming from server
					let returnError: String = "UserName or Password is incorrect"
					let error = NSError(domain: "LoginManagerDomain", code: 501, userInfo: ["message" : returnError])
					completionHandler(nil, error)
				}
			)
		}
	}
	
	
	func signIn(with loginName: String, completionHandler: @escaping (String?, NSError?) -> (Void)) {

		let doctors: [Doctor]? = fetchDoctor(loginName: loginName)
		if doctors != nil {
			
			guard let password: String = doctors?[0].value(forKey: "password") as? String, !password.isEmpty else {
				completionHandler("nopass", nil)
				return
			}
			
			RestClient.client.login(username: loginName, password: password,
				success: { (responseJson) in
					
					let doctor = (self.fetchDoctor(loginName: loginName))?[0]
					doctor?.setValue(password, forKey: "password")
					self.saveContext()
					
					self.currentDoctor = doctor
					self.fetchEvaluations()
					
					completionHandler("success", nil)
												
				},
				failure: { _ in}
			)
		}
		else {
			completionHandler("nopass", nil)
		}
	}
	
	
	func signOut() {
		
		let name = currentDoctor?.value(forKey: "loginName")
		let doctors: [Doctor]? = fetchDoctor(loginName: name as! String)
		if doctors != nil {
			let currentDoctor: NSManagedObject = doctors![0]
			currentDoctor.setValue(nil, forKey: "password")
		}
		
		saveContext()
		
		patients?.removeAll()
		patients = nil
		evaluation = nil
		currentDoctor = nil
		RestClient.client.isLoggedIn = false
	}

	
	func saveCurrentEvaluation() {
		guard evaluation != nil && evaluation!.isBioCompleted  else { return }
		
		var isFound = false
		let uuid = evaluation!.evaluationUUID
		
		if patients != nil && patients!.count > 0 {
			for patient in self.patients! {
				if patient.identifier == uuid {
					patient.setValue(formatter.string(from: Date()), forKey: "dateModified")
					patient.setValue(evaluation!.bio.name.storedValue?.value, forKey: "patientName")
					patient.setValue(evaluation!.bio.age.storedValue?.value, forKey: "patientAge")
					
					do {
						let data = try JSONSerialization.data(withJSONObject: evaluation!.itemDict, options: .prettyPrinted) as NSData?
						patient.setValue(data, forKey: "evaluationData")

						saveContext()
						
					} catch let err as NSError {
						//print err
						NSLog(err.localizedDescription)
					}
					
					isFound = true
					break
				}
			}
		}
		
		if !isFound {
			let entity =  NSEntityDescription.entity(forEntityName: "Patient", in: self.managedObjectContext)
			let patient = NSManagedObject(entity: entity!, insertInto: self.managedObjectContext) as! Patient
			
			patient.setValue(evaluation!.bio.name.storedValue?.value, forKey: "patientName")
			patient.setValue(evaluation!.bio.age.storedValue?.value, forKey: "patientAge")
			patient.setValue(evaluation!.dateCreated, forKey: "dateCreated")
			patient.setValue(evaluation!.dateCreated, forKey: "dateModified")
			patient.setValue(evaluation!.evaluationUUID, forKey: "identifier")
			patient.setValue(currentDoctor?.loginName ?? "unknown", forKey: "doctorLoginName")
			do {
				let data = try JSONSerialization.data(withJSONObject: evaluation!.itemDict, options: .prettyPrinted) as NSData?
				patient.setValue(data, forKey: "evaluationData")
				patients?.append(patient)
				saveContext()
			} catch let err as NSError {
				NSLog(err.localizedDescription)
			}
		}
	}
	
	
	func extractEvaluation(by uuid: String) -> Evaluation? {
		guard patients != nil, patients!.count > 0 else  { return nil }
		
		for patient in self.patients!{
			if patient.identifier == uuid {
				do {
					let dict = try JSONSerialization.jsonObject(with: patient.evaluationData! as Data,
						options: .mutableContainers) as! Dictionary<String, Any>
					let evaluation = Evaluation(with: dict)
					self.evaluation = evaluation
					return evaluation
					
				} catch let err as NSError {
					print("Error : \(err.localizedDescription)")
				}
			}
		}
		return nil
	}
	
	
	func saveCurrentCompute() {
		guard evaluation != nil && evaluation!.isBioCompleted  else { return }
		
		var isFound = false
		let uuid = evaluation!.evaluationUUID
		
		if patients != nil && patients!.count > 0 {
			for patient in self.patients! {
				if patient.identifier == uuid {
					
					patient.setValue(String(DataManager.manager.getPAHValue()), forKey: "computeEvaluationRequestPAH")
					patient.setValue(evaluation!.bio.gender.female.isFilled ? 2:1, forKey: "computeEvaluationRequestGender")
					patient.setValue(Int((evaluation!.bio.sbp.storedValue?.value)!)!, forKey: "computeEvaluationRequestSBP")
					patient.setValue(Int((evaluation!.bio.dbp.storedValue?.value)!)!, forKey: "computeEvaluationRequestDBP")
					patient.setValue(self.getEvaluationItemsAsRequestInputsString(), forKey: "computeEvaluationRequestInputs")
					
					patient.setValue(DataManager.manager.evaluation!.outputInMain.diagnosticsResult.subtitle, forKey: "computeEvaluationResultDiagnostics")
					patient.setValue(DataManager.manager.evaluation!.outputInMain.therapeuticsResult.subtitle, forKey: "computeEvaluationResultTherapeutics")
					patient.setValue(DataManager.manager.evaluation!.outputInMain.icd10Result.subtitle, forKey: "computeEvaluationResultICD")
					patient.setValue(DataManager.manager.evaluation!.outputInMain.references.subtitle, forKey: "computeEvaluationResultReferences")
				
					saveContext()
					
					isFound = true
					break
				}
			}
		}
		
		if !isFound {
			let entity =  NSEntityDescription.entity(forEntityName: "Patient", in: self.managedObjectContext)
			let patient = NSManagedObject(entity: entity!, insertInto: self.managedObjectContext) as! Patient
			
			patient.setValue(evaluation!.bio.name.storedValue?.value, forKey: "patientName")
			patient.setValue(evaluation!.bio.age.storedValue?.value, forKey: "patientAge")
			patient.setValue(evaluation!.dateCreated, forKey: "dateCreated")
			patient.setValue(evaluation!.dateCreated, forKey: "dateModified")
			patient.setValue(evaluation!.evaluationUUID, forKey: "identifier")
			patient.setValue(currentDoctor?.loginName ?? "unknown", forKey: "doctorLoginName")
			
			patient.setValue(String(DataManager.manager.getPAHValue()), forKey: "computeEvaluationRequestPAH")
			patient.setValue(evaluation!.bio.gender.female.isFilled ? 2:1, forKey: "computeEvaluationRequestGender")
			patient.setValue(Int((evaluation!.bio.sbp.storedValue?.value)!)!, forKey: "computeEvaluationRequestSBP")
			patient.setValue(Int((evaluation!.bio.dbp.storedValue?.value)!)!, forKey: "computeEvaluationRequestDBP")
			patient.setValue(self.getEvaluationItemsAsRequestInputsString(), forKey: "computeEvaluationRequestInputs")
			
			patient.setValue(DataManager.manager.evaluation!.outputInMain.diagnosticsResult.subtitle, forKey: "computeEvaluationResultDiagnostics")
			patient.setValue(DataManager.manager.evaluation!.outputInMain.therapeuticsResult.subtitle, forKey: "computeEvaluationResultTherapeutics")
			patient.setValue(DataManager.manager.evaluation!.outputInMain.icd10Result.subtitle, forKey: "computeEvaluationResultICD")
			patient.setValue(DataManager.manager.evaluation!.outputInMain.references.subtitle, forKey: "computeEvaluationResultReferences")

			do {
				let data = try JSONSerialization.data(withJSONObject: evaluation!.itemDict, options: .prettyPrinted) as NSData?
				patient.setValue(data, forKey: "evaluationData")
				patients?.append(patient)
				saveContext()
			} catch let err as NSError {
				NSLog(err.localizedDescription)
			}
		}
	}
	
	
	func deleteEvaluation(at index: Int) {
		guard  patients != nil && index >= 0 && index < patients!.count else { return }
		managedObjectContext.delete(patients!.remove(at: index))
		saveContext()
	}
	
	
	lazy var applicationDocumentsDirectory: URL = {
		// The directory the application uses to store the Core Data store file. This code uses a directory named "com.cadiridris.coreDataTemplate" in the application's documents Application Support directory.
		let urls = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
		return urls[urls.count-1]
	}()
	
	
	lazy var managedObjectModel: NSManagedObjectModel = {
		// The managed object model for the application. This property is not optional. It is a fatal error for the application not to be able to find and load its model.
		let modelURL = Bundle.main.url(forResource: "Evaluation", withExtension: "momd")!
		return NSManagedObjectModel(contentsOf: modelURL)!
	}()
	
	
	lazy var persistentStoreCoordinator: NSPersistentStoreCoordinator = {
		// The persistent store coordinator for the application. This implementation creates and returns a coordinator, having added the store for the application to it. This property is optional since there are legitimate error conditions that could cause the creation of the store to fail.
		// Create the coordinator and store
		let coordinator = NSPersistentStoreCoordinator(managedObjectModel: self.managedObjectModel)
		let url = self.applicationDocumentsDirectory.appendingPathComponent("SingleViewCoreData.sqlite")
		var failureReason = "There was an error creating or loading the application's saved data.".localized
		do {
			try coordinator.addPersistentStore(ofType: NSSQLiteStoreType, configurationName: nil, at: url, options: nil)
		} catch {
			// Report any error we got.
			var dict = [String: AnyObject]()
			dict[NSLocalizedDescriptionKey] = "Failed to initialize the application's saved data".localized as AnyObject?
			dict[NSLocalizedFailureReasonErrorKey] = failureReason as AnyObject?
			
			dict[NSUnderlyingErrorKey] = error as NSError
			let wrappedError = NSError(domain: "YOUR_ERROR_DOMAIN", code: 9999, userInfo: dict)
			// Replace this with code to handle the error appropriately.
			// abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
			NSLog("Unresolved error \(wrappedError), \(wrappedError.userInfo)")
			abort()
		}
		
		return coordinator
	}()
	
	
	lazy var managedObjectContext: NSManagedObjectContext = {
		// Returns the managed object context for the application (which is already bound to the persistent store coordinator for the application.) This property is optional since there are legitimate error conditions that could cause the creation of the context to fail.
		let coordinator = self.persistentStoreCoordinator
		var managedObjectContext = NSManagedObjectContext(concurrencyType: .mainQueueConcurrencyType)
		managedObjectContext.persistentStoreCoordinator = coordinator
		return managedObjectContext
	}()
	
	
	
	// MARK: - Core Data Saving support
	
	func saveContext () {
		if managedObjectContext.hasChanges {
			do {
				try managedObjectContext.save()
			} catch {
				// Replace this implementation with code to handle the error appropriately.
				// abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
				let nserror = error as NSError
				NSLog("Unresolved error \(nserror), \(nserror.userInfo)")
				abort()
			}
		}
	}
	
	
	
	// MARK: - private
	
	private func fetchDoctor(loginName: String) -> [Doctor]? {
		var array: [Doctor] = [Doctor]()
		
		let managedContext = managedObjectContext
		let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Doctor")
		fetchRequest.predicate = NSPredicate(format: "loginName == %@", loginName)
		do {
			let results = try managedContext.fetch(fetchRequest)
			array = results as! [Doctor]
			
			if array.count > 1 {
				for obj in results as! [NSManagedObject] {
					managedContext.delete(obj)
				}
				return nil
			}
	
			return array.count > 0 ? array : nil
			
		} catch let error as NSError {
			print("Could not fetch \(error), \(error.userInfo)")
			return nil
		}
	}
	
	
	private func fetchDoctor(loginName: String, password: String) -> Doctor? {
		var array: [Doctor] = [Doctor]()
		
		let managedContext = managedObjectContext
		let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Doctor")
		fetchRequest.predicate = NSPredicate(format: "loginName == %@ AND password == %@", loginName, password)
		do {
			let results = try managedContext.fetch(fetchRequest)
			array = results as! [Doctor]
			
			if array.count > 1 {
				for obj in results as! [NSManagedObject] {
					managedContext.delete(obj)
				}
				return nil
			}
			
			return array.count > 0 ? array[0] : nil
			
		} catch let error as NSError {
			print("Could not fetch \(error), \(error.userInfo)")
			return nil
		}
	}
	
	
	func fetchEvaluations() {
		patients?.removeAll()
		patients = nil
		
		guard let loginName = currentDoctor?.loginName else { return }
		
		let managedContext = managedObjectContext
		let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Patient")
		fetchRequest.predicate = NSPredicate(format: "doctorLoginName == %@", loginName)
		do {
			patients = try managedContext.fetch(fetchRequest) as? [Patient]
			
		} catch let error as NSError {
			print("Could not fetch \(error), \(error.userInfo)")
		}
	}
	
	
	func fetchEvaluationsFromRestAPI(completionHandler: @escaping (String?, NSError?) -> (Void)) {
		
		guard let loginName = currentDoctor?.loginName else { return }
		
		var savedPatients: [Patient]?
		
		let managedContext = managedObjectContext
		let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Patient")
		fetchRequest.predicate = NSPredicate(format: "doctorLoginName == %@", loginName)
		do {
			savedPatients = try managedContext.fetch(fetchRequest) as? [Patient]
			
		} catch let error as NSError {
			print("Could not fetch \(error), \(error.userInfo)")
		}
		
		var deleteIndex: [String:Bool] = [String:Bool]()
		for savedPatient: Patient in savedPatients! {
			deleteIndex[savedPatient.identifier!] = true
		}
		
		RestClient.client.retrieveSavedEvaluations(success: {
			(evaluatListJson) in
			
			for (_, patientJson):(String,JSON) in evaluatListJson["evals"] {
		
				var isExist: Bool = false
				
				if savedPatients != nil && savedPatients?.count != 0 {
					for savedPatient: Patient in savedPatients! {
						if patientJson["ID"].stringValue == savedPatient.identifier {
					
							isExist = true
							deleteIndex[savedPatient.identifier!] = false
							
							if patientJson["createdate"].stringValue != savedPatient.dateModified {
								savedPatient.evaluationData = nil
							}
						}
					}
				}
				
				if !isExist {
					let entity =  NSEntityDescription.entity(forEntityName: "Patient", in: self.managedObjectContext)
					let patient = NSManagedObject(entity: entity!, insertInto: self.managedObjectContext) as! Patient
					
					patient.setValue(patientJson["Name"].stringValue, forKey: "patientName")
					patient.setValue(patientJson["createdate"].stringValue, forKey: "dateCreated")
					patient.setValue(patientJson["createdate"].stringValue, forKey: "dateModified")
					patient.setValue(patientJson["ID"].stringValue, forKey: "identifier")
					patient.setValue(self.currentDoctor?.loginName ?? "unknown", forKey: "doctorLoginName")
				}
			}
			
			for savedPatient: Patient in savedPatients! {
				if deleteIndex[savedPatient.identifier!] == true {
					self.managedObjectContext.delete(savedPatient)
				}
			}
			
			self.saveContext()
			
			completionHandler("success", nil)
			
		}, failure:  { (error) in
			print("Could not fetch \(error)")
			completionHandler(nil, error as NSError)
		})
		
	}
	

	func fetchEvaluationByIDFromRestAPI(id: Int, completionHandler: @escaping (String?, NSError?) -> (Void)) {
		
		RestClient.client.retrieveEvaluationByID(id: id, success: { (responseJson) in
			
			let evaluation = Evaluation()
			
			var parameters = [String:Any]()
			print(responseJson)
			parameters["isPAH"] = (responseJson["isPAH"].intValue == 0) ? true:false
			parameters["name"] = responseJson["Name"].stringValue
			parameters["age"] = responseJson["age"].intValue
			
			parameters["gender"] = responseJson["gender"].intValue
			
			parameters["sbp"] = responseJson["SBP"].intValue
			parameters["dbp"] = responseJson["DBP"].intValue
			
			let rest = responseJson["rest"].stringValue
			let attributes = rest.components(separatedBy: "|")
			for attribute in attributes {
				
				let index = attribute.index(attribute.startIndex, offsetBy: 3)
				let prefix = attribute.substring(to: index)
				
				if prefix == "chk" {
					parameters[attribute] = true
				} else if prefix == "txt" {
					let pair = attribute.components(separatedBy: "=")
					if pair.count == 2 {
						parameters[pair[0]] = pair[1]
					}
				}
			}
			
			for (id, value) in parameters {
				evaluation.applyToEvaluationItems(id: id, value: value)
			}
			
			// save evaluation
			if self.patients != nil && self.patients!.count > 0 {
				for patient in self.patients! {
					if Int(patient.identifier!) == id {
						
						evaluation.identifier = patient.identifier!
						
						var dict = evaluation.itemDict
						dict["evaluationStatus"] = EvaluationStatus.evaluated.rawValue
						
						patient.setValue(evaluation.bio.age.storedValue?.value, forKey: "patientAge")
						
						do {
							let data = try JSONSerialization.data(withJSONObject: dict, options: .prettyPrinted) as NSData?
							patient.setValue(data, forKey: "evaluationData")
							
							self.saveContext()
							
						} catch let err as NSError {
							//print err
							NSLog(err.localizedDescription)
						}
						
						break
					}
				}
			}
			
			self.evaluation = evaluation
			self.evaluation?.evaluationStatus = .evaluated
			completionHandler("success", nil)
			
		}, failure: { (error) in
			print("Could not fetch \(error)")
			completionHandler(nil, error as NSError)
		})
	}
	
	
	func extractHrefFromHTML(htmlString: String) -> String {
		return htmlString
	}
	
	
	func setOutputEvaluation(response:JSON)-> Void{
		//let bulletPoint: String = "\u{2022}"
		
		cleanUpOutputForm()
		
		var results : [String:Bool] = ["Diagnostics":false,"Therapeutics":false,"ICD":false,"References":false]
		
		for(_,group):(String,JSON) in response["outputs"]{
			var row:String = ""
			
			// Show only incoming results
			results[String(describing: group["groupname"])] = true
			
			if group["groupname"] == "References" {
				
				for (_, field):(String,JSON) in group["fields"] {
					row.append(String(describing: field["val"]))
					row.append("<br/>")
				}
				
			} else {
				
				for (_, field):(String,JSON) in group["fields"]{
					//let line = String(describing: field["val"]).html2AttributedString?.string;
					
					let lineV2 = String(describing: field["val"]).data.attributedString?.string
					
					//row.append(bulletPoint+" "+line!+"\n")
					//row.append(line!+"\n")
					row.append(lineV2!+"\n")
					
				}
			}
			
			switch group["groupname"] {
			//case "Outputs":
				//DataManager.manager.evaluation!.outputInMain.resultOutput.subtitle = row
				//break;
			case "Diagnostics":
				DataManager.manager.evaluation!.outputInMain.diagnosticsResult.subtitle = row
				break;
			case "Therapeutics":
				DataManager.manager.evaluation!.outputInMain.therapeuticsResult.subtitle = row
				break;
			case "ICD":
				DataManager.manager.evaluation!.outputInMain.icd10Result.subtitle = row
				break;
			case "References":
				DataManager.manager.evaluation!.outputInMain.references.subtitle = row
				break;
				
			default:
				print("There is no result for the inquiry")
			}
		}
		self.outputs = results
			//print(results)
	}
	
	
	func getResults()->[String:Bool]{
		return self.outputs
	}
	
	
	func isEvaluationChanged() -> Bool {
		
		var savedPatients: [Patient] = [Patient]()
		
		guard let loginName = currentDoctor?.loginName else { return true}
		
		let managedContext = managedObjectContext
		let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Patient")
		fetchRequest.predicate = NSPredicate(format: "doctorLoginName == %@", loginName)
		do {
			savedPatients = try managedContext.fetch(fetchRequest) as! [Patient]
			
		} catch let error as NSError {
			print("Could not fetch \(error), \(error.userInfo)")
		}
		
		let uuid = evaluation!.evaluationUUID
		
		if savedPatients.count > 0 {
			for patient in savedPatients {
				if patient.identifier == uuid {
					
					guard let cerPAH = patient.value(forKey: "computeEvaluationRequestPAH") as? String, !cerPAH.isEmpty,
						let cerINPUTS = patient.value(forKey: "computeEvaluationRequestInputs") as? String, !cerINPUTS.isEmpty else {
							return true
					}
					
					let isPAH = String(DataManager.manager.getPAHValue())
					let gender = evaluation!.bio.gender.female.isFilled ? 2:1
					let SBP = Int((evaluation!.bio.sbp.storedValue?.value)!)!
					let DBP = Int((evaluation!.bio.dbp.storedValue?.value)!)!
					let inputs = self.getEvaluationItemsAsRequestInputsString()
					
					if isPAH == cerPAH &&
						gender == patient.value(forKey: "computeEvaluationRequestGender") as! Int &&
						SBP == patient.value(forKey: "computeEvaluationRequestSBP") as! Int &&
						DBP == patient.value(forKey: "computeEvaluationRequestDBP") as! Int &&
						inputs == cerINPUTS
					{
						DataManager.manager.evaluation!.outputInMain.diagnosticsResult.subtitle = patient.value(forKey: "computeEvaluationResultDiagnostics") as? String
						DataManager.manager.evaluation!.outputInMain.therapeuticsResult.subtitle = patient.value(forKey: "computeEvaluationResultTherapeutics") as? String
						DataManager.manager.evaluation!.outputInMain.icd10Result.subtitle = patient.value(forKey: "computeEvaluationResultICD") as? String
						DataManager.manager.evaluation!.outputInMain.references.subtitle = patient.value(forKey: "computeEvaluationResultReferences") as? String
						
						return false
					}
				}
			}
		}
		
		return true
	}
	
	
	func cleanUpOutputForm() -> Void{
		DataManager.manager.evaluation!.outputInMain.diagnosticsResult.subtitle = "No Result" 
		DataManager.manager.evaluation!.outputInMain.therapeuticsResult.subtitle = "No Result"
		DataManager.manager.evaluation!.outputInMain.icd10Result.subtitle = "No Result"
		DataManager.manager.evaluation!.outputInMain.references.subtitle = "No Result"
	}
	
	
	func getEvaluationItemsAsRequestInputsString()->String{
		
		var inputsStrings = [String]()
		recursiveEvaluationItemsByString(evaluationItem: DataManager.manager.evaluation!, inputs: &inputsStrings)
		//TODO remove empty and first | from the result
		var result: String = "empty"
		
		if (DataManager.manager.evaluation!.bio.weight.storedValue?.value != nil) {
			result = result + "|weight=" + (DataManager.manager.evaluation!.bio.weight.storedValue?.value)!
		}
		
		if DataManager.manager.evaluation!.bio.heartRate.storedValue?.value != nil {
			result = result + "|HR=" + (DataManager.manager.evaluation!.bio.heartRate.storedValue?.value)!
		}
		
		for s in inputsStrings {
			if s != "" {
				result = result + "|" + s
			}
		}
		print(result)
		return result
	}
	
	
	func recursiveEvaluationItemsByString(evaluationItem:EvaluationItem, inputs: inout [String])-> Void {
		
		// search all EvaluationItem inside of model
		for item in evaluationItem.items {
			recursiveEvaluationItemsByString(evaluationItem: item, inputs: &inputs)
			if (item.storedValue != nil) {
				inputs.append(valueToQueryFormat(item: item))
			}
		}
		
		for item in evaluationItem.storedItems {
			recursiveEvaluationItemsByString(evaluationItem: item, inputs: &inputs)
			if (item.storedValue != nil) {
				inputs.append(valueToQueryFormat(item: item))
			}
		}
	}
	
	
	//TODO make sure all identifier are compatible with server side
	func valueToQueryFormat(item: EvaluationItem) -> String {
		if (item.identifier.utf16.count <= 3) {
			return ""
		}
		let index = item.identifier.index(item.identifier.startIndex, offsetBy: 3)
		let prefix = item.identifier.substring(to: index)
		
		var inputs = [String]()
		if(item.radioGroups.count > 0) {
			for radioGroup in item.radioGroups {
				if radioGroup.selectedRadioItem != nil {
					inputs.append(radioGroup.selectedRadioItem!)
				}
			}
			
		}
		
		if (prefix == "chk" && item.storedValue?.radioGroup?.selectedRadioItem == item.identifier){
//			print("chkpharm is added")
			inputs.append(item.identifier)
//			print(item.storedValue?.isChecked)
//			print(item.storedValue?.placeholder)
//			print(item.storedValue?.radioGroup?.selectedRadioItem)
		}
		else if (prefix == "chk" && item.storedValue?.radioGroup?.selectedRadioItem == item.identifier){
//			print("chkCV is added")
			inputs.append(item.identifier)
//			print(item.storedValue?.isChecked)
//			print(item.storedValue?.placeholder)
//			print(item.storedValue?.radioGroup?.selectedRadioItem)
		}
		
		if (item.storedValue?.isChecked)! {
			
			if(prefix == "chk") {
				print("Identifier: " + item.identifier)
				inputs.append(item.identifier)
			}
			else if (item.identifier == "rbAnginaIndex") {
				if (item.storedValue?.isChecked)! {
					if item.radioGroups[0].selectedRadioItem != nil {
						let selectedRadio = item.radioGroups[0].selectedRadioItem!
						if selectedRadio == "secno_angina_during_exercise" {
							inputs.append("rbAnginaIndex=0")
						} else if selectedRadio == "secnon_limiting_angina" {
							inputs.append("rbAnginaIndex=1")
						} else if selectedRadio == "secexercise_limiting_angina" {
							inputs.append("rbAnginaIndex=2")
						}
					}
				}
			}
		}
		else if (item.storedValue?.isFilled)! {
			if( prefix == "txt") {
				if (item.storedValue?.value != nil) {
					
					let value: String = (item.storedValue?.value)!
					inputs.append(item.identifier + "=" + value)
				}
			}
		}
		
		var finalInputsString = ""
		for item in inputs {
			if !item.isEmpty {
				if finalInputsString.characters.count > 0 {
					finalInputsString = finalInputsString + "|" + item
				} else {
					finalInputsString = item
				}
			}
		}
		print(finalInputsString)
		return finalInputsString
	}

	func equalizeAllItems() ->Void{
		
		let regularItem = DataManager.manager.evaluation!
		let pahItems = DataManager.manager.evaluation!.heartSpecialistManagement

		for pahItem in pahItems.items {
			for item in regularItem.items {
//				print(item.identifier + " -- " + pahItem.identifier)
				
				if (item.items.count > 0 && pahItem.items.count == 0) {
					checkInsideofRegularItem(item: item.items, pahItem: pahItem)
				}else if (item.items.count == 0 && pahItem.items.count > 0) {
					checkInsideofPahItem(item:item, pahItem: pahItem.items)
				}else if (item.items.count > 0 && pahItem.items.count > 0) {
					checkInsideofAllItem(item: item.items, pahItem: pahItem.items)
				}else if (item.identifier == pahItem.identifier && item.identifier.characters.count >= 3) {
//					print(pahItem.identifier + ": \(String(describing: pahItem.storedValue?.value))" + " equals! " + item.identifier + ": \(String(describing: item.storedValue?.value))")
					let index = item.identifier.index(item.identifier.startIndex, offsetBy: 3)
					let prefix = item.identifier.substring(to: index)

					if (prefix == "chk" && item.storedValue?.isChecked != false){
						pahItem.storedValue?.isChecked = true
					}else{
						pahItem.storedValue?.value = item.storedValue?.value
					}
				} else if (item.identifier == pahItem.identifier && pahItem.identifier == "HR") {
					pahItem.storedValue?.value = item.storedValue?.value
				}
			}
		}
	}
	
	
	func checkInsideofRegularItem(item: [EvaluationItem], pahItem: EvaluationItem) -> Void {
		
		for regItem in item {
			
//			print(regItem.identifier + " ---- " + pahItem.identifier)
			
			if (regItem.items.count > 0) {
				checkInsideofRegularItem(item: regItem.items, pahItem: pahItem)
			} else if (regItem.identifier == pahItem.identifier && regItem.identifier.characters.count >= 3) {
//				print(pahItem.identifier + " equals " + regItem.identifier)
				let index = regItem.identifier.index(regItem.identifier.startIndex, offsetBy: 3)
				let prefix = regItem.identifier.substring(to: index)
				
				if (prefix == "chk" && regItem.storedValue?.isChecked != false){
					pahItem.storedValue?.isChecked = true
				} else{
					pahItem.storedValue?.value = regItem.storedValue?.value
				}
			} else if (regItem.identifier == pahItem.identifier && pahItem.identifier == "HR") {
				pahItem.storedValue?.value = regItem.storedValue?.value
			}
		}
		
	}
	
	
	func checkInsideofPahItem(item: EvaluationItem, pahItem: [EvaluationItem]) -> Void {
		
		for pItem in pahItem {
			
//			print(item.identifier + " ---- -- " + pItem.identifier)
			
			if (pItem.items.count > 0) {
				checkInsideofPahItem(item:item, pahItem: pItem.items)
			} else if (item.identifier == pItem.identifier && item.identifier.characters.count >= 3) {
//				print(pItem.identifier + " -- equals " + item.identifier)
				let index = item.identifier.index(item.identifier.startIndex, offsetBy: 3)
				let prefix = item.identifier.substring(to: index)
				
				if (prefix == "chk" && item.storedValue?.isChecked != false){
					pItem.storedValue?.isChecked = true
				} else{
					pItem.storedValue?.value = item.storedValue?.value
				}
			} else if (item.identifier == pItem.identifier && pItem.identifier == "HR") {
				pItem.storedValue?.value = item.storedValue?.value
			}
		}
	}
	
	
	func checkInsideofAllItem(item: [EvaluationItem], pahItem: [EvaluationItem]) -> Void {
		
		for regItem in item {
			
			for pItem in pahItem {
				
//				print(regItem.identifier + " ---- -- -- " + pItem.identifier)
				
				if (regItem.items.count > 0 && pItem.items.count == 0) {
					checkInsideofRegularItem(item: regItem.items, pahItem: pItem)
				} else if (regItem.items.count == 0 && pItem.items.count > 0) {
					checkInsideofPahItem(item:regItem, pahItem: pItem.items)
				} else if (regItem.items.count > 0 && pItem.items.count > 0) {
					checkInsideofAllItem(item: regItem.items, pahItem: pItem.items)
				} else if (regItem.identifier == pItem.identifier && regItem.identifier.characters.count >= 3) {
//					print(pItem.identifier + " -- -- equals " + regItem.identifier)
					
					let index = regItem.identifier.index(regItem.identifier.startIndex, offsetBy: 3)
					let prefix = regItem.identifier.substring(to: index)
					
					if (prefix == "chk" && regItem.storedValue?.isChecked != false ){
						pItem.storedValue?.isChecked = true
					} else{
						pItem.storedValue?.value = regItem.storedValue?.value
					}
				} else if (regItem.identifier == pItem.identifier && pItem.identifier == "HR") {
					pItem.storedValue?.value = regItem.storedValue?.value
				}
			}
		}
	}
	
	
	func resetAllPAHItems() -> Void {
		let pahModel = DataManager.manager.evaluation!.heartSpecialistManagement.items
		
		for item in pahModel {
			
			if(item.items.count > 0){
				resetPahItem(item: item.items)
			} else if (item.identifier.characters.count >= 3){
				let index = item.identifier.index(item.identifier.startIndex, offsetBy: 3)
				let prefix = item.identifier.substring(to: index)
				
				if (prefix == "chk"){
					item.storedValue?.isChecked = false
				} else{
					item.storedValue?.value = nil
				}
			} else if (item.identifier == "HR") {
				item.storedValue?.value = nil
			}
		}
	}
	
	
	func resetPahItem(item: [EvaluationItem]) -> Void {
		
		for pItem in item {
			
			if (pItem.items.count > 0){
				resetPahItem(item: pItem.items)
			} else if (pItem.identifier.characters.count >= 3) {
				let index = pItem.identifier.index(pItem.identifier.startIndex, offsetBy: 3)
				let prefix = pItem.identifier.substring(to: index)
				
				if (prefix == "chk"){
					pItem.storedValue?.isChecked = false
				} else{
					pItem.storedValue?.value = nil
				}
			} else if (pItem.identifier == "HR") {
				pItem.storedValue?.value = nil
			}
		}
	}
}
