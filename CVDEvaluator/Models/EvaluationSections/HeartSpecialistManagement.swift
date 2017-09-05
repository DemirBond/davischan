//
//  HeartSpecialistManagement.swift
//  CVDEvaluator
//
//  Created by bogdankosh on 2/14/17.
//  Copyright © 2017 IgorKhomiak. All rights reserved.
//

import Foundation


// MARK: - Heart Specialist Management

class HeartSpecialistManagement: EvaluationItem {
	
	let bioPAHMain = BioPAHMain(literal: Presentation.bioPAHMain)
	let pah = PAH(literal: Presentation.pah)
	let valvularInHSM = Valvular(literal: Presentation.valvularInHSM)
	let advancedLHF = AdvancedLHF(literal: Presentation.advancedLHF)
	let echocardiographyInHSM = EchocardiographyInHSM(literal: Presentation.echocardiographyInHSM)
	let laboratoryEKG = LaboratoryEKG(literal: Presentation.laboratoryEKG)
	let rhcInHSM = RHCInHSM(literal: Presentation.rhcInHSM)
	
	override var items: [EvaluationItem] {
		return [
			bioPAHMain,
			pah,
			valvularInHSM,
			advancedLHF,
			echocardiographyInHSM,
			laboratoryEKG,
			rhcInHSM
		]
	}
}


// MARK: - HMS -> Bio PAH Main

class BioPAHMain: EvaluationItem {
	
	let separator = EvaluationItem(literal: Presentation.separator)
	
	let name = EvaluationItem(literal: HMS.name)
	let age = EvaluationItem(literal: HMS.age)
	let gender = GenderInHMS(literal: HMS.gender)
	let height = EvaluationItem(literal: HMS.height)
	let weight = EvaluationItem(literal: HMS.weight)
	let heartRate = EvaluationItem(literal: HMS.heartRate)
	let bioSBP = EvaluationItem(literal: HMS.bioSBP)
	let bioDBP = EvaluationItem(literal: HMS.bioDBP)
	let orthostaticSBP = EvaluationItem(literal: HMS.orthostaticSBP)
	let orthostaticSymptoms = EvaluationItem(literal: HMS.orthostaticSymptoms)
	
	let NYHACCSVClass1 = EvaluationItem(literal: HMS.NYHACCSVClass1)
	let NYHACCSVClass2 = EvaluationItem(literal: HMS.NYHACCSVClass2)
	let NYHACCSVClass3 = EvaluationItem(literal: HMS.NYHACCSVClass3)
	let NYHACCSVClass4 = EvaluationItem(literal: HMS.NYHACCSVClass4)
	let txt6MWT = EvaluationItem(literal: HMS.txt6MWT)
	let TxtVO2 = EvaluationItem(literal: HMS.TxtVO2)
	
	override var items: [EvaluationItem] {
		return [
			name,
			age,
			gender,
			//height,
			weight,
			heartRate,
			bioSBP,
			bioDBP,
			orthostaticSBP,
			orthostaticSymptoms,
			
			separator,
			
			txt6MWT,
			TxtVO2
		]
	}
}


// MARK: - HMS -> Bio PAH Main -> Gender

class GenderInHMS: EvaluationItem {
	
	let male = EvaluationItem(literal: Presentation.maleInHMS)
	let female = EvaluationItem(literal: Presentation.femaleInHMS)
	
	override var items: [EvaluationItem] {
		return [male, female]
	}
}


// MARK: - HMS -> PAH

class PAH: EvaluationItem {
	
	let pah1 = PAH1(literal: Presentation.pah1)
	let pah2 = PAH2(literal: Presentation.pah2)
	let pah3 = PAH3(literal: Presentation.pah3)

	override var items: [EvaluationItem] {
		return [
			pah1,
			pah2,
			pah3
		]
	}
}


// MARK: - HMS -> PAH -> PAH1

class PAH1: EvaluationItem {
	
	let txtSVR = EvaluationItem(literal: HMS.txtSVR)
	let blnCongenita = Congenital(literal: HMS.blnCongenita)
	let blnSclero = EvaluationItem(literal: HMS.blnSclero)
	let blnSLE = EvaluationItem(literal: HMS.blnSLE)
	let blnHIV = EvaluationItem(literal: HMS.blnHIV)
	let blnFF = EvaluationItem(literal: HMS.blnFF)
	let blnresp = RespiratoryDisease(literal: HMS.blnresp)
	let blnIdio = EvaluationItem(literal: HMS.blnIdio)
	let blnPVOD = EvaluationItem(literal: HMS.blnPVOD)
	let blnSplen = EvaluationItem(literal: HMS.blnSplen)
	let blnFamilial = EvaluationItem(literal: HMS.blnFamilial)
	let blnCTEP = EvaluationItem(literal: HMS.blnCTEP)
	let blnDrugs = EvaluationItem(literal: HMS.blnDrugs)
	
	override var items: [EvaluationItem] {
		return [
			txtSVR,
			blnCongenita,
			blnSclero,
			blnSLE,
			blnHIV,
			blnFF,
			blnresp,
			blnIdio,
			blnPVOD,
			blnSplen,
			blnFamilial,
			blnCTEP,
			blnDrugs
		]
	}
}


// MARK: - HMS -> PAH -> PAH1 -> Congential

class Congenital: EvaluationItem {
	
	let blnASD = EvaluationItem(literal: HMS.blnASD)
	let blnVSD = EvaluationItem(literal: HMS.blnVSD)
	let blnPCS = EvaluationItem(literal: HMS.blnPCS)
	let blnEisen = EvaluationItem(literal: HMS.blnEisen)
	
	override var items: [EvaluationItem] {
		return [
			blnASD,
			blnVSD,
			blnPCS,
			blnEisen
		]
	}
}


// MARK: - HMS -> PAH -> PAH1 -> Respiratory Disease

class RespiratoryDisease: EvaluationItem {
	let txtAHI = EvaluationItem(literal: HMS.txtAHI)
	let blnOSA = EvaluationItem(literal: HMS.blnOSA)
	let blnILD = EvaluationItem(literal: HMS.blnILD)
	let blnCOPD = EvaluationItem(literal: HMS.blnCOPD)
	
	override var items: [EvaluationItem] {
		return [
			txtAHI,
			blnOSA,
			blnILD,
			blnCOPD
		]
	}
}


// MARK: - HMS -> PAH -> PAH2

class PAH2: EvaluationItem {
	
	let dlco = EvaluationItem(literal: HMS.dlco)
	let fev1LT = EvaluationItem(literal: HMS.fev1LT)
	let fev1Percent = EvaluationItem(literal: HMS.fev1Percent)
	let icTLC = EvaluationItem(literal: HMS.icTLC)
	
	override var items: [EvaluationItem] {
		return [
			dlco,
			fev1LT,
			fev1Percent,
			icTLC
		]
	}
}


// MARK: - HMS -> PAH -> PAH3

class PAH3: EvaluationItem {
	
	let txtTRJ = EvaluationItem(literal: HMS.txtTRJ)
	let txtERVSP = EvaluationItem(literal: HMS.txtERVSP)
	let blnAD = EvaluationItem(literal: HMS.blnAD)
	let blnTD = EvaluationItem(literal: HMS.blnTD)
	let blnRVOT = EvaluationItem(literal: HMS.blnRVOT)
	let blnTPS = EvaluationItem(literal: HMS.blnTPS)
	let blnEsmaller8 = EvaluationItem(literal: HMS.blnEsmaller8)
	let blnTei = EvaluationItem(literal: HMS.blnTei)
	let blnTapse = EvaluationItem(literal: HMS.blnTapse)
	let blnE8to16 = EvaluationItem(literal: HMS.blnE8to16)
	let blnMidsystolic = EvaluationItem(literal: HMS.blnMidsystolic)
	let blnEnlargedRA = EvaluationItem(literal: HMS.blnEnlargedRA)
	let blnEgreater16 = EvaluationItem(literal: HMS.blnEgreater16)
	let blnEnlargedRV = EvaluationItem(literal: HMS.blnEnlargedRV)
	let blnPericardial = EvaluationItem(literal: HMS.blnPericardial)
	
	override var items: [EvaluationItem] {
		return [
			txtTRJ,
			txtERVSP,
			blnAD,
			blnTD,
			blnRVOT,
			blnTPS,
			blnEsmaller8,
			blnTei,
			blnTapse,
			blnE8to16,
			blnMidsystolic,
			blnEnlargedRA,
			blnEgreater16,
			blnEnlargedRV,
			blnPericardial
		]
	}
}

class CHD: EvaluationItem {
	let blnACS = EvaluationItem(literal: HMS.blnACS)
	let blnPCI = EvaluationItem(literal: HMS.blnPCI)
	let blnStenusis = EvaluationItem(literal: HMS.blnStenusis)
	
	override var items: [EvaluationItem] {
		return [
			blnACS,
			blnPCI,
			blnStenusis
		]
	}
}

class AF: EvaluationItem {
	let txtCMP = EvaluationItem(literal: HMS.txtCMP)
	
	override var items: [EvaluationItem] {
		return [txtCMP]
	}
}


// MARK: - HMS -> Valvular

class Valvular: EvaluationItem {
	
	let valvularInValvular = ValvularInValvular(literal: HMS.valvularInValvular)
	let valvularSurgeryRiskInValvular = ValvularSurgeryRiskInValvular(literal: HMS.valvularSurgeryRiskInValvular)
	let otherSurgicalRiskInValvular = OtherSurgicalRiskInValvular(literal: HMS.otherSurgicalRiskInValvular)
	
	override var items: [EvaluationItem] {
		return [
			valvularInValvular,
			valvularSurgeryRiskInValvular,
			otherSurgicalRiskInValvular
		]
	}
}


// MARK: - HMS -> Valvular -> Valvular

class ValvularInValvular: EvaluationItem {
	
	let lvef = EvaluationItem(literal: HMS.lvef)
	let newOnsetAtrialFibrillation = EvaluationItem(literal: HMS.newOnsetAtrialFibrillation)
	let pregnancyInValvular = EvaluationItem(literal: HMS.pregnancyInValvular)
	let aorticStenosis = AorticStenosis(literal: HMS.aorticStenosis)
	let mitralStenosis = MitralStenosis(literal: HMS.mitralStenosis)
	
	let tricuspidStenosis = MitralStenosis(literal: HMS.tricuspidStenosis)
	let pulmonicStenosis = PulmonicStenosis(literal: HMS.pulmonicStenosis)
	let aorticRegurgitation = AorticRegurgitation(literal: HMS.aorticRegurgitation)
	
	let primaryMitralRegurgitation = PrimaryMitralRegurgitation(literal: HMS.primaryMitralRegurgitation)
	let tricuspidRegurgitation = TricuspidRegurgitation(literal: HMS.tricuspidRegurgitation)
	let pulmonicRegurgitation = PulmonicRegurgitation(literal: HMS.pulmonicRegurgitation)
	
	override var items: [EvaluationItem] {
		return [
				lvef,
				newOnsetAtrialFibrillation,
				pregnancyInValvular,
				aorticStenosis,
				mitralStenosis,
				pulmonicStenosis,
				aorticRegurgitation,
				primaryMitralRegurgitation,
				tricuspidRegurgitation,
				pulmonicRegurgitation
		]
	}
}


// MARK: - HMS -> Valvular -> Valvular -> Aortic Stenosis

class AorticStenosis: EvaluationItem {
	
	let calcAorticValve = EvaluationItem(literal: HMS.calcAorticValve)
	let congenitallyStenoticAorticValve = EvaluationItem(literal: HMS.congenitallyStenoticAorticValve)
	let rheumaticAV = EvaluationItem(literal: HMS.rheumaticAV)
	let calculatedAorticValveArea = EvaluationItem(literal: HMS.calculatedAorticValveArea)
	let aorticMeanPressureGradient = EvaluationItem(literal: HMS.aorticMeanPressureGradient)
	let aorticValveVelocity = EvaluationItem(literal: HMS.aorticValveVelocity)
	let strokeVolumeIndex = EvaluationItem(literal: HMS.strokeVolumeIndex)
	let indexedValveArea = EvaluationItem(literal: HMS.indexedValveArea)
	let bicuspidAorticRootDiameter = EvaluationItem(literal: HMS.bicuspidAorticRootDiameter)
	
	override var items: [EvaluationItem] {
		return [
			calcAorticValve,
			congenitallyStenoticAorticValve,
			rheumaticAV,
			calculatedAorticValveArea,
			aorticMeanPressureGradient,
			aorticValveVelocity,
			strokeVolumeIndex,
			indexedValveArea,
			bicuspidAorticRootDiameter
		]
	}
}


// MARK: - HMS -> Valvular -> Valvular -> Mitral Stenosis

class MitralStenosis: EvaluationItem {
	
	let mva = EvaluationItem(literal: HMS.mva)
	let phtmsec = EvaluationItem(literal: HMS.phtmsec)
	let rheumaticMVTV = EvaluationItem(literal: HMS.rheumaticMVTV)
	let favorableValveMorphology = EvaluationItem(literal: HMS.favorableValveMorphology)
	let laClot = EvaluationItem(literal: HMS.laClot)
	
	override var items: [EvaluationItem] {
		return [
			mva,
			phtmsec,
			rheumaticMVTV,
			favorableValveMorphology,
			laClot
		]
	}
}

class TricuspidStenosis: EvaluationItem {

	let mvacm = EvaluationItem(literal: HMS.mvacm)
	let centralJetArea = EvaluationItem(literal: HMS.centralJetArea)
	let venaContractaWidthInTricuspid = EvaluationItem(literal: HMS.venaContractaWidthInTricuspid)
	let hepaticVeinFlowReversal = EvaluationItem(literal: HMS.hepaticVeinFlowReversal)
	let abnormalTVLeaflets = EvaluationItem(literal: HMS.abnormalTVLeaflets)
	
	override var items: [EvaluationItem] {
		return [
			mvacm,
			centralJetArea,
			venaContractaWidthInTricuspid,
			hepaticVeinFlowReversal,
			abnormalTVLeaflets
		]
	}
}


// MARK: - HMS -> Valvular -> Valvular -> Pulmonic Stenosis

class PulmonicStenosis: EvaluationItem {
	
	let pulmonicValveVelocity = EvaluationItem(literal: HMS.pulmonicValveVelocity)
	
	override var items: [EvaluationItem] {
		return [pulmonicValveVelocity]
	}
}


// MARK: - HMS -> Valvular -> Valvular -> Aortic Regurgitation

class AorticRegurgitation: EvaluationItem {
	
	let holodiastolicFlowReversal = EvaluationItem(literal: HMS.holodiastolicFlowReversal)
	let venaContractaWidth = EvaluationItem(literal: HMS.venaContractaWidth)
	let regurgitantVolumeMlBeat = EvaluationItem(literal: HMS.regurgitantVolumeMlBeat)
	let regurgitantFraction = EvaluationItem(literal: HMS.regurgitantFraction)
	let ero = EvaluationItem(literal: HMS.ero)
	let lveddmm = EvaluationItem(literal: HMS.lveddmm)
	let lvesdmm = EvaluationItem(literal: HMS.lvesdmm)
	let aorticRootDiameter = EvaluationItem(literal: HMS.aorticRootDiameter)
	
	override var items: [EvaluationItem] {
		return [
			holodiastolicFlowReversal,
			venaContractaWidth,
			regurgitantVolumeMlBeat,
			regurgitantFraction,
			ero,
			lveddmm,
			lvesdmm,
			aorticRootDiameter
		]
	}
}


// MARK: - HMS -> Valvular -> Valvular -> Primary Mitral Regurgitation

class PrimaryMitralRegurgitation: EvaluationItem {
	
	let holodiastolicFlowReversal = EvaluationItem(literal: HMS.holodiastolicFlowReversal)
	let venaContractaWidth = EvaluationItem(literal: HMS.venaContractaWidth)
	let regurgitantVolumeMlBeat = EvaluationItem(literal: HMS.regurgitantVolumeMlBeat)
	let regurgitantFraction = EvaluationItem(literal: HMS.regurgitantFraction)
	let ero = EvaluationItem(literal: HMS.ero)
	let lveddmm = EvaluationItem(literal: HMS.lveddmm)
	let lvesdmm = EvaluationItem(literal: HMS.lvesdmm)
	let aorticRootDiameter = EvaluationItem(literal: HMS.aorticRootDiameter)
	
	override var items: [EvaluationItem] {
		return [
			venaContractaWidth,
			regurgitantVolumeMlBeat,
			regurgitantFraction,
			ero,
			lveddmm,
			lvesdmm
		]
	}
}


// MARK: - HMS -> Valvular -> Valvular -> Tricuspid Regurgitation

class TricuspidRegurgitation: EvaluationItem {
	
	let txtAnnularDiameter = EvaluationItem(literal: HMS.txtAnnularDiameter)
	let txtCentralJetArea = EvaluationItem(literal: HMS.txtCentralJetArea)
	let txtVenaContractaWidth = EvaluationItem(literal: HMS.txtVenaContractaWidth)
	let blnHepaticVeinFlowRev = EvaluationItem(literal: HMS.blnHepaticVeinFlowRev)
	let blnabTVleaflet = EvaluationItem(literal: HMS.blnabTVleaflet)
	
	override var items: [EvaluationItem] {
		return [
			txtAnnularDiameter,
			txtCentralJetArea,
			txtVenaContractaWidth,
			blnHepaticVeinFlowRev,
			blnabTVleaflet
		]
	}
}


// MARK: - HMS -> Valvular -> Valvular -> Pulmonic Regurgitation

class PulmonicRegurgitation: EvaluationItem {
	let favorableValveMorphologyInPulmonic = EvaluationItem(literal: HMS.favorableValveMorphologyInPulmonic)
	let abnormalPulmonicValveLeaflets = EvaluationItem(literal: HMS.abnormalPulmonicValveLeaflets)
	
	override var items: [EvaluationItem] {
		return [
			favorableValveMorphologyInPulmonic,
			abnormalPulmonicValveLeaflets
		]
	}
}


// MARK: - HMS -> Valvular -> Valvular Surgery Risk

class ValvularSurgeryRiskInValvular: EvaluationItem {
	
	let stsPromLabel = EvaluationItem(literal: HMS.stsPromLabel)
	let lowInVRS = EvaluationItem(literal: HMS.lowInVRS)
	let intermediateInVRS = EvaluationItem(literal: HMS.intermediateInVRS)
	let highInVRS = EvaluationItem(literal: HMS.highInVRS)
	let prohibitiveInVRS = EvaluationItem(literal: HMS.prohibitiveInVRS)
	
	override var items: [EvaluationItem] {
		return [
			stsPromLabel,
			lowInVRS,
			intermediateInVRS,
			highInVRS,
			prohibitiveInVRS
		]
	}
}


// MARK: - HMS -> Valvular -> Other Surgical Risk

class OtherSurgicalRiskInValvular: EvaluationItem {
	
	let supraInguinalVascularSurgery = EvaluationItem(literal: HMS.supraInguinalVascularSurgery)
	let lowRiskCataractPlastic = EvaluationItem(literal: HMS.lowRiskCataractPlastic)
	let intermediateRiskInOSR = EvaluationItem(literal: HMS.intermediateRiskInOSR)
	let otherCardiacInOSR = EvaluationItem(literal: HMS.otherCardiacInOSR)
	
	override var items: [EvaluationItem] {
		return [
			supraInguinalVascularSurgery,
			lowRiskCataractPlastic,
			intermediateRiskInOSR,
			otherCardiacInOSR
		]
	}
}


// MARK: - HMS -> Advanced LHF

class AdvancedLHF: EvaluationItem {
	
	let blnHF = HeartFailureInHMS(literal: HMS.blnHF)
	let blnnewHF = EvaluationItem(literal: HMS.blnnewHF)
	let ddOnsetMonthYear = EvaluationItem(literal: HMS.ddOnsetMonthYear)
	//	ddOnsetMonth
	//	ddOnsetYear
	
	override var items: [EvaluationItem] {
		return [
			blnHF,
			blnnewHF,
			ddOnsetMonthYear
			//	ddOnsetMonth
			//	ddOnsetYear
		]
	}
}


// MARK: - HMS -> Advanced LHF -> Heart Failure

class HeartFailureInHMS: EvaluationItem {
	
	let txtdur = EvaluationItem(literal: HMS.txtdur)
	let blnD1 = EvaluationItem(literal: HMS.blnD1)
	let blnD2 = EvaluationItem(literal: HMS.blnD2)
	let blnD3 = EvaluationItem(literal: HMS.blnD3)
	let blnD4 = EvaluationItem(literal: HMS.blnD4)
	let blnD5 = EvaluationItem(literal: HMS.blnD5)
	let blnD6 = EvaluationItem(literal: HMS.blnD6)
	let blnHFPLVF = EvaluationItem(literal: HMS.blnHFPLVF)
	let blnfoutpt = EvaluationItem(literal: HMS.blnfoutpt)
	let blnLVEF = EvaluationItem(literal: HMS.blnLVEF)
	let blnCRTI = EvaluationItem(literal: HMS.blnCRTI)
	
	let clinics = Clinics(literal: HMS.clinics)
	let etiology = Etiology(literal: HMS.etiology)
	let stageClass = StageClass(literal: HMS.stageClass)
	let arrthymias = Arrthymias(literal: HMS.arrthymias)
	let homeTherapeutics = HomeTherapeutics(literal: HMS.homeTherapeutics)
	let therapeutics = Therapeutics(literal: HMS.therapeutics)
	
	class Clinics: EvaluationItem {
		
		let txtCHF = EvaluationItem(literal: HMS.txtCHF)
		let txtO2sat = EvaluationItem(literal: HMS.txtO2sat)
		let txtproBNP = EvaluationItem(literal: HMS.txtproBNP)
		let blnPEd = EvaluationItem(literal: HMS.blnPEd)
		let blnS3 = EvaluationItem(literal: HMS.blnS3)
		let blnshock = EvaluationItem(literal: HMS.blnshock)
		let blnDOE = EvaluationItem(literal: HMS.blnDOE)
		let blndysp = EvaluationItem(literal: HMS.blndysp)
		let blnMR = EvaluationItem(literal: HMS.blnMR)
		let blnhepato = EvaluationItem(literal: HMS.blnhepato)
		let blnJVD = EvaluationItem(literal: HMS.blnJVD)
		let blnweight = EvaluationItem(literal: HMS.blnweight)
		let blnAMS = EvaluationItem(literal: HMS.blnAMS)
		let blnWG = EvaluationItem(literal: HMS.blnWG)
		let blnedema = EvaluationItem(literal: HMS.blnedema)
		
		override var items: [EvaluationItem] {
			return [
				txtCHF,
				txtO2sat,
				txtproBNP,
				blnPEd,
				blnS3,
				blnshock,
				blnDOE,
				blndysp,
				blnMR,
				blnhepato,
				blnJVD,
				blnweight,
				blnAMS,
				blnWG,
				blnedema
			]
		}
	}
	
	class Etiology: EvaluationItem {
		
		let blnNonischemicCMP = EvaluationItem(literal: HMS.blnNonischemicCMP)
		let blnischemicCMP = HOCMinHMS(literal: HMS.blnischemicCMP)
		let blnischemic = EvaluationItem(literal: HMS.blnischemic)
		let blncardiotoxins = EvaluationItem(literal: HMS.blncardiotoxins)
		let blnFamHXofCMP = EvaluationItem(literal: HMS.blnFamHXofCMP)
		let blnvalvular = EvaluationItem(literal: HMS.blnvalvular)
		let blnSuspectedRVDysplasia = EvaluationItem(literal: HMS.blnSuspectedRVDysplasia)
		let blnMI = EvaluationItem(literal: HMS.blnMI)
		
		override var items: [EvaluationItem] {
			return [
				blnNonischemicCMP,
				blnischemicCMP,
				blnischemic,
				blncardiotoxins,
				blnFamHXofCMP,
				blnvalvular,
				blnSuspectedRVDysplasia,
				blnMI
			]
		}
	}
	
	class HOCMinHMS: EvaluationItem {
		
		let blnLVHGreater30 = EvaluationItem(literal: HMS.blnLVHGreater30)
		let blnAbnormBP = EvaluationItem(literal: HMS.blnAbnormBP)
		let blnFHSD = EvaluationItem(literal: HMS.blnFHSD)
		
		override var items: [EvaluationItem] {
			return [
				blnLVHGreater30,
				blnAbnormBP,
				blnFHSD
			]
		}
	}
	
	class StageClass: EvaluationItem {
		
		let blnA = EvaluationItem(literal: HMS.blnA)
		let blnB = EvaluationItem(literal: HMS.blnB)
		let blnC = EvaluationItem(literal: HMS.blnC)
		let blnD = RefactoryHFinHSM(literal: HMS.blnD)
		let blnNYHA1 = EvaluationItem(literal: HMS.blnNYHA1)
		let blnNYHA2 = EvaluationItem(literal: HMS.blnNYHA2)
		let blnNYHA3 = EvaluationItem(literal: HMS.blnNYHA3)
		let blnNYHA4 = EvaluationItem(literal: HMS.blnNYHA4)
		
		override var items: [EvaluationItem] {
			return [
				blnA,
				blnB,
				blnC,
				blnD,
				blnNYHA1,
				blnNYHA2,
				blnNYHA3,
				blnNYHA4
			]
		}
	}
	
	class RefactoryHFinHSM: EvaluationItem {
		
		let calculateHFSSLabel = EvaluationItem(literal: HMS.calculateHFSSLabel)
		let blncom = EvaluationItem(literal: HMS.blncom)
		let blnfrequent = EvaluationItem(literal: HMS.blnfrequent)
		
		override var items: [EvaluationItem] {
			return [
				calculateHFSSLabel,
				blncom,
				blnfrequent
			]
		}
	}
	
	class Arrthymias: EvaluationItem {
		
		let blnAVNodeDisease = EvaluationItem(literal: HMS.blnAVNodeDisease)
		let blnSinusNodeDysfunction = EvaluationItem(literal: HMS.blnSinusNodeDysfunction)
		let blnED = EvaluationItem(literal: HMS.blnED)
		let blnNSVT = EvaluationItem(literal: HMS.blnNSVT)
		
		override var items: [EvaluationItem] {
			return [
				blnAVNodeDisease,
				blnSinusNodeDysfunction,
				blnED,
				blnNSVT
			]
		}
	}
	
	class HomeTherapeutics: EvaluationItem {
		
		let blncar = BBlockerinHMS(literal: HMS.blncar)
		let blnace = EvaluationItem(literal: HMS.blnace)
		let blndiuretic = PODiureticInHMS(literal: HMS.blndiuretic)
		
		override var items: [EvaluationItem] {
			return [
				blncar,
				blnace,
				blndiuretic
			]
		}
	}
	
	class BBlockerinHMS: EvaluationItem {
		
		let blnBisoprolol25 = EvaluationItem(literal: HMS.blnBisoprolol25)
		let blnCarvedilol625 = EvaluationItem(literal: HMS.blnCarvedilol625)
		let blnCarvedilol125 = EvaluationItem(literal: HMS.blnCarvedilol125)
		let blnCarvedilol25 = EvaluationItem(literal: HMS.blnCarvedilol25)
		let blnBisoprolol5 = EvaluationItem(literal: HMS.blnBisoprolol5)
		let blnMetoprololER50 = EvaluationItem(literal: HMS.blnMetoprololER50)
		let blnMetoprololER100 = EvaluationItem(literal: HMS.blnMetoprololER100)
		let blnBisoprolol10 = EvaluationItem(literal: HMS.blnBisoprolol10)
		let blnMetoprololER200 = EvaluationItem(literal: HMS.blnMetoprololER200)
		
		override var items: [EvaluationItem] {
			return [
				blnBisoprolol25,
				blnCarvedilol625,
				blnCarvedilol125,
				blnCarvedilol25,
				blnBisoprolol5,
				blnMetoprololER50,
				blnMetoprololER100,
				blnBisoprolol10,
				blnMetoprololER200
			]
		}
	}
	
	class PODiureticInHMS: EvaluationItem {
		
		let blnfurosemide40 = EvaluationItem(literal: HMS.blnfurosemide40)
		let blnfurosemide80 = EvaluationItem(literal: HMS.blnfurosemide80)
		let blnfurosemide81 = EvaluationItem(literal: HMS.blnfurosemide81)
		let blnbumex1 = EvaluationItem(literal: HMS.blnbumex1)
		let blnbumex2 = EvaluationItem(literal: HMS.blnbumex2)
		let blnbumex3 = EvaluationItem(literal: HMS.blnbumex3)
		let blntorsemide20 = EvaluationItem(literal: HMS.blntorsemide20)
		let blntorsemide40 = EvaluationItem(literal: HMS.blntorsemide40)
		let blntorsemide50 = EvaluationItem(literal: HMS.blntorsemide50)

		override var items: [EvaluationItem] {
			return [
				blnfurosemide40,
				blnfurosemide80,
				blnfurosemide81,
				blnbumex1,
				blnbumex2,
				blnbumex3,
				blntorsemide20,
				blntorsemide40,
				blntorsemide50
			]
		}
	}
	
	class Therapeutics: EvaluationItem {
		
		let blnIVAA = IVAA(literal: HMS.blnIVAA)
		let blnurgcv = EvaluationItem(literal: HMS.blnurgcv)
		let blndefib = EvaluationItem(literal: HMS.blndefib)
		let blnIVHT = IVHT(literal: HMS.blnIVHT)
		let blnIVVA = IVVA(literal: HMS.blnIVVA)
		let blnIVDI = IVDI(literal: HMS.blnIVDI)
		let blnNIPPV = NIPPV(literal: HMS.blnNIPPV)
		let txtOsupp = EvaluationItem(literal: HMS.txtOsupp)
		let blnult = EvaluationItem(literal: HMS.blnult)
		let blnIABP = EvaluationItem(literal: HMS.blnIABP)
		let blnTPM = EvaluationItem(literal: HMS.blnTPM)
		let blnVAD = EvaluationItem(literal: HMS.blnVAD)
		let blncara = EvaluationItem(literal: HMS.blncara)
		let blnacea = EvaluationItem(literal: HMS.blnacea)
		let blnCID = EvaluationItem(literal: HMS.blnCID)
		let blnIID = EvaluationItem(literal: HMS.blnIID)
		
		override var items: [EvaluationItem] {
			return [
				blnIVAA,
				blnurgcv,
				blndefib,
				blnIVHT,
				blnIVVA,
				blnIVDI,
				blnNIPPV,
				txtOsupp,
				blnult,
				blnIABP,
				blnTPM,
				blnVAD,
				blncara,
				blnacea,
				blnCID,
				blnIID
			]
		}
	}
	
	class IVAA: EvaluationItem {
		
		let blnAAcon = EvaluationItem(literal: HMS.blnAAcon)
		let blnAAbolus = EvaluationItem(literal: HMS.blnAAbolus)
		let blnAAtitr = EvaluationItem(literal: HMS.blnAAtitr)
		let TxtAAmonitor = EvaluationItem(literal: HMS.TxtAAmonitor)
		let blnPOAA = EvaluationItem(literal: HMS.blnPOAA)
		
		override var items: [EvaluationItem] {
			return [
				blnAAcon,
				blnAAbolus,
				blnAAtitr,
				TxtAAmonitor,
				blnPOAA
			]
		}
	}
	
	class IVHT: EvaluationItem {
		
		let blnHTcon = EvaluationItem(literal: HMS.blnHTcon)
		let blnHTbolus = EvaluationItem(literal: HMS.blnHTbolus)
		let blnHTtitr = EvaluationItem(literal: HMS.blnHTtitr)
		let TxtHTmonitor = EvaluationItem(literal: HMS.TxtHTmonitor)
		
		override var items: [EvaluationItem] {
			return [
				blnHTcon,
				blnHTbolus,
				blnHTtitr,
				TxtHTmonitor
			]
		}
	}
	
	class IVVA: EvaluationItem {
		
		let blnVAcon = EvaluationItem(literal: HMS.blnVAcon)
		let blnVAbolus = EvaluationItem(literal: HMS.blnVAbolus)
		let blnVAtitr = EvaluationItem(literal: HMS.blnVAtitr)
		let TxtVAmonitor = EvaluationItem(literal: HMS.TxtVAmonitor)
		let blnIVNPS = EvaluationItem(literal: HMS.blnIVNPS)
		let blnIVNTG = EvaluationItem(literal: HMS.blnIVNTG)
		let blnmilrinone = EvaluationItem(literal: HMS.blnmilrinone)
		
		override var items: [EvaluationItem] {
			return [
				blnVAcon,
				blnVAbolus,
				blnVAtitr,
				TxtVAmonitor,
				blnIVNPS,
				blnIVNTG,
				blnmilrinone
			]
		}
	}
	
	class IVDI: EvaluationItem {
		
		let blncon = EvaluationItem(literal: HMS.blncon)
		let blnPODI = EvaluationItem(literal: HMS.blnPODI)
		let Txtmonitor = EvaluationItem(literal: HMS.Txtmonitor)
		
		override var items: [EvaluationItem] {
			return [
				blncon,
				blnPODI,
				Txtmonitor
			]
		}
	}
	
	class NIPPV: EvaluationItem {
		
		let txtRI = EvaluationItem(literal: HMS.txtRI)
		
		override var items: [EvaluationItem] {
			return [txtRI]
		}
	}
	
	
	override var items: [EvaluationItem] {
		return [
			txtdur,
			blnD1,
			blnD2,
			blnD3,
			//blnD4,
			//blnD5,
			//blnD6,
			blnHFPLVF,
			blnfoutpt,
			blnLVEF,
			blnCRTI,
			clinics,
			etiology,
			stageClass,
			arrthymias,
			homeTherapeutics,
			therapeutics
		]
	}
}


// MARK: - HMS -> EchocardiographyInHSM

class EchocardiographyInHSM: EvaluationItem {
	
	let blnLVeccenticity = EvaluationItem(literal: HMS.blnLVeccenticity)
	let blnMPI = EvaluationItem(literal: HMS.blnMPI)
	let blnEnlargedLA = EvaluationItem(literal: HMS.blnEnlargedLA)
	let txtMP = EvaluationItem(literal: HMS.txtMP)
	// Note: was commented in the source code.
	let txtEF = EvaluationItem(literal: HMS.txtEF)

	override var items: [EvaluationItem] {
		return [
			blnLVeccenticity,
			blnMPI,
			blnEnlargedLA,
			txtMP,
			// Note: txtEF was commented in the source code.
			txtEF
		]
	}
}


// MARK: - HMS -> LaboratoryEKG

class LaboratoryEKG: EvaluationItem {
	
	let txtGFR = EvaluationItem(literal: HMS.txtGFR)
	let txtcreatinine = EvaluationItem(literal: HMS.txtcreatinine)
	let txtNa = EvaluationItem(literal: HMS.txtNa)
	let txtHomo = EvaluationItem(literal: HMS.txtHomo)
	let txtplatelet = EvaluationItem(literal: HMS.txtplatelet)
	let txtalbumin = EvaluationItem(literal: HMS.txtalbumin)
	let txtPTINR = EvaluationItem(literal: HMS.txtPTINR)
	let txtAST = EvaluationItem(literal: HMS.txtAST)
	let txtBUN = EvaluationItem(literal: HMS.txtBUN)
	let txthematocrit = EvaluationItem(literal: HMS.txthematocrit)
	let txtBNP = EvaluationItem(literal: HMS.txtBNP)
	let blnEKG = LaboratoryEKGEKG(literal: HMS.blnEKG)
	
	override var items: [EvaluationItem] {
		return [
			txtGFR,
			txtcreatinine,
			txtNa,
			txtHomo,
			txtplatelet,
			txtalbumin,
			txtPTINR,
			txtAST,
			txtBUN,
			txthematocrit,
			txtBNP,
			blnEKG
		]
	}
}


// MARK: - HMS -> LaboratoryEKG -> Laboratory EKG

class LaboratoryEKGEKG: EvaluationItem {
	
	let txtQRS = EvaluationItem(literal: HMS.txtQRS)
	let blnLBBB = EvaluationItem(literal: HMS.blnLBBB)
	let blnLVH = EvaluationItem(literal: HMS.blnLVH)

	override var items: [EvaluationItem] {
		return [
			txtQRS,
			blnLBBB,
			blnLVH
		]
	}
}


// MARK: - HMS -> RHC

class RHCInHSM: EvaluationItem {
	
	let txtMPAP = EvaluationItem(literal: HMS.txtMPAP)
	let txtPVR = EvaluationItem(literal: HMS.txtPVR)
	let txtLVEDP = EvaluationItem(literal: HMS.txtLVEDP)
	let txtPCWP = EvaluationItem(literal: HMS.txtPCWP)
	let txtCI = EvaluationItem(literal: HMS.txtCI)
	let txtRAP = EvaluationItem(literal: HMS.txtRAP)
	let txtVWA = EvaluationItem(literal: HMS.txtVWA)
	let blnTotalVWA = EvaluationItem(literal: HMS.blnTotalVWA)
	let txtPADP = EvaluationItem(literal: HMS.txtPADP)
	let txtRVEDP = EvaluationItem(literal: HMS.txtRVEDP)

	override var items: [EvaluationItem] {
		return [
			txtMPAP,
			txtPVR,
			txtLVEDP,
			txtPCWP,
			txtCI,
			txtRAP,
			txtVWA,
			blnTotalVWA,
			txtPADP,
			txtRVEDP
		]
	}
}
