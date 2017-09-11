//
//  Presentation.swift
//  CVDEvaluator
//
//  Created by IgorKhomiak on 2/10/17.
//  Copyright © 2017 IgorKhomiak. All rights reserved.
//

import UIKit


func identifierBy(literal: String) -> String {
	let components: [String] = literal.components(separatedBy: "|")
	
	var identifier: String = "unsupported"
	
	for strItem in components {
		
		let strTrimmed = strItem.trimmingCharacters(in: .whitespacesAndNewlines)
		guard strTrimmed.hasPrefix("#") else { continue }
		
		let components: [String] = strTrimmed.components(separatedBy: ":")
		guard components.count == 2 else { continue }
		
		let trimmedKeyComponent = components[0].trimmingCharacters(in: .whitespacesAndNewlines)
		guard let key = PresentationKey(rawValue: trimmedKeyComponent) else { continue }
		
		let storedValue = components[1].trimmingCharacters(in: .whitespacesAndNewlines)
		
		switch key {
		case .id:
			identifier = storedValue
		default:
			()
		}
	}
	return identifier
}


enum PresentationKey: String {
	case id = "#id"
	case title = "#title"
	case subtitle = "#subtitle"
	case type = "#type"
	case height = "#height"
	case placeholder = "#placeholder"
	case min = "#min"
	case max = "#max"
	case maxLength = "#maxLength"
	case value = "#value"
	case group = "#group"
	case mandatory = "#mandatory"
	case selected = "#selected"
	case text = "#text"
	case alert = "#alert"
	case dependsOn = "#dependsOn"
	case dependMin = "#dependMin"
	case dependMax = "#dependMax"
	case subItems = "#subItems"
}


struct Presentation {
	
	// Global:
	static let separator = "#type:#separator| #title: untitled| #id: separator"
	static let evaluation = "#type:#model| #title: Evaluation| #id: evaluation"
	
	//
	// MARK: - Evaluation: https://zpl.io/Z1WoemX
	//
	static let bio = 			"#id:bio |      #title:Bio |  #type:#disclosureVieved | #mandatory: 1"
	static let symptoms = 	"#id:symptoms|  #title:Symptoms|  #type:#disclosureVieved"
	static let reviewOfSystem = 	"#id:reviewOfSystem|  #title:Review of Systems|  #type:#disclosureVieved"
	static let physicalExam = "#id:currentPastCVProfile| #title:Physical Exam| #type:#disclosureVieved"
	static let cvProfile = 	"#id:cvProfile| #title:Cardiovascular| #type:#disclosureVieved"
	static let pulmonary = 	"#id:pulmonary| #title:Pulmonary| #type:#disclosureVieved"
	static let renal = 	"#id:renal | #title:Renal | #type:#disclosureVieved"
	static let riskFactors = 	"#id:riskFactors| #title:Major CV Risk Factors| #type:#disclosureVieved"
	static let surgicalRisk = 	"#id:surgicalRisk| #title:Noncardiac Surgical Risk| #type:#disclosureVieved"
	static let laboratories = "#id:laboratories| #title:Laboratories| #type:#disclosureVieved"
	static let diagnostics = "#id:diagnostics| #title:Diagnostics| #type:#disclosureVieved"
	static let hsr = "#id:nsr| #title:Current Therapies| #type:#disclosureVieved"
	
	static let heartSpecialistManagement = "#id:heartSpecialistManagement| #title:Heart Specialist Management | #type:#disclosureVieved"
	static let outputInMain = "#id:outputInMain| #title:Results | #type:#disclosureVieved"
	
	
	//
	// MARK: - Bio: https://zpl.io/27Yx0I
	//
	static let name = 		"#id:name|      #title:Name|      #type:#textLeft |  #placeholder: Patient Name  | #maxLength: 50 | #mandatory: 1"
	static let age = 			"#id:age |      #title:Age|       #type:#integerLeft|   #min:20|  #max:100| #placeholder: Patient Age | #mandatory: 1"
	//static let gender = 		"#id:gender|    #title:Gender*|    #type:#disclosureSimple | #height: 60"
	static let gender = 		"#id:gender|    #title:Gender*|    #type:#disclosureSimpleExpandable | #height: 60"
	static let bmi = 		"#id:txtBMI|    #title:BMI|    #type:#integerLeft|   #min:10.0|  #max:50.0| #placeholder: BMI Value"
	static let weight = 		"#id:weight|    #title:Weight|    #type:#integerLeft|   #min:40|  #max:400| #placeholder: Weight/kg"
	static let heartRate = 	"#id:HR| #title:Heart Rate| #type:#integerLeft| #min:30|  #max:300| #placeholder: Heart Rate"
	static let bioSBP = 		"#id:sbp|       #title:SBP|  #type:#decimalLeft| #min:60|  #max:300| #placeholder: SBP mmHg | #mandatory: 1"
	static let bioDBP = 		"#id:dbp|       #title:DBP|  #type:#decimalLeft| #min:30|  #max:160| #placeholder: DBP mmHg | #mandatory: 1"
	static let bioOrthostaticSBP = 		"#id:OrthostaticSBP|       #title:Orthostatic SBP|  #type:#decimalLeft| #min:0|  #max:240| #placeholder: DBP mmHg"
	static let bioOrthostaticSymptoms = "#id:chkSymptomatic|    #title:Orthostatic Symptoms | #type:#check"
	static let bioWaistCirc = "#id:waist | #title:Waist Circ. |  #type:#decimalLeft| #min:20|  #max:60| #placeholder: DBP mmHg "
	static let bioAA = "#id:chkAsianCode  |  #title:AA |    #type:#check"
	static let bioPregnancy = "#id:chkpreg |    #title:Pregnancy |    #type:#check"
	static let bioO2sat = "#id:txtO2sat | #title:O2sat% |  #type:#decimalLeft| #min:50|  #max:100| #placeholder: O2sat% "
	
	// Bio -> Gender: https://zpl.io/Z16UrC4
	static let male = 		"#id:male|    #title:Male|    #type:#radio | #group: (male, female)"
	static let female = 		"#id:female|    #title:Female|    #type:#radio | #group: (male, female)"
	
	static let maleInHMS = 		"#id:maleInHMS|    #title:Male|    #type:#radio | #group: (maleInHMS, femaleInHMS)"
	static let femaleInHMS = 		"#id:femaleInHMS|    #title:Female|    #type:#radio | #group: (maleInHMS, femaleInHMS)"
	
	
	//
	// MARK: - Symptoms: https://zpl.io/gVaLh
	//
	static let dyspnea = "#id: chkDyspnea | #title: Dyspnea | #type: #disclosureControl"
	static let chestPain = "#id: chkCP | #title: Chest Pain | #type: #disclosureControl"
	static let syncope = "#id: chkTestSyncope | #title: Syncope/Presyncope | #type: #disclosureControl"
	static let edemaInSymptoms = "#id:secedema | #title:Edema | #type:#disclosureControl"
	static let weakness = "id:chkmalaise | #title:Weakness | #type:#disclosureControlExpandable"
	static let palpitationsInSymptoms = "#id:chkp| #title:Palpitations| #type:#disclosureControl"
	static let abdominalPain = "#id:chkplaceholderone | #title:Abdominal Pain | #type:#disclosureControl"
	static let shock = "#id:chkss | #title:Shock | #type:#disclosureControl"
	
	// Symptoms -> Dyspnea: https://zpl.io/Z1jN2eH
	static let pleaseSelectOneLabel = "#id:pleaseSelectOneLabel|    #title:Please select one|    #type:#label "
	static let chronicHFWithKnownEtiology = "#id:chkHFPLVF|    #title:Chronic HF with Known Etiology|    #type:#radio | #group: (chronicHFWithKnownEtiology, newOnsetSuspectedHF, chronicLungDisease) | #selected: 1"
	static let newOnsetSuspectedHF = "#id:chknewHF|    #title:New Onset/Suspected HF|    #type:#radio | #group: (chronicHFWithKnownEtiology, newOnsetSuspectedHF, chronicLungDisease) | #selected: 1"
	static let chronicLungDisease = "#id:chklung|    #title:Chronic Lung Disease|    #type:#radio | #group: (chronicHFWithKnownEtiology, newOnsetSuspectedHF, chronicLungDisease) | #selected: 1"
	
	static let outpatient = "#id:chkD5| #title:Ambulatory / Outpatient|    #type:#check|"
	static let emergencyRoom = "#id:chkD4| #title:Escalating / Emergency Room|    #type:#check"
	
	// Symptoms -> Dyspnea -> Decompensated / Hospitalized
	static let inHospitalLabel = "#id:inHospitalLabel|    #title:Decompensated / Hospitalized|    #type:#disclosureControlExpandable"
	static let day1 = "#id:chkD1|    #title:Day 1|    #type:#check"
	static let day2 = "#id:chkD2|    #title:Day 2|    #type:#check"
	static let day3 = "#id:chkD3|    #title:Day 3|    #type:#check"
	
	// Symptoms -> Dyspnea -> Dyspnea on Exertion https://zpl.io/xTF0A
	static let dyspneaOnExertionNotAtRest = "#id:chkDOE|    #title:Dyspnea on Exertion|    #type:#disclosureControlExpandable"
	static let strenousExertion = "#id:chkclass1|    #title:Strenous Exertion|    #type:#check"
	static let moreThanDailyRoutine = "#id:chkclass2|    #title:More than Daily Routine|    #type:#check"
	static let dailyRoutineMinimalActivities = "#id:chkclass3|    #title:Daily Routine / Minimal Activities |  #type:#check"
	
	static let dyspneaAtRestOrphopnea = "#id:chkdysp|    #title:Dyspnea at Rest|    #type:#check"
	static let weightGain = "#id:chkWeight|    #title:Weight Gain|    #type:#check"
	
	// Symptoms -> Chest Pain https://zpl.io/xUvxt
	static let emergencyRoomInChestPain = "#id:chkER | #title:Emergency Room | #type:#disclosureControl"
	static let typicalAnginaNewInChestPain = "#id:chkTA | #title:Typical Angina  | #type:#disclosureControlExpandable"
	static let probablyAnginaNewInChestPain = "#id:chkPA | #title:Probable Angina | #type:#disclosureControlExpandable"
	static let undeterminedCPNewInChestPain = "#id:chkNCP | #title:Undetermined Chest Pain | #type:#disclosureControl"
	static let unableToExerciseInChestPain = "#id:chkunable | #title:Unable To Exercise | #type:#check"
	
	// Symptoms -> Chest Pain -> Emergency Room https://zpl.io/ZwjY5c
	static let more2TypicalOrProbableAngina = "#id:chkangina | #title:≥ 2 Typical or Probable Angina | #type:#check"
	static let typicalOrProbableAnginaMore20Min = "#id:chkangina20 | #title:Typical Or Probable Angina > 20 Min | #type:#check"
	static let ASAUseInPast1Week = "#id:chkASAuse | #title:ASA Use in Past 1 Week | #type:#check"
	static let positiveTroponin = "#id:chkpositivetrop | #title:Positive Troponin | #type:#disclosureControlExpandable"
	
	// Symptoms -> Chest Pain -> Emergency Room -> Positive Troponin
	static let blntrop2 = "#id:chktrop2 | #title:Troponin X ≥ 3 Above Normal | #type:#check"
	static let blntrop3 = "#id:chktrop3 | #title:Troponin X 1-3 Above Normal | #type:#check"
	
	//	Symptoms -> Chest Pain -> Typical Angina  https://zpl.io/ZwjYrj
	static let escalatingInFrequency = "#id:chkescTA| #title:Escalating in Frequency, Duration or Severity | #type:#check"
	
	//	Symptoms -> Chest Pain -> Probale Angina https://zpl.io/ZwjYrj
	static let probableEscalatingInFrequency = "#id:chkescTA| #title:Escalating in Frequency, Duration or Severity | #type:#check"
	
	//	Symptoms -> Chest Pain -> Undetermined CP, New https://zpl.io/25x7ix
	static let sideSemithorax = "#id:chkpleur | #title:Side/Hemithorax | #type:#disclosureControl"
	static let intercostalCP = "#id:chkCPbreath | #title:Intercostal CP | #type:#disclosureControl"
	static let сentralPrecordialCP = "#id:chkPrecordial| #title:Central/Precordial CP | #type:#disclosureControl"
	
	// Symptoms -> Chest Pain -> Undetermined CP, New -> Details
	static let qualityLabel = "#id: qualityLabel|    #title: Quality|    #type:#label"
	static let blnCPSharp = "#id: chkCPSharp|    #title: Sharp|    #type:#check"
	static let blnCPPressure = "#id: chkCPPressure|    #title: Pressure|    #type:#check"
	static let blnCPTightness = "#id: chkCPTightness|    #title: Tightness|    #type:#check"
	static let blnCPSoreness = "#id: chkCPSoreness|    #title: Soreness|    #type:#check"
	static let blnTearing = "#id: chktearing|    #title: Heaviness|    #type:#check"
	
	// Symptoms -> Chest Pain -> Undetermined CP, New -> Aggravated By
	static let aggravatedByLabel = "#id: aggravatedByLabel|    #title: Aggravated By|    #type:#label"
	static let blnCPLying = "#id: chkCPLying|    #title: Lying|    #type:#check"
	static let blnCPBreathing = "#id: chkCPBreathing|    #title: Breathing|    #type:#check"
	static let blnCPCoughing = "#id: chkCPCoughing|    #title: Coughing|    #type:#check"
	static let blnCPExertion = "#id: chkCPExertion|    #title: Exertion|    #type:#check"
	static let blnCPPalpation = "#id: chkCPPalpation|    #title: Palpation|    #type:#check"
	
	// Symptoms -> Chest Pain -> Undetermined CP, New -> Relieved By
	static let relievedByLabel = "#id: relievedByLabel|    #title: Relieved By|    #type:#label"
	static let blnCPNTG = "#id: chkCPNTG|    #title: NTG|    #type:#check"
	static let blnCPRest = "#id: chkCPRest|    #title: Rest|    #type:#check"
	static let blnCPSitting = "#id: chkCPSitting|    #title: Sitting|    #type:#check"
	static let blnCPlyingside = "#id: chkCPlyingside|    #title: Lying On-Side|    #type:#check"
	static let blnCPAnalgesics = "#id: chkCPAnalgesics|    #title: Analgesics|    #type:#check"
	
	// Symptoms -> Chest Pain -> Undetermined CP, New -> Radiation
	static let radiationLabel = "#id: radiationLabel|    #title: Radiation|    #type:#label"
	static let blnCPJaw = "#id: chkCPJaw|    #title: Jaw|    #type:#check"
	static let blnCPBack = "#id: chkCPBack|    #title: Back|    #type:#check"
	static let blnCPArm = "#id: chkCPArm|    #title: Arm|    #type:#check"
	
	// Symptoms -> Chest Pain -> Undetermined CP, New -> Associated With
	static let associatedWithLabel = "#id: associatedWithLabel|    #title: Associated With|    #type:#label"
	static let blnCPDyspnea = "#id: chkCPDyspnea|    #title: Dyspnea|    #type:#check"
	static let blnCPNausea = "#id: chkCPNausea|    #title: Nausea|    #type:#check"
	static let blnCPDiaph = "#id: chkCPDiaph|    #title: SICD|    #type:#check"
	static let blnCPFaint = "#id: chkCPFaint|    #title: Faintness|    #type:#check"
	static let blnCPPalpitations = "id: chkCPPalpitations | #title: Palpitations| #type: #check"
	
	// Symptoms -> Chest Pain -> Undetermined CP, New -> Lasting
	static let lastingLabel = "#id: lastingLabel|    #title: Lasting|    #type:#label"
	static let blnCPseconds = "#id: chkCPseconds|    #title: Seconds|    #type:#check"
	static let blnCPminutes = "#id: chkCPminutes|    #title: Minutes|    #type:#check"
	static let blnCPhours = "#id: chkCPhours|    #title: Hours|    #type:#check"
	static let blnCPconstant = "#id: chkCPconstant|    #title: Constant|    #type:#check"
	
	//	Symptoms -> Syncope/Presyncope https://zpl.io/14EXv7
	static let circumstanceLabel = "#id:circumstanceLabel | #title:Circumstance | #type:#label"
	static let uprightPositionPostExertion = "#id:chkSynStanding | #title:Upright Position, Post Exertion, Duration or Severity | #type:#check"
	static let suddenNoiseOrEmotion = "#id:chkSynOther | #title:Sudden noise or emotion | #type:#check"
	static let neckMovementManipulation = "#id:chkSynneck | #title:Neck movement, Manipulation | #type:#check"
	static let exertional = "#id:chkSynProSitting | #title:Exertional | #type:#check"
	static let sporadic = "id:chkSynsporadic| #title: Sporadic| #type:#check"
	
	static let prodromalSymptoms = "#id:prodromalSymptoms | #title:Prodromal Symptoms | #type:#label"
	static let nausea = "#id:chkSynNausea | #title:Nausea | #type:#check"
	static let dizziness = "#id:chkSynDizziness | #title:Dizziness | #type:#check"
	static let palpitations = "#id:chkSynPalpitations | #title:Palpitations | #type:#check"
	static let chestPainInProdromalSymptoms = "#id:chkSynProCP | #title:Chest Pain | #type:#check"
	static let aura = "#id:chkSynaura | #title:Aura | #type:#check"
	
	static let syncopeDurationDuringSyncope = "#id:txtSynMin | #title:Syncope Duration/During Syncope | #type:#label | #height:65"
	// Mark: minutes seconds custom cell
	static let durationMinutesSeconds = "#id:txtSynSec | #title: Duration | #type:#minutesSeconds | #min:0|  #max:1000|"
	static let cyanosis = "#id:chkSynNone | #title:Cyanosis | #type:#check"
	static let pallorDiaphoresis = "#id:chkSynpallor | #title:Pallor, Diaphoresis | #type:#check"
	static let unusualPosture = "#id:chkSynposture | #title:Unusual Posture | #type:#check"
	
	static let postictalSymptoms = "#id:postictalSymptoms | #title:Postictal Symptoms | #type:#label"
	static let disorientation = "#id:chkSynDisor | #title:Disorientation | #type:#check"
	static let paralysis = "#id:chkSynPara | #title:Paralysis | #type:#check"
	static let chestPainInPostictalSymptoms = "#id:chkSynPosCP | #title:Chest Pain | #type:#check"
	static let prolongedFatigue = "#id:chkSynfatigue | #title:Prolonged Fatigue | #type:#check"
	static let traumaticInjury = "#id:chkSyntrauma | #title:Traumatic Injury | #type:#check"
	
	// Symptoms -> Edema
	static let pittingEdema = "#id:chkpitting | #title:Pitting  | #type:#check"
	static let nonpittingEdema = "#id:chknonpitting | #title:Nonpitting  | #type:#check"
	static let localizedEdema = "#id:chklocaledema | #title:Localize  | #type:#check"
	static let diffuseEdema = "#id:chkdiffusedema | #title:Diffuse  | #type:#check"
	
	//	Symptoms -> Weakness
	static let malaiseFatigue = "#id:malaiseFatigue | #title:Malaise/Fatigue | #type:#check"
	
	// Symptoms  -> Palpitations
//	static let frequencyPalpitations = "#id:chkFrequencyPalp  | #title:Frequency | #type:#disclosureControl"
//	static let typePalpitations = "#id:chkType | #title:Type | #type:#disclosureControl"
//	static let durationPalpitations = "#id:chkDuration  | #title:Duration | #type:#disclosureControl"
//	static let syncopePalpitations = "#id:chkSyncope | #title:Caput Syncope | #type:#disclosureControl"
//	static let ekgPalpitations = "#id:chkEKGPalpPlaceholder | #title:EKG findings during palpitations | #type:#disclosureControl"
//	static let onsetPalpitations = "#id:chkOnset | #title:Onset, trigger | #type:#disclosureControl"
	
	// Symptoms  -> Palpitations -> Frequency
	static let frequencyPalpitationsLabel = "#id: frequencyLabel| #title:Frequency | #type:#label"
	static let dailyFreqPalpitations = "#id:chkpalday | #title:Daily | #type:#check"
	static let weeklyFreqPalpitations = "#id:chkpalweek | #title:Weekly | #type:#check"
	static let monthlyFreqPalpitations = "#id:chkpalmonth | #title:Monthly | #type:#check"
	static let yearlyFreqPalpitations = "#id:chkpalyear | #title:Yearly| #type:#check"
	
	// Symptoms -> Palpitations -> Type
	static let typePalpitationsLabel = "#id: typePalpitations | #title:Type | #type:#label"
	static let extrasystolicTypePalpitations = "#id:chkextrasys | #title:Extrasystolic | #type:#check"
	static let tachycardicTypePalpitations = "#id:chktachycardic | #title:Tachycardic | #type:#disclosureControlExpandable"
	static let anxietyTypePalpitations = "#id:chkanxiety | #title:Anxiety | #type:#check"
	static let pulsationTypePalpitations = "#id:chkpulsation | #title:Pulsation| #type:#check"
	
	// Symptoms -> Palpitations -> Type -> Tachycardic
	static let abruptTachycardicTypePalpitations = "#id:chkvagalabrupt | #title:Abrupt termination | #type:#check"
	static let gradualTachycardicTypePalpitations = "#id:chkvagalgradual | #title:Gradual termination | #type:#check"
	static let noresponseTachycardicTypePalpitations = "#id:chkvagalnoresponse | #title:No response | #type:#check"
	
	// Symptoms -> Palpitations -> Duration
	static let durationPalpitationsLabel = "#id: durationPalpitations | #title:Symptom Duration | #type:#label"
	static let secondsDurationPalpitations = "#id:txtpalseconds | #title:Seconds | #type:#integerLeft|   #min:0|  #max:60| #placeholder: Value"
	static let minutesDurationPalpitations = "#id:txtpalminutes | #title:Minutes | #type:#integerLeft|   #min:0|  #max:60| #placeholder: Value"
	static let hoursDurationPalpitations = "#id:txtpalhours | #title:Hours | #type:#integerLeft|   #min:0|  #max:300| #placeholder: Value"
	
	// Symptoms -> Palpitations ->  Syncope
	static let syncopePalpitationsLabel = "#id: syncopePalpitations | #title:Syncope | #type:#label"
	static let palSyncopePalpitations = "#id:chkpalsyncope | #title:Syncope | #type:#check"
	static let anginaSyncopePalpitations = "#id:chkpalangina | #title:Angina or dyspnea | #type:#check"
	static let polyuriaSyncopePalpitations = "#id:chkpalpolyuria | #title:Polyuria| #type:#check"
	static let pulsationsSyncopePalpitations = "#id:chkpalneck | #title:Pulsations in neck | #type:#check"
	
	// Symptoms -> Palpitations -> Ekg
	static let ekgPalpitationsLabel = "#id: ekgPalpitations | #title:EKG During Symptoms | #type:#label"
	static let nsrEkgPalpitations = "#id:chkpalNSR | #title:NSR | #type:#check"
	static let regularEkgPalpitations = "#id:chkpalregRR | #title:Other rhtym,regular RR | #type:#check"
	static let irregularEkgPalpitations = "#id:chkpalirregRR | #title:Other rhtym,irregular RR | #type:#check"
	
	// Symptoms -> Palpitations -> Onset, trigger
	static let onsetPalpitationsLabel = "#id: onsetPalpitations | #title:Onset, Trigger | #type:#label"
	static let suddenOnsetPalpitations = "#id:chkpalsudden | #title:Sudden onset | #type:#check"
	static let positionOnsetPalpitations = "#id:chkpalposition | #title:Position change | #type:#check"
	static let exertionOnsetPalpitations = "#id:chkpalexertion | #title:Exertional | #type:#check"
	static let postexertionOnsetPalpitations = "#id:chkpalpostexertion | #title:Post exertion| #type:#check"
	
	// Symptoms ->Abdominal Pain -> Quality
	static let qualityAbdominalPainLabel = "#type:#label | #title: Quality | #id: qualityAbdominalPain"
	static let sharpQualityAbdominalPain = "#id:chkAbsharp | #title:Sharp | #type:#check"
	static let colickyQualityAbdominalPain = "#id:chkAbcolic | #title:Colicky | #type:#check"
	static let achingQualityAbdominalPain = "#id:chkAbaching | #title:Aching or spasm | #type:#check"
	
	// Symptoms ->Abdominal Pain -> Location
	static let locationAbdominalPainLabel = "#type:#label | #title: Location | #id: locationAbdominalPain"
	static let epigastricFindAbdominalPain = "#id:chkepigastric | #title:Epigastric | #type:#check"
	static let periumbilicalLocationAbdominalPain = "#id:chkperiumbilical | #title:Periumbilical | #type:#check"
	static let suprapubicEdemaLocationAbdominalPain = "#id:chksuprapubic | #title:Supra pubic | #type:#check"
	static let refferedAbdominalPain = "#id:chkAbspasm | #title:Referred shoulder pain | #type:#check"
	
	// Symptoms ->Abdominal Pain -> Associated Findings
	static let associatedFindingsAbdominalPainLabel = "#type:#label | #title: Associated Findings | #id: associatedFindingsAbdominalPainL"
	static let abdominalFindings = "#id:chkdistention | #title:Abdominal distention | #type:#check"
	static let reboundFindings = "#id:chkrebound | #title:Rebound tenderness | #type:#check"
	static let pulsatileFindings = "#id:chkpulsatile | #title:Pulsatile mass | #type:#check"
	static let bowelFindings = "#id:chkbowelsounds | #title:Abnormal bowel sounds | #type:#check"
	static let psoasFindings = "#id:chkpsaos | #title:Psoas sign | #type:#check"
	static let mcburneyFindings = "#id:chkMcburney | #title:McBurney | #type:#check"
	static let rovsingsignFindings = "#id:chkRovsing | #title:Rovsing sign | #type:#check"
	static let murphysignFindings = "#id:chkMurphy | #title:Murphy sign | #type:#check"
	static let obturatorFindings = "#id:chkobturator | #title:Obturator sign  | #type:#check"
	static let carnettsignFindings = "#id:chkcarnett | #title:Carnett sign | #type:#check"
	static let costovertebralFindings = "#id:chkcostovertebral | #title:Costovertebral tenderness | #type:#check"
	static let skinfindingsFindings = "#id:chkskin | #title:Skin findings | #type:#disclosureControl"
	
	// Symptoms ->Abdominal Pain -> Associated Findings -> Skin findings
	static let wallSkinFindings = "#id:chkechymosis | #title:Abdominal wall echymosis | #type:#check"
	static let herpesSkinFindings = "#id:chkherpes | #title:Herpes | #type:#check"
	static let rashSkinFindings = "#id:chkhenoch | #title:Rash | #type:#check"
	static let celulitisSkinFindings = "#id:chkcelulitis | #title:Celulitis | #type:#check"
	static let jaundiceSkinFindings = "#id:chkicterus | #title:Jaundice | #type:#check"
	static let caoutmedusaSkinFindings = "#id:chkcaput | #title:Caput medusa | #type:#check"
	
	// Symptoms ->Abdominal Pain -> Associated Symptoms
	static let associatedSymptomsAbdominalPainLabel = "#type:#label | #title: Associated Findings | #id: associatedSymptomsAbdominalPain"
	static let vomitingSymptoms = "#id:chkvomiting | #title:Vomiting | #type:#disclosureControlExpandable"
	static let anorexiaSymptoms = "#id:chkanorexia | #title:Anorexia | #type:#check"
	static let bowelHabitSymptoms = "#id:chkbowel | #title:Change in bowel habit | #type:#check"
	static let operativeSymptoms = "#id:chkpostoperative | #title:Post operative | #type:#check"
	static let familyhistorySymptoms = "#id:chkfamilyhistoryAA | #title:Family history of AAA | #type:#check"
	static let hematuriaSymptoms = "#id:chkhematuria | #title:Hematuria | #type:#check"
	static let urinarySymptoms = "#id:chkurinary | #title:Change in urinary habit | #type:#check"
	static let obgynSymptoms = "#id:chkobgyn | #title:Ob&gyn history | #type:#check"
	
	// Symptoms ->Abdominal Pain -> Associated Symptoms -> Vomit
	static let vomitingVomitSymptoms = "#id:chkvomitfirst | #title:Vomiting precedes abdominal pain | #type:#check"
	static let abdominalVomitSymptoms = "#id:chkpainfirst | #title:Abdominal pain precedes vomiting | #type:#check"
	
	// Section Shock
	static let hypovolemiaSectionShock = "#id:chkhypovolemia | #title:Hypovolemia | #type:#check"
	static let infectiousSectionShock = "#id:chkinfectious | #title:Infectious | #type:#check"
	static let spinalcordSectionShock = "#id:chkspinalcord | #title:Spinal cord | #type:#check"
	static let allergenSectionShock = "#id:chkallergen | #title:Allergen exposure | #type:#check"
	static let pharmacologicSectionShock = "#id:chkpharmacologic | #title:Pharmacological | #type:#check"
	
	
	//
	// MARK: - Review of System
	//
	static let weightChangeInROS = "#id:chkweightchange | #title:Weight Gain | #type:#check"
	static let thyrotoxicosisInROS = "#id:chkThyro | #title:Thyrotoxicosis | #type:#check"
	static let hypothyroidismInROS = "#id:chkHypoThyro | #title:Hypothyroidism | #type:#check"
	static let osaSymptomsInROS = "#id:chkOSA | #title:OSA Symptoms | #type:#check"
	static let sinusSymptomsInROS = "#id:Chksinus | #title:Sinusitis | #type:#check"
	static let coughSymptomsInROS = "#id:Chkcough | #title:Cough | #type:#check"
	static let sputumSymptomsInROS = "#id:Chksputum | #title:Sputum | #type:#check"
	static let blnhemoptysis = "#id:chkhemoptysis | #title:Hemoptysis | #type:#check"
	static let previousDVTPEInROS = "#id:chkPVTE | #title:Previous pulmonary embolism | #type:#check"
	static let pndInROS = "id:chkPND| #title: Paroxysmal nocturnal dyspnea| #type:#check"
	static let orthopneaInROS = "id:chkorthopnea| #title: Orthopnea| #type:#check"
	static let palpitationsInROS = "#id:chkpalpitations | #title:Palpitations | #type:#check"
	static let activePepticUlcerDiseaseInROS = "#id:chkPUD | #title:Active Peptic Ulcer Disease | #type:#check"
	static let liverDiseaseInROS = "#id:chkliver | #title:Liver Disease | #type:#check"
	static let bleedInThePast3MonthsInROS = "#id:chkbleed | #title:Bleed in the Past 3 Months | #type:#check"
	static let tiaInROS = "#id:chkTIA| #title:TIA | #type:#check"
	static let claudicationInROS = "#id:chkclaudication| #title:Claudication | #type:#check"
	static let ulcerInROS = "#id:chkulcer | #title:Lower Extremity Ulceration | #type:#check"
	static let blnunilateral = "#id:chkunilateral | #title:Unilateral Lower Limb Pain | #type:#check"
	static let previousDVTEInROS = "id:chkDVTE| #title: Previous DVT| #type:#check"
	static let rheumInROS = "#id:chkrheum | #title:Rheumatic Disease | #type:#check"
	
	
	//
	// MARK: - Physical Exam https://zpl.io/29sOGH
	//
	static let neckveins = "#id:chkhepato | #title:Neck veins not assesable | #type:#check"
	static let jugularVenousDistentionInPhysicalExam = "#id:chkJVD | #title:Jugular Venous Distention | #type:#check"
	static let bruitInPhysicalExam = "id:chkbruit| #title:Carotid bruit| #type:#check"
	static let displacedPMIInPhysicalExam = "#id:chkPMI | #title:Displaced PMI | #type:#check"
	static let leftSidedS3S4Gallop = "#id:chkS3 | #title:Left Sided S3 Gallop | #type:#check"
	static let leftSidedS4Gallop = "#id:chkS4 | #title:Left Sided S4 Gallop | #type:#check"
	static let frictionRubInPhysicalExam = "#id:chkrub | #title:Friction Rub| #type:#check"
	static let distantInPhysicalExam = "#id:chkdistant | #title:Distant Heart Sounds| #type:#check"
	
	static let newRalesInPhysicalExam = "#id:chkMR | #title:New Rales | #type:#check"
	static let pulmonaryEdemaInPhysicalExam = "#id:chkPEd | #title:Pulmonary Edema | #type:#check"
	static let diminishedBreathSoundsInPhysicalExam = "#id:chkbreath | #title:Diminished Breath Sounds | #type:#check"
	static let rhonchiInPhysicalExam = "#id:chkrhonchi | #title:Dry rales, rhonchi | #type:#check"
	static let percussionInPhysicalExam = "#id:chkpercussion| #title:Abnormal resonance to percussion | #type:#check"
	static let thoraxInPhysicalExam = "#id:chkthorax | #title:Increased thorax AP diameter  | #type:#check"
	static let abdominalTendernessInPhysicalExam = "#id:chkabdominal | #title:Abdominal Tenderness | #type:#check"
	static let hepatojulularRefluxInPhysicalExam = "#id:chkHJR | #title:Hepatojulular Reflux | #type:#check"
	static let ascitesInPhysicalExam = "#id:chkascites | #title:Ascites | #type:#check"
	static let anyCNSSymptomsInPhysicalExam = "#id:chkAMS | #title:Any CNS Symptoms | #type:#check"
	
	static let coldClammyExtremitiesInPhysicalExam = "#id:chkshock | #title:Cold Clammy Extremities | #type:#check"
	static let clubbingInPhysicalExam = "#id:chkskinwarm | #title:Clubbing | #type:#check"
	static let edemaInPhysicalExam = "#id:chkedema | #title:Edema | #type:#check"
	static let differenceinSBPInPhysicalExam = "#id:txtDiffInSBP | #title:Difference in SBP | #type:#integerRight | #min:0 | #max:50 | #placeholder: Value"
	
	// Physical Exam -> Heart Murmur https://zpl.io/SNRzD
	static let heartMurmurInPhysicalExam = "#id:chkHeartMurmur | #title:Heart Murmur | #type:#disclosureControl"
	static let abnormalAuscultationLabel = "#id:abnormalAuscultationLabel | #title:Focus on the most abnormal auscultation foci | #type:#label | #height: 70"
	
	// Physical Exam -> Heart Murmur -> S1 Mitral https://zpl.io/1Fzz76
	static let s1Mitral = "#id:chkS1Mitral | #title:S1 Mitral | #type:#disclosureControl"
	static let blnS1MitralLoud = "#id:chkS1MitralLoud | #title:Loud | #type:#radio | #group: (blnS1MitralLoud, blnS1MitralNormal, blnS1MitralSoft)"
	static let blnS1MitralNormal = "#id:chkS1MitralNormal | #title:Normal | #type:#radio| #group: (blnS1MitralLoud, blnS1MitralNormal, blnS1MitralSoft)"
	static let blnS1MitralSoft = "#id:chkS1MitralSoft | #title:Soft | #type:#radio| #group: (blnS1MitralLoud, blnS1MitralNormal, blnS1MitralSoft)"
	
	// Physical Exam -> Heart Murmur -> S2 Aortic https://zpl.io/2uy66u
	static let s2Aortic = "#id:chkS2Aortic | #title:S2 Aortic | #type:#disclosureControl"
	static let blnS2AorticLoud = "#id:chkS2MitralLoud | #title:Loud | #type:#radio | #group: (blnS2AorticLoud, blnS2AorticNormal, blnS2AorticSoft)"
	static let blnS2AorticNormal = "#id:chkS2MitralNormal | #title:Normal | #type:#radio| #group: (blnS2AorticLoud, blnS2AorticNormal, blnS2AorticSoft)"
	static let blnS2AorticSoft = "#id:chkS2MitralSoft | #title:Soft | #type:#radio| #group: (blnS2AorticLoud, blnS2AorticNormal, blnS2AorticSoft)"
	
	// Physical Exam -> Heart Murmur -> P2 Pulmonic https://zpl.io/2vXwsT
	static let p2Pulmonic = "#id:chkP2Pulmonic | #title:P2 Pulmonic | #type:#disclosureControl"
	static let blnP2PulmonicLoud = "#id:chkP2PulmonicLoud | #title:Loud | #type:#radio | #group: (blnP2PulmonicLoud, blnP2PulmonicNormal, blnP2PulmonicSoft)"
	static let blnP2PulmonicNormal = "#id:chkP2PulmonicNormal | #title:Normal | #type:#radio| #group: (blnP2PulmonicLoud, blnP2PulmonicNormal, blnP2PulmonicSoft)"
	static let blnP2PulmonicSoft = "#id:chkP2PulmonicSoft | #title:Soft | #type:#radio| #group: (blnP2PulmonicLoud, blnP2PulmonicNormal, blnP2PulmonicSoft)"
	
	// Physical Exam -> Heart Murmur -> S1 Tricuspid
	static let s1Tricuspid = "#id:chkS1Tricuspid | #title:S1 Tricuspid | #type:#disclosureControl"
	static let blnP2TricuspidLoud = "#id:chkS1TricuspidLoud | #title:Loud | #type:#radio | #group: (blnP2TricuspidLoud, blnP2TricuspidNormal, blnP2TricuspidSoft)"
	static let blnP2TricuspidNormal = "#id:chkT1TricuspidNormal | #title:Normal | #type:#radio| #group: (blnP2TricuspidLoud, blnP2TricuspidNormal, blnP2TricuspidSoft)"
	static let blnP2TricuspidSoft = "#id:chkT1TricuspidSoft | #title:Soft | #type:#radio| #group: (blnP2TricuspidLoud, blnP2TricuspidNormal, blnP2TricuspidSoft)"
	
	// Physical Exam -> Heart Murmur -> Murmur -> Systolic Murmur https://zpl.io/Z12Jxq3
	static let murmur = "#id:murmur | #title:Murmur | #type:#disclosureSimple"
	static let systolicMurmur = "#id:chkSystolicMurmur | #title:Systolic Murmur | #type:#disclosureControl"
	static let blnCresDecres = "#id:chkCresDecres | #title:Crescendo-Decrescendo | #type:#disclosureControlExpandable"
	static let blnEarlyMidSysPeak = "#id:chkEarlyMidPeak | #title:Early-Mid Systolic Peaking | #type:#check"
	static let blnLateSysPeak = "#id:chkLatePeak | #title:Late Systolic Peaking | #type:#check"
	
	static let blnPlateuShaped = "#id:chkPlateuShaped | #title:Plateau Shaped | #type:#disclosureControlExpandable"
	static let blnHalosystolic = "#id:chkHalosystolic | #title:Halosystolic | #type:#check"
	static let blnPansystolic = "#id:chkPansystolic | #title:Pansystolic | #type:#check"
	static let blnMidsystolic = "#id:chkMidsystolic | #title:Midsystolic | #type:#check"
	
	static let blnsquat = "#id:chksquat | #title:Softer with Squat | #type:#check"
	static let blnejectionsound = "#id:chkejectionsound | #title:Ejection sound | #type:#check"
	static let blnsystolicclick = "#id:chksystolicclick | #title:Systolic click | #type:#check"
	
	// Physical Exam -> Heart Murmur -> Murmur -> Diastolic Murmur https://zpl.io/Z1WW9hI
	static let diastolicMurmur = "#id:chkDiastolicMurmur | #title:Diastolic Murmur | #type:#disclosureControlExpandable"
	static let blnDescrescendo = "#id:chkDescrescendo | #title:Decrescendo | #type:#check"
	static let blnRumble = "#id:chkRumble | #title:Rumble | #type:#check"
	static let mitralOpeningSnap = "#id:chkMitralOpeningSnap | #title:Mitral Opening Snap | #type:#check"
	
	// Physical Exam -> Sectioncyanosis	
	static let cyanosisInPhysicalExam = "#id:chkCyanosis | #title:Cyanosis | #type:#disclosureControl"
	static let centralSectioncyanosis = "#id:chkcentral | #title:Central Cyanosis | #type:#check"
	static let peripheralSectioncyanosis = "#id:chkperipheral | #title:Peripheral Cyanosis | #type:#check"	
	
	
	//
	// MARK: - CurrentPast CV Profile https://zpl.io/Z1WoemX
	//
	static let coronaryHeartDisease = "#id:coronaryHeartDisease | #title:Coronary Heart Disease | #type:#disclosureWeather"
	static let heartFailure = "#id:heartFailure | #title:Heart Failure | #type:#disclosureWeather"
	static let atrialFibrillation = "#id:atrialFibrillation | #title:Atrial Fibrillation | #type:#disclosureWeather"
	static let thromboembolicVKA = "#id:thromboembolicVKA | #title:Thromboembolic/VKA | #type:#disclosureWeather"
	static let ventricularTachyarrthymias = "#id:ventricularTachyarrthymias | #title:Ventricular Tachyarrthymias | #type:#disclosureWeather"
	static let bradyarrthymiaSyncope = "#id:bradyarrthymiaSyncope | #title:Bradyarrthymia/Syncope | #type:#disclosureWeather"
	static let valvularHeartDisease = "#id:chkvalvular | #title:Valvular Heart Disease | #type:#disclosureWeather | #alert: Refer to Heart Failure Specialist for Management"
	static let pulmonaryHypertension = "#id:pulmonaryHypertension | #title:Pulmonary Hypertension | #type:#disclosureWeather | #alert: Refer to Heart Failure Specialist for Management"
	static let vascularDisease = "#id:vascularDiseases | #title:Vascular Disease | #type:#disclosureWeather"
	
	//	CurrentPast CV Profile -> Coronary Heart Disease https://zpl.io/2weUnk
	static let acuteCoronarySyndrome = "#id:chkACS | #title:Acute Coronary Syndrome | #type:#disclosureControl"
	static let pcicabg = "#id:chkPCI | #title:PCI/CABG | #type:#disclosureControl"
	static let stableAng = "#id:chkSTENUSIS | #title:STABLE ANG | #type:#disclosureControl"
	static let lm = "#id:chkLM | #title:LM | #type:#check"
	static let lad = "#id:chkLAD | #title:LAD | #type:#check"
	static let rca = "#id:chkRCA | #title:RCA | #type:#check"
	static let lcx = "#id:chkLCX | #title:LCX | #type:#check"
	static let icd10 = "#id:chkICD-10 | #title:ICD-10 | #type:#disclosureControl"
	static let vesselmore50 = "#id:txtNumVessel | #title:# Vessel > 50% | #type:#integerRight | #min:1 | #max:3 | #placeholder: Value"
	static let lvefInCHD = "#id:TxtHF | #title:LVEF | #type:#integerRight | #min:10 | #max:80 | #placeholder: Value"
	
	//	CurrentPast CV Profile -> Coronary Heart Disease -> Acute Coronary Syndrome https://zpl.io/1i9sVD
	static let moreAnginaIn24Hours = "#id:chkang24 | #title:≥ 2 Angina/24hr | #type:#check"
	static let anginaMore20min = "#id:chkAn20 | #title:Angina > 20min | #type:#check"
	static let postiveTropIorT = "#id:chkpositivetrop | #title:Postive Trop I or T | #type:#check"
	static let moreTwoAntanginal = "#id:chkAnAn | #title:≥ 2 Antanginal | #type:#check"
	static let stemi = "#id:chkSTEMI | #title:STEMI | #type:#disclosureControl"
	static let refractoryAngina = "#id:chkrefractory | #title:Refractory Angina | #type:#check"
	static let changingTropI = "#id:chkchangetrop | #title:Changing Trop I | #type:#check"
	
	//	CurrentPast CV Profile -> Coronary Heart Disease -> Acute Coronary Syndrome -> STEMI https://zpl.io/Z1Kb0YP
	static let durationhoursSTEMI = "#id:TxtSTEMIdur | #title:Duration/Hours | #type:#integerRight | #min:0 | #max:48 | #placeholder: Value"
	static let anteriorSTEMI = "#id:chkanterior | #title:Anterior | #type:#check"
	static let inferiorSTEMI = "#id:chkinferior | #title:Inferior | #type:#check"
	static let otherSTEMI = "#id:chkother | #title:Other | #type:#check"
	
	//	CurrentPast CV Profile -> Coronary Heart Disease -> PCI/CABG https://zpl.io/MV6Br
	static let lastProcedureYearsAgo = "#id:Txtprocedure | #title:Last Procedure (years ago) | #type:#integerRight | #min:0|  #max:50|  #placeholder: Value"
	static let bms = "#id:chkBMS| #title:BMS | #type:#check"
	static let des = "#id:chkDES | #title:DES | #type:#check"
	static let cabg = "#id:chkCABG | #title:CABG | #type:#disclosureControlExpandable"
	
	//	CurrentPast CV Profile -> Coronary Heart Disease -> PCI/CABG -> CABG https://zpl.io/1H0tEY
	static let autoVein = "#id:chkautovein | #title:Auto Vein | #type:#check"
	static let autoArtery = "#id:chkautoartery | #title:Auto Artery | #type:#check"
	static let nonAuto = "#id:chknonauto | #title:Non Auto | #type:#check"
	
	//	CurrentPast CV Profile -> Coronary Heart Disease -> Stable Ang https://zpl.io/1nIjn5 (Android)
	static let nyhaccvsClass1 = "#id:chkNYHA1 | #title: NYHA/CCVS Class 1 | #type:#check"
	static let nyhaccvsClass2 = "#id:chkNYHA2 | #title: NYHA/CCVS Class 2 | #type:#check"
	static let nyhaccvsClass3 = "#id:chkNYHA3 | #title: NYHA/CCVS Class 3 | #type:#check"
	static let nyhaccvsClass4 = "#id:chkNYHA4 | #title: NYHA/CCVS Class 4 | #type:#check"
	
	//	CurrentPast CV Profile -> Coronary Heart Disease -> ICD-10 https://zpl.io/Z25IASS (Android)
	static let chronicTotalOcclusion = "#id:chkCTO | #title:Chronic Total Occlusion | #type:#check"
	static let coronoaryAneurysm = "#id:chkcoraneurysm | #title:Coronoary Aneurysm | #type:#check"
	static let coronaryDissection = "#id:chkcordissection | #title:Coronary Dissection | #type:#check"
	static let calcifiedCoronaryLesion = "#id:chkcalcified | #title:Calcified Coronary Lesion | #type:#check"
	static let lipidRichPlaque = "#id:chklipidrich| #title:Lipid Rich Plaque | #type:#check"
	static let documentedVasospasm = "#id:chkvasospasm | #title:Documented Vasospasm | #type:#check"
	
	//	CurrentPast CV Profile -> Heart Failure https://zpl.io/Z1oLKLR
	static let hfDiagnosisDurationPerWeekInHF = "#id:txtdur |    #title:HF Diagnosis Duration/Week| #type:#integerRight|   #min:0|  #max:999|  #placeholder: Value"
	static let previousHFHospitalizationInHF = "#id:chkfoutpt |    #title:Previous HF Hospitalization|    #type:#check"
	static let spicdInHF = "#id:chkICD |    #title:Status Post ICD|    #type:#check"
	static let cRTI = "#id:chkCRTI |    #title:Status Post CRTI|    #type:#check"
	static let lvefInHF = "#id:txtCHF | #title:LVEF | #type:#integerRight | #min:10 | #max:80 | #placeholder: Value"
	static let nyhaClass = "#id:nyhaClass|#title:Heart Failure Stage |#type:#disclosureSimple"
	static let idiopathicDCMNonischemic = "#id:chkNonischemicCMP | #title:Idiopathic/DCM/Nonischemic | #type:#check"
	static let ischemicPostMILess45Day = "#id:chkIschemic | #title:Ischemic Post MI < 45 days | #type:#check"
	static let cardiotoxis = "#id:chkCardiotoxins | #title:Cardiotoxins | #type:#check"
	static let familiarCMPSuddenDeath = "#id:chkFamHXofCMP | #title:Familiar CMP Associated with Sudden Death | #type:#check"
	static let myocarditis = "#id:chkmyocarditis | #title:Myocarditis | #type:#check"
	static let rvDysplasia = "#id:chkSuspectedRVDysplasia | #title:RV Dysplasia | #type:#check"
	static let hocm = "#id:chkIschemicCMP| #title:HOCM | #type:#disclosureControl"
	static let peripartumCMP = "#id:chkrestrictive | #title:Peripartum CMP | #type:#check"
	
	//	CurrentPast CV Profile -> Heart Failure -> Heart Failure Stage
	static let atHighRiskOfHF = "#id:chkA|    #title:At High Risk for HF, but without Structural Heart Disease or Symptoms of HF NYHA/CCVS Class 0|    #type:#check"
	static let structuralHeartDeseaseNoSymptoms = "#id:chkB| #title:Structural Heart Disease, but without signs/symptoms of HF|    #type:#check"
	static let structuralHeartDeseaseSymptoms = "#id:chkC| #title:Structural Heart Diseasewith prior or current symptoms of HF|    #type:#check"
	static let refactoryHFInterventions = "#id:chkD | #title:Refactory HF Requiring Specialized Interventions | #type:#disclosureControl"
	
	//	CurrentPast CV Profile -> Heart Failure -> Heart Failure Stage -> Refactory HF Requiring Specialized Interventions https://zpl.io/Z1LXV1U
	static let calculateHFSS = "#id:CalculateHFSS | #title:Calculate HFSS, enter NAmeq, VO₂ max, Heart Rate, and ECG QRS Duration | #type:#label"
	static let noSignificantComorbidities = "#id:chkcom | #title:No Significant Comorbidities |#type:#disclosureWeather | #alert: Refer to Heart Failure Specialist for Management"
	static let vo2maxkg = "#id:TxtVO2 | #title:VO₂ max kg/ | #type:#decimalRight | #min:6 | #max:40 | #placeholder: VO₂ max kg"
	
	//	CurrentPast CV Profile -> Heart Failure -> Post MI>45 Days https://zpl.io/ZcwnUr
	static let postMIMore45Days = "#id:chkMI | #title:Post MI > 45 Days | #type:#disclosureControlExpandable"
	static let lvAneurysm = "#id:chkLVaneurysm | #title:LV Aneurysm | #type:#check"
	
	//	CurrentPast CV Profile -> Heart Failure -> HOCM https://zpl.io/2oywbi
	static let lvh30mm = "#id:chkLVHGreater30| #title:LVH ≥ 30mm | #type:#check"
	static let abnormalBPResponsetoExercise = "#id:chkAbnormBP | #title:Abnormal BP Response to Exercise | #type:#check"
	static let familyHistoryOfSuddenDeath = "#id:chkFamHistSuddenDeath | #title:Family History of Sudden Death | #type:#check"
	static let restDynamicPeakLVOT = "#id:chkLVOT | #title:Rest/Dynamic Peak LVOT Gradient > 50mmHg | #type:#check"
	
	//	CurrentPast CV Profile -> Atrial Fibrillation https://zpl.io/1NE0A3
	static let chronicAF = "#id:chkchronicAF | #title:Chronic AF | #type:#check"
	static let persistentAF = "#id:chkpersistent | #title:Persistent AF | #type:#check"
	static let paroxymalAF = "#id:chkparoxysmal | #title:Paroxymal AF | #type:#check"
	static let spSuccessfulAblation = "#id:chkablation | #title:S/P Successful Ablation | #type:#check"
	
	static let atrialFibrillationLabel = "#id: AtrialFibrillationLabel | #title: Select V/R Control | #type:#label"
	static let rhythmControl = "#id:chkCV | #title:Rhythm Control | #type:#radio | #group: (rhythmControl, ventricularRateControl)"
	static let ventricularRateControl = "#id:chkpharm | #title:Ventricular Rate Control | #type:#radio | #group: (rhythmControl, ventricularRateControl)"
	//static let rhythmControl = "#id:chkCV | #title:Rhythm Control | #type:#radio | #group: (rhythmControl, ventricularRateControl)| #selected: 1"
	//static let ventricularRateControl = "#id:chkPharm | #title:Ventricular Rate Control | #type:#radio | #group: (rhythmControl, ventricularRateControl)| #selected: 2"
	
	static let symptomatic = "#id:chkVHD | #title:Symptomatic | #type:#disclosureControlExpandable"
	static let durationDays = "#id:Txtafd | #title:Duration (Days) | #type:#integerRight | #min:0|  #max:999|  #placeholder: Value"
	
	static let previousTIACVA = "#id:chkPrevious | #title:Previous TIA/CVA | #type:#check"
	static let thyrotoxicosis = "#id:thyrotoxicosis | #title:Thyrotoxicosis | #type:#check"
	
	//	CurrentPast CV Profile -> Atrial Fibrillation -> Rhythm Control  https://zpl.io/42VGk
	static let blnCAA = "#id:chkCAA | #title:Current Antiarrythmic Therapy | #type:#disclosureControl"
	static let blnliver = "#id:chkliver | #title:Liver Disease | #type:#check"
	
	//	CurrentPast CV Profile -> Atrial Fibrillation -> Rhythm Control -> Current Antiarrythmic Therapy https://zpl.io/Z7iXr7
	static let blnclass1AA = "#id:chkclass1AA | #title:Propofonone, Flecanide | #type:#check"
	static let blnclass3AA = "#id:chkclass3AA | #title:Sotalol, Amiodarone, Multaq, Dofetilide | #type:#check"
	
	//	CurrentPast CV Profile -> Atrial Fibrillation -> Ventricular Heart Control https://zpl.io/Z28fdgd
	static let heartRateWithActivity = "#id:txtCMP| #title:Heart Rate with Activity | #type:#check"
	
	//	CurrentPast CV Profile -> Atrial Fibrillation -> Symptomatic https://zpl.io/2tGE7i
	static let acutely = "#id:chkacutely | #title:Acutely | #type:#check"
	
	//	CurrentPast CV Profile -> Atrial Fibrillation -> Previous TIA/CVA
	static let lastthromboembolicevent = "#id:TxtPrevious| #title:Last embolic event/ months ago | #type:#integerRight | #min:0|  #max:199|  #placeholder: Value"
	
	//	CurrentPast CV Profile -> Thromboembolic/VKA
	static let thromboembolicPrevention = "#id:thromboembolicPrevention | #title:Thromboembolic Prevention Thromboembolic Therapy VKA (Warfarin) Therapy Periprocedural Anticoagulation | #type:#disclosureWeather"
	static let valvularHeartDiseaseThromboembolicPreventionandTherapy = "#id:valvularHeartDiseaseThromboembolicPreventionandTherapy | #title:Valvular Heart Disease Thromboembolic Prevention and Therapy | #type:#disclosureWeather"
	static let otherCardiacSourceOfEmbolism = "#id:otherCardiacSourceOfEmbolism | #title:Other Cardiac Source Of Embolism (Non-Atrial Fibrilation) | #type:#disclosureWeather"
	static let miscellaneous = "#id:miscellaneous | #title:Miscellaneous | #type:#disclosureWeather"
	
	//	CurrentPast CV Profile -> Thromboembolic/VKA -> Thromboembolic Prevention https://zpl.io/Z1NEKoE
	static let inr = "#id:txtINR | #title:INR | #type:#decimalRight | #min:0.5 | #max:100.0 | #placeholder: INR"
	static let bleedingRisk = "#id:chkbldrisk | #title:Patient related Bleeding Risk | #type:#disclosureControl"
	static let proceduralBleedingRisk = "#id:chkprocedural_bleed_risk| #title: Procedure related Bleeding Risk| #type:#disclosureControl "
	static let deepVenousThrombosis = "#id:chkDeepVenousThrombosis | #title:Deep Venous Thrombosis | #type:#check"
	static let pulmonaryEmbolism = "#id:chkPE | #title:Pulmonary Embolism | #type:#check"
	static let dvtpeDiagnosisPrevention = "#id:chkDVTprevention | #title:DVT/PE Diagnosis/Prevention | #type:#disclosureControl"
	static let acuteCVA = "#id:chkacutecva | #title:Acute CVA | #type:#disclosureControl"
	
	// CurrentPast CV Profile -> Thromboembolic/VKA -> Thromboembolic Prevention -> Bleeding Risk https://zpl.io/ZwpYcp
	static let activeGastroduodenalUlcer = "#id:chkPUD | #title:Active Gastroduodenal Ulcer | #type:#check"
	static let bleedIn3MoBeforeAdmission = "#id:chkbleed | #title:Bleed in 3 mo before admission | #type:#check"
	static let plateletCountLess50x190L = "#id:chkplt | #title:Platelet Count < 50 x 190/L | #type:#check"
	static let icuOrCCUAdmission = "#id:chkICU | #title:ICU or CCU Admission | #type:#check"
	static let centralVenousCatheter = "#id:chkCVC | #title:Central Venous Catheter | #type:#check"
	static let rheumaticDisease = "#id:chkrheum | #title:Rheumatic Disease | #type:#check"
	
	// CurrentPast CV Profile -> Thromboembolic/VKA -> Thromboembolic Prevention -> Procedural Bleeding Risk
	static let priorBleedDuringBridgingSimilar = "#id:chkprior | #title: Prior Bleed During Bridging/Similar | #type:#check"
	static let priorASAUse = "#id:chkpriorASA| #title: Prior ASA Use| #type:#check"
	static let riskClinicallyNotImportant = "#id: chkminorpro| #title: Risk Clinically Not Important| #type:#check"
	static let riskUncertain = "#id:chksurgery| #title: Risk Uncertain| #type:#check"
	static let riskIntermediateHigh = "#id:chkemergencysurgery| #title: Risk Intermediate/High |#type:#check"
	
	// CurrentPast CV Profile -> Thromboembolic/VKA -> Thromboembolic Prevention -> DVT/PE Diagnosis/Prevention https://zpl.io/2ryLo7
	static let blngeneral = "#id:chkgeneral | #title:Major Surgery/Trauma | #type:#check"
	static let blnurology = "#id:chkurology | #title:Major Gyn/Urology | #type:#check"
	static let blnknee = "#id:chkknee | #title:TKR | #type:#check"
	static let blnhip = "#id:chkhip | #title:THR | #type:#check"
	static let blnHPS = "#id:chkHPS | #title:Hip Fracture | #type:#check"
	static let blncancer = "#id:chkcancer | #title:Spine Surgery | #type:#check"
	static let blnspinal = "#id:chkspinal | #title:Spinal Cord Injury | #type:#check"
	static let blnacute = "#id:chkacute | #title:Medical Illness | #type:#disclosureControl"
	
	// CurrentPast CV Profile -> Thromboembolic/VKA -> Thromboembolic Prevention -> DVT/PE Diagnosis/Prevention -> Medical Illness
	static let blnswelling = "#id:chkswelling | #title:Painful Deep Venous Palpation and Edema | #type:#check"
	static let blnactivecancer = "#id:chkactivecancer | #title:Active Cancer | #type:#check"
	static let blnPVTE = "#id:chkPVTE | #title:Previous VTE | #type:#check"
	static let blnRF = "#id:chkRF | #title:Respiratory Failure | #type:#check"
	static let blnthrombo = "#id:chkthrombo | #title:Already Known Thrombophilic Condition | #type:#check"
	static let blnrecent = "#id:chkRecent | #title:Recent (≤ 1mo) Trauma and/or Surgery | #type:#check"
	static let blnreduced = "#id:chkReduced | #title:Reduced Mobility, Anticipated ≥ 3 days | #type:#check"
	static let blnhormone = "#id:chkhormone | #title:Ongoing Hormonal Treatment | #type:#check"
	static let blninfection = "#id:chkinfection | #title:Acute Infection and/or Rheumatologic Disorder | #type:#check"
	
	// CurrentPast CV Profile -> Thromboembolic/VKA -> Thromboembolic Prevention -> Acute CVA https://zpl.io/2nDyiB (Android)
	static let nihss = "#id:txtNIHSS | #title:NIHSS | #type:#integerRight | #min:0 | #max:42 | #placeholder: Value"
	static let unilateralWeakness = "#id:chkunilateral_weakness | #title:Unilateral Weakness | #type:#check"
	static let speechDisturbance = "#id:chkspeech_disturbance | #title:Speech Disturbance | #type:#check"
	static let durationOfSymptoms = "#id:ssdur | #title:Duration of Symptoms | #type:#integerRight | #min:0 | #max:24 | #placeholder: Value"
	static let preHospitalCare = "#id:chkpreh | #title:Pre Hospital Care | #type:#check"

	//	CurrentPast CV Profile -> Thromboembolic/VKA -> Valvular Heart Disease
	static let blncage  = "#id:chkcage | #title:Mechanical Cageball | #type:#check"
	static let blnmech = "#id:chkmech | #title:Mechanical Disk/Bileaflet Mitral | #type:#check"
	static let blnMdav = "#id:chkMdav | #title:Mechanical Disk/Bileaflet Aortic | #type:#check"
	static let blnRMVD = "#id:chkRMVD | #title:Rheumatic Mitral Valve Disease | #type:#disclosureControl"
	static let blnbiop = "#id:chkbiop | #title:Bioprosthetic Valve | #type:#check"
	static let blnsysemb = "#id:chksysemb | #title:Systematic Embolism | #type:#check | #selected: 1"
	static let blnIE = "#id:chkIE | #title:Infective Endocarditis | #type:#check"
	static let blnLPVT = "#id:chkLPVT | #title:Left Sided PV Thrombosis | #type:#check"
	static let blnRPVT = "#id:chkRPVT | #title:Right Sided PV Thrombosis | #type:#check"
	
	//	CurrentPast CV Profile -> Thromboembolic/VKA -> Valvular Heart Disease -> RMVD
	static let blnLAthr = "#id:chkLAthr | #title:LA Thrombus | #type:#check"
	static let txtLAd = "#id:txtLAd | #title:LA Diameter | #type:#integerRight | #min:2 | #max:7 | #placeholder: Value"
	
	//	CurrentPast CV Profile -> Thromboembolic/VKA -> Other Cardiac Source of Embolism
	static let blnArterialIschemic = "#id:chkArterialIschemic | #title:Non Acute Arterial Ischemic Stroke | #type:#check | #selected: 1"
	static let blnAorticArchAth = "#id:chkAorticArchAth | #title:Aortic Arch Atherosclerosis | #type:#check"
	static let blnLVt = "#id:chkLVt | #title:LV Thrombus | #type:#check"
	static let blnPFO = "#id:chkPFO | #title:PFO | #type:#check"
	static let blnMVP = "#id:chkMVP | #title:MVP | #type:#check"
	static let blnMitralAnnular = "#id:chkMitralAnnular | #title:Mitral Annular Valcification | #type:#check"
	static let blnCalcificAortic = "#id:chkCalcificAortic | #title:Calcific Aortic Valve Disease | #type:#check"
	
	//	CurrentPast CV Profile -> Thromboembolic/VKA -> Miscellaneous
	static let hit = "#id:chkHeparinIndThrom| #title:HIT | #type:#check"
	static let cerebralVenousThrombosis = "#id:chkCerebralVenous| #title:Cerebral Venous Thrombosis | #type:#check"
	static let hypercoagulableState = "#id:chkApoA1 | #title:Hypercoagulable State | #type:#check"
	
	// CurrentPast CV Profile -> Ventricular Tachyarrthymias https://zpl.io/Lgyc4
	static let nsvt = "#id:chkNSVT | #title:NSVT | #type:#check"
	static let monomorphicVT = "#id:chkMVT | #title:Monomorphic VT | #type:#check"
	static let repetitiveMonomorphicVT = "#id:chkRMVT | #title:Repetetive Monomorphic VT | #type:#check"
	static let polymorphicVT = "#id:chkPVT | #title:Polymorphic VT | #type:#check"
	static let torsades = "#id:chkTors | #title:Torsades | #type:#check"
	static let incessantVT = "#id:chkIVT | #title:Incessant VT | #type:#check"
	static let idiopathicVT = "#id:chkidioVT | #title:Idiopathic VT | #type:#check"
	
	// CurrentPast CV Profile -> Bradyarrthymia
	static let symptomaticSinusNodeDysfunction = "#id:chkSinusNodeDysfunction | #title:Symptomatic Sinus Node Dysfunction | #type:#check"
	static let highGradeAVNodeDisease = "#id:chkAVNodeDisease | #title:High Grade AV Node Disease | #type:#check"
	static let isolatedNeurocardionegicUnexplainedSyncope = "#id:chkVasoDepressorSyncope | #title:Isolated Neurocardionegic / Unexplained Syncope | #type:#check"
	static let carotidSinusHypersensitivity = "#id:chkCarotidSinusHypersensitivity | #title:Carotid Sinus Hypersensitivity | #type:#check"
	static let pots = "#id:chkPosturalOrthostatisTac | #title:POTS (Enter Standing Heart Rate) | #type:#check"
	static let autonomicFailureSyndrome = "#id:chkAutonomicFailureSyndrome | #title:Autonomic Failure Syndrome | #type:#check"
	static let historyOfCardiacArrest = "#id:chkHistCardArrest | #title:History of Cardiac Arrest | #type:#check"
	static let brugadaSyndrome = "#id:chkBrugada | #title:Brugada Syndrome | #type:#check"
	static let longQT = "#id:chkLongQT | #title:LongQT | #type:#check"
	static let sarcoidosisGiantCellChagas = "#id:chksarc | #title:Sarcoidosis / Giant Cell / Chagas | #type:#check"
	
	// CurrentPast CV Profile -> Valvular Heart Disease	
	static let newonsetAF = "#id:chknewonsetAF | #title:New Onset Atrial Fibrilation | #type:#check"
	static let aorticStenosis = "#id:chkAorticStenosis | #title:Aortic Stenosis | #type:#check"
	static let secvalvular = "#id:secvalvular | #title:Valvular | #type:#check"
	static let calcAortValve = "#id:chkCalcAortValve | #title:Calcified Aortic Valve Reduced Systolic Opening / Giant Cell / Chagas | #type:#check"
	static let reumaticAV = "#id:chkreumaticAV | #title:RHeumatic AV | #type:#check"
	static let congenStenAortValve = "#id:chkCongenStenAortValve | #title:Congenitally Stenotic Aortic Valve | #type:#check"
	static let calcAortValveArea = "#id:txtCalcAortValveArea | #title:Calculated Aortic Valve Area | #type:#check"
	static let aortMeanPressGradient = "#id:txtAortMeanPressGradient | #title:Aortic Mean Pressure Gradient | #type:#check"
	static let aortValveVel = "#id:txtAortValveVel | #title:Aortic Valve Velocity | #type:#check"
	static let strokeVolIndex = "#id:txtStrokeVolIndex | #title:Stroke Volume Index | #type:#check"
	static let indexedValveArea = "#id:txtIndexedValveArea | #title:Indexed Valve Area | #type:#check"
	static let aortRootDiameter = "#id:txtAortRootDiameter | #title:Biscuspid Aortic Root Diameter | #type:#check"
	
	static let mitralStenosis = "#id:chkMitralStenosis | #title:Mitral Stenosis | #type:#check"
	static let mVA  = "#id:txtMVA | #title:MVA | #type:#check"
	static let pHT = "#id:txtPHT | #title:PHT| #type:#check"
	static let rheumaticMV = "#id:chkrheumaticMV | #title:Rheumatic | #type:#check"
	static let favValveMorph = "#id:chkFavValveMorph | #title:Favorable Valve Morphology | #type:#check"	
	
	static let lAClot = "#id:chkLAClot | #title:La Clot | #type:#check"
	static let pulmonicStenosis = "#id:chkPulmonicStenosis | #title:Pulmonic Stenosis | #type:#check"
	static let tricuspidStenosis = "#id:chkTricuspidStenosis | #title:Tricuspid Stenosis | #type:#check"
	static let pulValveVel = "#id:txtPulValveVel | #title:Pulmonic Valve Velocity | #type:#check"
	static let aorticRegurgitation = "#id:chkAorticRegurgitation | #title:Aortic Regurgitation | #type:#check"
	static let holodiastolicRev = "#id:chkHolodiastolicRev | #title:Holodiasrolic Flow Reversal | #type:#check"
	static let venaContractaWidth2 = "#id:txtVenaContractaWidth2 | #title:Vena Contracta Width | #type:#check"
	static let venaContractaWidth = "#id:txtVenaContractaWidth | #title:Vena Contracta Width Tri | #type:#check"
	static let regurVolume = "#id:txtRegurVolume | #title:Regurgitation Volume | #type:#check"
	static let regurFrac = "#id:txtRegurFrac | #title:Regurgitation Fraction | #type:#check"
	static let eRO = "#id:txtERO | #title:ERO | #type:#check"
	static let lVESd = "#id:txtLVESd | #title:LVESd  | #type:#check"
	static let lVEDd = "#id:txtLVEDd | #title:LVEDd  | #type:#check"
	
	static let aorticRootDiameter = "#id:txtAorticRootDiameter | #title:Aortic Root Diameter | #type:#check"
	static let mitralRegurgitation = "#id:chkMitralRegurgitation | #title:Primary Mitrl Regurgitation | #type:#check"
	static let tricuspidRegurgitation = "#id:chkTricuspidRegurgitation | #title:Tricuspid Regurgitation | #type:#check"
	static let annularDiameter = "#id:txtAnnularDiameter | #title:Annular Diameter | #type:#check"
	static let centralJetArea = "#id:txtCentralJetArea | #title:Central Jet Area | #type:#check"
	static let hepaticVeinFlowRev = "#id:chkHepaticVeinFlowRev | #title:Hepatic Vein Flow Reversal | #type:#check"
	static let abTVleaflet = "#id:chkabTVleaflet | #title:Abornormal TV Leaflets ABNORMAL_TV_LEAFLETS  | #type:#check"
	static let pulmonicRegurgitation = "#id:chkPulmonicRegurgitation | #title:Pulmonic Regurgiation | #type:#check"
	static let wideRegurJet = "#id:chkWideRegurJet | #title:Wide Regurfitant Jet | #type:#check"
	static let abnpulval = "#id:chkabnpulval | #title:Abnormal Pulmonic Valve Leaflets | #type:#check"
	static let valvular_surgery_risk = "#id:secvalvular_surgery_risk | #title:Valvular Surgery Risk | #type:#check"
	
	static let vavularRiskLabel = "#type:#label | #title: Risk Level | #id: checkLVHOnEKGIfApplicable"
	static let lowrisk = "#id:chklowrisk| #title:Low | #type:#check"
	static let intermediaterisk = "#id:chkintermediaterisk | #title:Intermediate| #type:#check"
	static let highrisk = "#id:chkhighrisk | #title:High | #type:#check"
	static let prohibitive = "#id:chkprohibitive | #title:Prohibitive  | #type:#check"
	static let other_surgical_risk = "#id:secother_surgical_risk | #title:Other Surgical Risk | #type:#check"
	
	static let vascular = "#id:chkvascular | #title:High Risk Supra Inguinal Vascular Surgery | #type:#check"
	static let lowriskelec = "#id:chklowriskelec| #title:Low Risk Cataract Plastic | #type:#check"
	static let cardiac = "#id:chkcardiac | #title:Other Cardiac | #type:#check"
	
	// CurrentPast CV Profile -> Vascular Disease https://zpl.io/Z1M98ld
	static let symptomaticCarotidDisease = "#id:symptomaticCarotidDisease | #title:Symptomatic Carotid Disease | #type:#disclosureWeather"
	static let periphericVascularDisease = "#id:periphericVascularDisease | #title:Peripheric Vascular Disease | #type:#disclosureWeather"
	static let abdomialAoritcAneurysm = "#id:abdomialAoritcAneurysm | #title:Abdomial Aoritc Aneurysm | #type:#disclosureWeather"
	
	// CurrentPast CV Profile -> Vascular Disease -> Symptomatic Carotid Disease https://zpl.io/ZB3jN
	static let noncardioembolicVCATIAAssoicaedWithCarotidPlaque = "#id:chkNoncardioCVA | #title:Noncardioembolic VCA/TIA Assoicaed with Carotid Plaque | #type:#check"
	static let noncardioembolicTIAAssoicaedWithCarotidPlaque = "#id:chkNoncardioTIA |#title:Noncardioembolic TIA Assoicaed with Carotid Plaque | #type:#check"
	static let more50CarotidStenosisSPCEA = "#id:chkCEA| #title:≥ 50% Carotid Stenosis/ S/P CEA | #type:#check"
	
	// CurrentPast CV Profile -> Vascular Disease -> Peripheric Vascular Disease https://zpl.io/Z1UUorp (Android)
	static let abiLess09 = "#id:chkABI | #title:ABI < 0.9 | #type:#check"
	static let claudication = "#id:chkclaudication | #title:Claudication | #type:#check"
	static let criticalLimbIschemia = "#id:chkcritical | #title:Critical Limb Ischemia | #type:#check"
	static let endovascularRevascularization = "#id:chkbypass | #title:Endovascular Revascularization | #type:#check"
	static let peripheralArteryBypassGraft = "#id:chkBKbypass | #title:Peripheral Artery Bypass Graft | #type:#check"
	
	// CurrentPast CV Profile -> Vascular Disease -> Abdomial Aoritc Aneurysm https://zpl.io/Z2mwqrj
	static let aaDiameteMore5cm = "#id:chkAADiameter| #title:AA Diameter > 5cm | #type:#check"
	static let thoracic = "#id:chkthoracic| #title:Thoracic aortic aneurysm | #type:#check"
	static let thoracoabdominal = "#id:chkthoracoabdominal| #title:Thoracoabdominal aortic aneurysm | #type:#check"
	
	
	//
	// MARK: - Pulmonary
	//
	static let fev1_lt = "#id:txtFEV1| #title:FEV1 lt/min | #type:#decimalRight | #min:0.5 | #max:8.0 | #placeholder: FEV1 1t/min"
	static let fev1_percent = "#id:txtFEVP| #title:% FEV1 | #type:#decimalRight | #min:25.0 | #max:120.0 | #placeholder: % FEV1"
	static let fvc = "#id:txtFVCP| #title:% FVC | #type:#decimalRight | #min:0.0 | #max:120.0 | #placeholder: % FVC"
	static let dlco = "#id:txtDLCO| #title:% DLCO | #type:#decimalRight | #min:10.0 | #max:100.0 | #placeholder: % DLCO"
	static let po2 = "#id:txtPO2| #title:PO₂ mmhg | #type:#decimalRight | #min:10.0 | #max:100.0 | #placeholder: PO₂ mmhg"
	static let nsevere = "#id:chknsevere| #title:NSevere chronic hypercapnia | #type:#check"
	static let asthmadisease = "#id:chkasthma| #title:Asthma / Reactive airway disease | #type:#disclosureControl"
	static let acuteExacerbation = "#id:chkexacerbation| #title:Acute exacerbation | #type:#disclosureControl"
	static let interstitialLungDisease = "#id:chkILD| #title:Interstitial lung disease | #type:#check"
	
	// Pulmonary -> Asthma / Reactive airway disease:
	static let symptomsWeek = "#id:txtasymptoms| #title:Symptoms / week | #type:#decimalRight | #min:0.0 | #max:112.0 | #placeholder: Value"
	static let nocturnal = "#id:txtnocturnal| #title:Nocturnal awakening / week | #type:#decimalRight | #min:0.0 | #max:112.0 | #placeholder: Value"
	static let sabaUse = "#id:txtSABA| #title:SABA use / week | #type:#decimalRight | #min:0.0 | #max:112.0 | #placeholder: Value"
	
	// Pulmonary -> Asthma / Reactive airway disease -> Interference with activity:
	static let interference = "#id:chkinterference| #title: Interference with activity | #type:#disclosureControl"
	static let noneInterference = "#id:chknone| #title:None | #type:#check"
	static let minor = "#id:chkminor| #title:Minor | #type:#check"
	static let some = "#id:chksome| #title:Some | #type:#check"
	static let significant = "#id:chksignificant| #title:Significant | #type:#check"
	
	// Pulmonary -> Acute exacerbation:
	static let acute = "#id:chkexacerbation| #title:Acute Exacerbation | #type:#check"
	static let copdex = "#id:chkCOPDex| #title:More than 1 COPD Exacerbation/year | #type:#check"
	static let copdhos = "#id:chkCOPDhos| #title:One or more hospital admission/year | #type:#check"
	
	
	//
	// MARK: - Renal
	//
	static let acuteRF = "#id:chkWG | #title: Acute Renal Failure / Worsening Renal Function | #type:#disclosureControl"
	static let chronicKD = "#id:chkCKD | #title: Chronic kidney disease | #type:#disclosureControl"

	// Renal -> Acute Renal Failure / Worsening Renal Function
	static let crinic = "#id:txtcrinc| #title:Increase in SCrx baseline | #type:#decimalRight | #min:1.0 | #max:10.0 | #placeholder: Value"
	static let cr48h = "#id:txtcr| #title: Increase in SCr by mg/dl in 48hr | #type:#decimalRight | #min:0.1 | #max:112.0 | #placeholder: Value"
	static let urinvolume = "#id:txturine| #title:Urine Volume ml/kg/h | #type:#decimalRight | #min:0.0 | #max:200.0 | #placeholder: Value"
	
	
	//
	// MARK: - Major CV Risk Factors https://zpl.io/1OuArq
	//
	static let diabetes = "#id:diabetes | #title:Diabetes | #type:#disclosureControl"
	static let systemicArterialHypertension = "#id:chkSAH | #title:Systemic Arterial Hypertension | #type:#disclosureControl" // WithCheck"
	static let tobaccoUse = "#id:chkSmoke | #title:Tobacco Use | #type:#check"
	static let familyHistory = "#id:chkFamily | #title:Family History | #type:#check"
	
	// Major CV Risk Factors -> Diabetes https://zpl.io/2lz31S
	static let typeIIDM = "#id:chkDM | #title:Type II DM | #type:#disclosureControl"
	static let typeIDM = "#id:chkDM1 | #title:Type I DM | #type:#disclosureControl"
	static let gestationalDM = "#id:chkgestational | #title:Gestational DM | #type:#check"
	static let retinopathy = "#id:chkRetinopathy | #title:Retinopathy | #type:#check"
	
	static let DMNP = "#id:chkDMNP | #title:Nephropathy | #type:#check"
	static let DMCKD = "#id:chkDMCKD| #title:CKD | #type:#check"
	static let DMother = "#id:chkDMother | #title:Other Kidney comp | #type:#check"
	static let DMmono = "#id:chkDMmono | #title:Mononeuropathy| #type:#check"
	static let DMpoly = "#id:chkDMpoly| #title:Polyneuropathy | #type:#check"
	static let DMautonom = "#id:chkDMautonom | #title:Autonom neuropathy| #type:#check"
	static let DMangio = "#id:chkDMangio | #title:Peripheral Angiopathy | #type:#check"
	static let DMothercirc = "#id:chkDMothercirc| #title:Other circulatory comp| #type:#check"
	static let DMgangrene = "#id:chkDMgangrene | #title:Angiopathy with Gangrene | #type:#check"
	static let DMarthro = "#id:chkDMarthro | #title:Arthropathy | #type:#check"
	static let DMskin = "#id:chkDMskin | #title:Skin comp| #type:#check"
	static let DMoral = "#id:chkDMoral| #title:Oral comp| #type:#check"
	static let DMhypo = "#id:chkDMhypo | #title:Hypogycemia| #type:#check"
	static let DMhypocoma = "#id:chkDMhypocoma| #title:Hypoglycemia with coma | #type:#check"
	static let DMhyper = "#id:chkDMhyper | #title:Hyperglycemia | #type:#check"
	static let DMothercomp = "#id:chkDMothercomp | #title:Other comp| #type:#check"
	static let DMunspec = "#id:chkDMunspec| #title:Unspecified comp | #type:#check"
	static let DMwithout = "#id:chkDMwithout | #title:Without comp| #type:#check"
	
	// Major CV Risk Factors -> Systemic Arterial Hypertension https://zpl.io/18q0XF
	static let ambSBP = "#id:ASBP | #title:Amb SBP | #type:#integerRight | #min:80 | #max:190 | #placeholder: Value"
	static let ambDBP = "#id:ADBP | #title:Amb DBP | #type:#integerRight | #min:30 | #max:150 | #placeholder: Value"
	
	static let checkLVHOnEKGIfApplicableLabel = "#type:#label | #title: Check LVH on EKG if Applicable | #id: checkLVHOnEKGIfApplicable"
	static let sbpTreated = "#id:chkSBPTreated | #title:SBP Treated | #type:#check"
	static let africanAmerican = "#id:chkAA | #title:African American | #type:#check"
	
	static let primaryHypertensionLabel = "#type:#label | #title: Secondary Hypertension | #id: primaryHypertensionLabel"
	static let primaryHyperaldesteronism = "#id:chkaldo| #title:Primary Hyperaldesteronism | #type:#check"
	static let renovascularAtheroscleotic = "#id:chkrenovas| #title:Renovascular, Atheroscleotic | #type:#check"
	static let pheocromocytoma = "#id:chkFMD | #title:Pheocromocytoma | #type:#check"
	static let osa = "#id:chkOSA | #title:OSA | #type:#check"
	
	static let secondaryHypertensionLabel = "#type:#label | #title: Acutely Symptomatic | #id: secondaryHypertensionLabel"
	static let headachedBlurredVisionAMS = "#id:chkhead | #title:Headached, Blurred Vision or AMS | #type:#check"
	static let epistaxis = "#id:chkepis | #title:Epistaxis | #type:#check"
	static let chestBackPainDyspnea = "#id:chkCP | #title:Chest Back Pain/Dyspnea | #type:#check"
	
	
	//
	// MARK: - Surgical Risk https://zpl.io/1iVHSg
	//
	static let emergencySurgery = "#id:chkemergency | #title:Emergency Surgery | #type:#check"
	static let intermediateRisk = "#id:chkelective | #title:Intermediate Risk | #type:#check"
	static let highRisk = "#id:chkvascular | #title:High Risk | #type:#check"
	static let familyLowRiskSurgery = "#id:chklowriskelec | #title:Family Low Risk Surgey (Cataract, Plastic) | #type:#check"
	static let unableToExercise = "#id:chkunab | #title:Unable to Exercise | #type:#check"
	static let mets = "#id:TxtMETS | #title:METS | #type:#integerRight | #min:0 | #max:21 | #placeholder: Value"
	static let dukeActivityScoreIndex = "#id:TxtDASI | #title:Duke Activity Score Index | #type:#integerRight | #min:0 | #max:99 | #placeholder: Value"
	
	
	//
	// MARK: - Laboratories https://zpl.io/2kxbQs
	//
	static let chemBasicLabel = "#id:chemBasicLabel | #title:Chem Basic | #type:#label"
	static let nameqlValue = "#id:txtNameq | #title:Na meq/l |#type:#integerRight | #min:99 | #max:170 | #placeholder: Value"
	static let urineNaMeql = "#id:txturineNa | #title:Urine Na meq/l |#type:#integerRight | #min:1 | #max:200 | #placeholder: Value | #dependsOn: nameqlValue| #dependMin: 99| #dependMax: 130"
	static let serumOsmolality = "#id:txtsosm | #title:Serum Osmolality |#type:#integerRight | #min:200 | #max:400 | #placeholder: Value | #dependsOn: nameqlValue| #dependMin: 99| #dependMax: 130"
	static let urineOsmolality = "#id:txtuosm | #title:Urine Osmolality |#type:#integerRight | #min:200 | #max:1000 | #placeholder: Value | #dependsOn: nameqlValue| #dependMin: 99| #dependMax: 130"
	static let kmeql = "#id:txtHomo | #title:K meq/l |#type:#decimalRight | #min:2.0 | #max:9.0 | #placeholder: Value"
	static let creatinineMgDl = "#id:txtcreatinine | #title:Creatinine mg/dl |#type:#decimalRight | #min:0.4 | #max:20.0 | #placeholder: Value"
	static let bunMgDl = "#id:txtBUN | #title:BUN mg/dl |#type:#integerRight | #min:6 | #max:200 | #placeholder: Value"
	static let fastingPlasmaGlucose = "#id:txtGlucose | #title:Fasting Plasma Glucose |#type:#integerRight | #min:35 | #max:1000 | #placeholder: Value"
	static let gfrMlMin173M2 = "#id:txtGFR | #title:GFR ml/min/1.73 M2 |#type:#integerRight | #min:5 | #max:120 | #placeholder: Value"
	static let worseningRenalFx = "#id:chkWG | #title:Worsening Renal Fx | #type:#check"
	
	static let lipidProfileLabel = "#id:lipidProfileLabel | #title:Lipid Profile | #type:#label"
	static let alreadyOnStatin = "#id:chkalready | #title:Already on Statin | #type:#check"
	static let statinIntolerance = "#id:chkstatint | #title:Statin Intolerance | #type:#check"
	static let cholesterol = "#id:txtCholesterol | #title:Cholesterol |#type:#integerRight | #min:40 | #max:500 | #placeholder: Value"
	static let trg = "#id:txtTRG | #title:TRG |#type:#integerRight | #min:25 | #max:25000 | #placeholder: Value"
	static let ldlc = "#id:txtLDL | #title:LDL-C |#type:#integerRight | #min:0 | #max:500 | #placeholder: Value"
	static let hdlc = "#id:txtHDL | #title:HDL-C |#type:#integerRight | #min:1 | #max:200 | #placeholder: Value"
	static let apoB = "#id:txtApoB | #title:Apo B |#type:#integerRight | #min:0 | #max:400 | #placeholder: Value"
	static let ldlp = "#id:txtLDLP | #title:LDL-P |#type:#integerRight | #min:100 | #max:5000 | #placeholder: Value"
	static let lpaMgdl = "#id:txtLPA | #title:LPa mg/dl |#type:#integerRight | #min:1 | #max:500 | #placeholder: Value"
	static let ascvdRisk = "#id:txtASCVD | #title:ASCVD Risk |#type:#decimalRight | #min:0.1 | #max:30 | #placeholder: Value"
	
	static let othersLabel = "#id:othersLabel | #title:Others | #type:#label"
	static let hba1c = "#id:txtHBA1C | #title:HBA1C |#type:#decimalRight | #min:4.9 | #max:19.99 | #placeholder: Value"
	static let crpMgl = "#id:txtCRP | #title:CRP mg/l |#type:#decimalRight | #min:0.1 | #max:30.0 | #placeholder: Value"
	static let ntProBNPPgMl = "#id:txtproBNP | #title:NT-proBNP pg/ml |#type:#integerRight | #min:50 | #max:100000 | #placeholder: Value"
	static let bnpPgMl = "#id:txtBNP | #title:BNP pg/ml |#type:#integerRight | #min:10 | #max:100000 | #placeholder: Value"
	static let albuminuriaMgGmOrMg24hr = "#id:txtMICRO | #title:Albuminuria Mg.Gm or Mg/24hr |#type:#integerRight | #min:1 | #max:10000 | #placeholder: Value"
	
	// Laboratories -> Abnormal urine sediment
	static let abnormalurinsediment = "#id:chksediment | #title:Abnormal urine sediment | #type:#disclosureControl"
	static let isolatedrbc = "#id:chkRBC | #title:Isolated RBC | #type:#check"
	static let rbccast = "#id:chkRBCcast | #title: RBC Cast| #type:#check"
	static let wbccast = "#id:chkWBCcast | #title: WBC Cast | #type:#check"
	static let granularcast = "#id:chkgranular | #title:Granular Cast | #type:#check"
	static let ovalcellbodies = "#id:chkoval | #title:Oval Cell Bodies | #type:#check"

	
	//
	// MARK: - Diagnostics https://zpl.io/ZcDQES
	//
	static let ekg = "#id:chkEKG | #title:EKG | #type:#disclosureControl"
	static let stressTesting = "#id:chkDTS | #title:Stress Testing | #type:#disclosureControl"
	static let echocardiography = "#id:chkEcho | #title:Echocardiography | #type:#disclosureControl"
	static let chestXRay = "#id:chkchestxray | #title:Chest X-Ray | #type:#disclosureControl"
	static let rhc = "#id:chkHC | #title:RHC | #type:#disclosureControl | #alert: Refer to Heart Failure Specialist for Management"
	static let coronaryCalciumScore = "#id:txtCCS | #title:Coronary Calcium Score |#type:#integerRight | #min:0 | #max:100 | #placeholder: Value"
	static let total = "#id:txtTotalCCS | #title:Total |#type:#integerRight | #min:0 | #max:10000 | #placeholder: Value"
	
	// Diagnostics -> EKG
	static let nsrInEKG = "#id:chkNSR| #title: Normal sinus rhtym| #type:#check"
	static let svt = "#id:chkPSVT| #title:SVT | #type:#check"
	static let atrialFibrillationInEKG = "#id:chkatrialfib | #title:Atrial Fibrillation | #type:#check"
	static let atrialFlutter = "#id:chkflutter | #title:Atrial Flutter | #type:#disclosureControlExpandable"
	static let prDuration  = "#id:txtPRduration | #title:PR Duration |#type:#integerRight | #min:0 | #max:10000 | #placeholder: Value"
	static let qrsDuration = "#id:txtQRS | #title:QRS Duration |#type:#integerRight | #min:0 | #max:10000 | #placeholder: Value"
	static let nonspecificSTAbnormality = "#id:chknonspesific | #title:Nonspecific ST Abnormality | #type:#check"
	static let stDeviation05mm = "#id:chkST| #title:ST Deviation ≥ 0.5mm | #type:#check"
	static let tWaveInversion1mm = "#id:chkTWI | #title:T Wave Inversion > 1mm | #type:#check"
	static let lvh = "#id:chkLVH| #title:LVH | #type:#check"
	static let lowVoltageQRS = "#id:chklowv | #title:Low Voltage QRS | #type:#check"
	static let abnormalQWaves = "#id:chkabnormq| #title:Abnormal Q Waves | #type:#check"
	static let lbbb = "#id:chkLBBB | #title:LBBB | #type:#check"
	static let bifascicular = "#id:chkbifascicular | #title:Bifascicular | #type:#check"
	static let lahb = "#id:chkLAHB | #title:LAHB | #type:#check"
	static let lphb = "#id:chkLPHB | #title:LPHB | #type:#check"
	static let wpw = "#id:chkWPW | #title:WPW | #type:#check"
	static let vpace = "#id:chkVpace | #title:Ventricular Pacing | #type:#check"
	static let rbbb = "#id:chkRBBB | #title:RBBB | #type:#check"
	static let intraventicularBlock = "#id:chkIVCD| #title:Intraventicular Block | #type:#check"
	static let atrialPrematureDepolarization = "#id:chkAPCs | #title:Atrial Premature Depolarization | #type:#check"
	static let junctionalPrematureDepolarization = "#id:chkJPDs | #title:Junctional Premature Depolarization | #type:#check"
	static let frequentVentricularPacingOrEctopy = "#id:chkFreqVentPac | #title:Frequent Ventricular Pacing or Ectopy | #type:#check"
	static let infrequentVentricularPacingOrEctopy = "#id:chkinfreqvent  | #title:Infrequent Ventricular Pacing or Ectopy | #type:#check"
	static let firstDegreeAVBlock = "#id:chkfirstdegree | #title:1st Degree AV Block | #type:#check"
	static let secondDegreeAVBlock = "#id:chksecondegree | #title:2nd Degree AV Block | #type:#disclosureControlExpandable"
	static let thirdDegreeAVBlock = "#id:chkthirdegree | #title:3rd Degree AV Block | #type:#check"
	
	static let urineNaMeqlInEKG = "#id:urineNaMeqlInEKG | #title:Urine Na meq/l |#type:#integerRight | #min:1 | #max:200 | #placeholder: Value"
	static let serumOsmolalityInEKG = "#id:serumOsmolalityInEKG | #title:Serum Osmolality |#type:#integerRight | #min:200 | #max:400 | #placeholder: Value"
	static let stressTestingInEKG = "#id:stressTestingInEKG | #title:Stress Testing | #type:#check"
	
	// Diagnostics -> EKG -> Atrial Flutter https://zpl.io/Zcjvv8
	static let typicalAF = "#id:chktypicalAF | #title:Typical AF | #type:#check"
	static let atypicalAF = "#id:chkatypicalAF | #title:Atypical AF | #type:#check"
	
	// Diagnostics -> EKG -> 2nd Degree AV Block https://zpl.io/Z1s6jIT
	static let type1 = "#id:chktype1 | #title:Type 1 | #type:#check"
	static let type2 = "#id:chktype2 | #title:Type 2 | #type:#check"
	
	// Diagnostics -> Stress Testing https://zpl.io/Z21VSc7
	static let dukeTreadmillScore = "#id:TxtTTS | #title:Duke Treadmill Score |#type:#integerRight | #min:0 | #max:9999 | #placeholder: Value"
	static let serumStressSummedScore = "#id:txtStressSummedScore | #title:Serum Stress Summed Score |#type:#integerRight | #min:0 | #max:99 | #placeholder: Value"
	static let stressDifferenceScore = "#id:txtreversible | #title:Stress Difference Score |#type:#integerRight | #min:0 | #max:99 | #placeholder: Value"
	static let percentIschemicMyocardiumonMPS = "#id:txtMPS | #title:% Ischemic Myocardium on MPS |#type:#integerRight | #min:0 | #max:100 | #placeholder: Value"
	static let tidOrSignificantDysfunction = "#id:chkTID | #title:TID or Significant Stress-Induced LV Dysfunction | #type:#check"
	static let exTimeMin = "#id:txtExTimeMin | #title:Ex Time (min) |#type:#integerRight | #min:1 | #max:21 | #placeholder: Value"
	static let maxSTMm = "#id:txtMaxST | #title:Max ST (mm) |#type:#integerRight | #min:0 | #max:8 | #placeholder: Value"
	static let anginaIndex = "#id:rbAnginaIndex | #title:Angina Index |#type:#disclosureControl | #min:0 | #max:2 | #placeholder: "
	static let stElevation = "#id:chkSTelevation | #title:ST Elevation | #type:#check"
	static let abnormalBPResponse = "#id:chkabnormalBP | #title:Abnormal BP Response | #type:#check"
	static let ventricularTachycardia = "#id:chkExVT | #title:Ventricular Tachycardia | #type:#check"
	static let prolongSTDepression = "#id:chkprolongedST | #title:Prolonged ST Depression | #type:#check"
	static let fixedPerfusionDefects = "#id:chkfixed  | #title:Fixed Perfusion Defects or Akinetic/Dyskinetic WMA on DSE | #type:#disclosureControlExpandable"
	static let dseIschemicThreshold = "#id:txtDSE | #title:DSE Ischemic Threshold, %MPHR at the Onset of Ischemia |#type:#integerRight | #min:0 | #max:200 | #placeholder: Value"
	static let dseOrStressMRI = "#id:txtWMA | #title:DSE or Stress MRI, Number of Segments with new WMA |#type:#integerRight | #min:0 | #max:24 | #placeholder: Value"
	static let artifactualUninterpretableImages = "#id:chkuninterpret | #title:Artifactual/Uninterpretable Images | #type:#check"
	
	// Diagnostics -> Stress Testing -> Angina Index
	static let noAnginaDuringExercise = "#id:secno_angina_during_exercise| #title:No Angina During Exercise | #type:#radio | #group: (noAnginaDuringExercise, nonLimitingAngina, exerciseLimitingAngina)"
	static let nonLimitingAngina = "#id:secnon_limiting_angina | #title:Non-Limiting Angina | #type:#radio | #group: (noAnginaDuringExercise, nonLimitingAngina, exerciseLimitingAngina)"
	static let exerciseLimitingAngina = "#id:secexercise_limiting_angina | #title:Exercise Limiting Angina | #type:#radio | #group: (noAnginaDuringExercise, nonLimitingAngina, exerciseLimitingAngina)"
	
	// Diagnostics -> Stress Testing -> Fixed Perfusion Defects or Akinetic/Dyskinetic WMA on DSE
	static let viabilityPresent = "#id:chkviable | #title:Viability Present | #type:#check"
	
	// Diagnostics -> Echocardiography
	static let pericardialEffusion = "#id:chkpericardial | #title:Pericardial Effusion | #type:#check"
	static let rwma = "#id:chkRWMA | #title:RWMA | #type:#check"
	static let enlargedLAOrLVH = "#id:chkEnlargedLA | #title:Enlarged LA or LVH | #type:#check"
	static let ea05AndDTMore280ms = "#id:chkLVeccenticity | #title:E/A < 0.5 and DT > 280ms | #type:#check"
	static let gradeMore2DiastolicDysfunction = "#id:chkMPI | #title:Grade ≥ 2 Diastolic Dysfunction | #type:#check"
	static let respiratoryIVSShift = "#id:chkIVSshift | #title:Respiratory IVS Shift | #type:#check"
	static let mitralEVariation = "#id:chkmitralE | #title:Mitral E Variation | #type:#check"
	static let hepaticVeinExpDiastolicReversal = "#id:chkhepatic | #title:Hepatic Vein Exp Diastolic Reversal | #type:#check"
	static let enlargedRA = "#id:chkEnlargedRA | #title:Enlarged RA | #type:#check"
	static let enlargedRV = "#id:chkEnlargedRV | #title:Enlarged RV | #type:#check"
	static let midsystolicNotch = "#id:chkmidsystolicn | #title:Midsystolic Notch | #type:#check"
	static let lvLaterealAnnulusEE = "#id:txtMP | #title:LV Latereal Annulus E/E' |#type:#integerRight | #min:1 | #max:30 | #placeholder: Value"
	static let lvefInEchocardiography = "#id:txtEF | #title:LVEF |#type:#integerRight | #min:10 | #max:80 | #placeholder: Value"
	static let trjVelocityMsec = "#id:txtTRJ | #title:TRJ Velocity m/sec |#type:#integerRight | #min:1 | #max:6 | #placeholder: Value"
	
	// Diagnostics -> Chest X-Ray https://zpl.io/Z2uefQH
	static let rightPleuralEffusion = "#id:chkRPLE | #title:Right Pleural Effusion | #type:#check"
	static let leftPleuralEffusion = "#id:chkLPLE | #title:Left Pleural Effusion | #type:#check"
	static let pulmonaryEdema = "#id:chkpuledema  | #title:Pulmonary Edema | #type:#check"
	static let enlargedCardiacSolhouette = "#id:chkenlarcar | #title:Enlarged Cardiac Silhouette | #type:#check"
	static let widenedMediasteneum = "#id:chkWidened | #title:Widened Mediasteneum | #type:#check"
	static let pneumothorax = "#id:chkpneumothorax | #title:Pneumothorax | #type:#check"
	static let infiltrate = "#id:chkinfiltrate | #title:Infiltrate(s) | #type:#check"
	static let consolidation = "#id:chkconsolidation | #title:Consolidation | #type:#check"
	
	
	//
	// MARK: - Current Therapies (hsr)
	//
	static let poMeds = "#id:poMeds| #title:PO Meds| #type:#disclosureWeather"
	static let inHospital = "#id:inHospital| #title:In Hospital/IV Therapies| #type:#disclosureWeather"
	
	// HSR -> PO Meds https://zpl.io/Z1JXQFi
	static let bBlocker = "#id:chkcar | #title:B Blocker | #type:#disclosureControl"
	static let acelARB = "#id:chkace | #title:Acel/ARB | #type:#disclosureControl"
	static let poDiuretic = "#id:chkdiuretic | #title:PO Diuretic | #type:#disclosureControl"
	static let ccbOtherVasolidators = "#id:chkCCB | #title:CCB, Other Vasolidators | #type:#check"
	static let currentVKATherapy = "#id:chkVKA| #title:Current VKA Therapy | #type:#check"
	static let directThrombinInhibitors = "#id:chkCAC  | #title:Direct Thrombin Inhibitors | #type:#check"
	static let factorXaInhibitors = "#id:chkFactorX  | #title:Factor Xa Inhibitors | #type:#check"
	
	// HSR -> PO Meds -> B Blocker https://zpl.io/Z1Fk3YB
	static let carvedilol3125bid = "#id:chkBisoprolol25 | #title:Carvedilol 3.125 bid | #type:#check"
	static let carvedilol625bid = "#id:chkCarvedilol625 | #title:Carvedilol 6.25 bid | #type:#check"
	static let carvedilol125bid = "#id:chkCarvedilol125 | #title:Carvedilol 12.5 bid | #type:#check"
	static let carvedilol25bid = "#id:chkCarvedilol25 | #title:Carvedilol 25 bid | #type:#check"
	static let metoproloIER25qd = "#id:chkBisoprolol5 | #title:MetoproloIER 25 qd | #type:#check"
	static let metoproloIER50qd = "#id:chkMetoprololER50 | #title:MetoproloIER 50 qd | #type:#check"
	static let metoproloIER100qd = "#id:chkMetoprololER100 | #title:MetoproloIER 100 qd | #type:#check"
	static let metoproloIER150qd = "#id:chkMetoproloIER150 | #title:MetoproloIER 150 qd | #type:#check"
	static let metoproloIER200qd = "#id:chkMetoprololER200 | #title:MetoproloIER 200 qd | #type:#check"
	
	// HSR -> PO Meds -> Acel/ARB
	static let lisinopril5 = "#id:chklisinopril5 | #title:Lisinopril <10mg qd | #type:#check"
	static let lisinopril10 = "#id:chklisinopril10| #title:Lisinopril 10-20mg qd | #type:#check"
	static let lisinopril20 = "#id:chklisinopril20 | #title:Lisinopril 20mg qd | #type:#check"
	static let losartan25 = "#id:chklosartan25 | #title:Lorsatan 25mg qd | #type:#check"
	static let losartan50 = "#id:chklosartan50 | #title:Lorsatan 50mg qd | #type:#check"
	static let losartan100 = "#id:chklosartan100 | #title:Lorsatan 100mg qd | #type:#check"
	
	// HSR -> PO Meds -> PO Diuretic https://zpl.io/1FSlBB
	static let furosemide40 = "#id:chkfurosemide40 | #title:Furosemide 40 | #type:#check"
	static let furosemide80 = "#id:chkfurosemide80 | #title:Furosemide 80 | #type:#check"
	static let furosemide80Plus = "#id:chkfurosemide81 | #title:Furosemide 80+ | #type:#check"
	static let bumex1 = "#id:chkbumex1 | #title:Bumex 1 | #type:#check"
	static let bumex2 = "#id:chkbumex2 | #title:Bumex 2 | #type:#check"
	static let bumex2Plus = "#id:chkbumex3 | #title:Bumex 2+ | #type:#check"
	static let torsemide20 = "#id:chktorsemide20 | #title:Torsemide 20 | #type:#check"
	static let torsemide40 = "#id:chktorsemide40 | #title:Torsemide 40 | #type:#check"
	static let torsemide50Plus = "#id:chktorsemide50 | #title:Torsemide 50+ | #type:#check"
	static let hctz = "#id:chkHCTZ | #title:HCTZ | #type:#check"
	static let indapamide = "#id:chkindapamide | #title:Indapamide | #type:#check"
	static let chlorthalidoneMetolazone = "#id:chkchlorthalidone | #title:Chlorthalidone, Metolazone |#type:#check"
	
	// HSR -> In Hospital/IV Therapies https://zpl.io/1QwAhq
	static let ivAntiarrythmic = "#id:chkIVAA | #title:IV Antiarrythmic | #type:#disclosureControl"
	static let urgentCV = "#id:chkurgcv | #title:Urgent CV | #type:#check"
	static let defibrillationACLS = "#id:chkdefib | #title:Defibrillation/ACLS | #type:#check"
	static let ivAntihypertensive = "#id:chkIVHT | #title:IV Antihypertensive | #type:#disclosureControl"
	static let ivVasoactive = "#id:chkIVVA | #title:IV Vasoactive | #type:#disclosureControl"
	static let ivDiuretic = "#id:chkIVDI | #title:IV Diuretic | #type:#disclosureControl"
	static let mechanicalVentiallationOrNIPPV = "#id:chkNIPPV | #title:Mechanical Ventiallation or NIPPV | #type:#disclosureControl"
	static let o2Supplement = "#id:txtOsupp | #title:O₂ Supplement % / | #type:#check | #type:#integerRight | #min:23 | #max:100 | #placeholder: Value"
	static let ivVasopressors = "#id:chkVAD | #title:IV Vasopressors | #type:#check"
	static let ultrafiltration = "#id:chkult | #title:Ultrafiltration | #type:#check"
	static let iabp = "#id:chkIABP | #title:IABP | #type:#check"
	static let temporaryPM = "#id:chkTPM | #title:Temporary PM | #type:#check"
	
	// HSR -> In Hospital -> IV Antiarrythmic https://zpl.io/2f248Q
	static let continuousInAntiarrythmic = "#id:chkAAcon | #title:Continuous | #type:#check"
	static let bolusInAntiarrythmic = "#id:chkAAbolus | #title:Bolus | #type:#check"
	static let titrationInAntiarrythmic = "#id:chkAAtitr | #title:Titration | #type:#check"
	static let monitoringFrequencyQhrInAntiarrythmic = "#id:TxtAAmonitor | #title:Monitoring Frequency Q hr | #type:#integerRight | #min:1 | #max:12 | #placeholder: Value"
	static let transitionToPOAntiarrythmicInAntiarrythmic = "#id:chkPOAA | #title:Transition to PO Antiarrythmic | #type:#check"
	
	// HSR -> In Hospital -> IV Antihypertensive https://zpl.io/DhPB6
	static let blnIVHTcon = "#id:chkHTcon | #title:Continuous | #type:#check"
	static let blnIVHTbolus = "#id:chkHTbolus | #title:Bolus | #type:#check"
	static let blnIVHTtitr = "#id:chkHTtitr | #title:Titration | #type:#check"
	static let txtHTmonitor = "#id:txtHTmonitor | #title:Monitoring Frequency Q hr  |#type:#integerRight | #min:1 | #max:12 | #placeholder: Value"
	
	// HSR -> In Hospital -> IV Vasoactive https://zpl.io/Ll2Pm
	static let blnIVVAcon = "#id:chkVAcon | #title:Continuous | #type:#check"
	static let blnIVVAbolus = "#id:chkVAbolus | #title:Bolus | #type:#check"
	static let blnIVVAtitr = "#id:chkVAtitr | #title:Titration | #type:#check"
	static let txtVAmonitor = "#id:TxtVAmonitor | #title:Monitoring Frequency Q hr  |#type:#integerRight | #min:1 | #max:12 | #placeholder: Value"
	static let blnIVNPSz = "#id:chkIVNPS | #title:IV NPS | #type:#check"
	static let blnIVNTG = "#id:chkIVNTG | #title:IV NTG | #type:#check"
	static let blnmilrinone = "#id:chkmilrinone | #title:IV Milrinone | #type:#check"
	
	// HSR -> In Hospital -> IV Diuretic https://zpl.io/Z5hShw
	static let blncon = "#id:chkcon | #title:Continuous | #type:#check"
	static let blnPODI = "#id:chkPODI | #title:Intermittent | #type:#check"
	static let txtmonitor = "#id:Txtmonitor | #title:Monitoring Frequency Q hr  |#type:#integerRight | #min:1 | #max:12 | #placeholder: Value"
	
	// HSR -> In Hospital -> Mechanical Ventillation or NIPPV https://zpl.io/2kgsB0
	static let txtRI = "#id:txtRI | #title:Respiratory Interventions Q Hr |#type:#integerRight | #min:1 | #max:6 | #placeholder: Value"
	
	//
	// MARK: - Heart Specialist Management
	//
	static let bioPAHMain = "#id:bioPAHMain | #title:Bio/PAH Main | #type:#disclosureWeather"
	static let pah = "#id:pah | #title:PAH | #type:#disclosureWeather"
	static let valvularInHSM = "#id:valvularInHSM | #title:Valvular | #type:#disclosureWeather"
	static let advancedLHF = "#id:advancedLHF | #title:Advanced LHF | #type:#disclosureWeather"
	static let echocardiographyInHSM = "#id:echocardiographyInHSM | #title:Echocardiography | #type:#disclosureWeather"
	static let laboratoryEKG = "#id:laboratoryEKG | #title:Laboratory/EKG | #type:#disclosureWeather"
	static let rhcInHSM = "#id:rhcInHSM | #title:RHC | #type:#disclosureWeather"
	
	static let pah1 = "#id:pah1 | #title:Page 1 | #type:#segment"
	static let pah2 = "#id:pah2 | #title:Page 2 | #type:#segment"
	static let pah3 = "#id:pah3 | #title:Page 3 | #type:#segment"

}
