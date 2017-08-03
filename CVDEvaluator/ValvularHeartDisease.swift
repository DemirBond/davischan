//
//  ValvularHeartDisease.swift
//  CVDEvaluator
//
//  Created by bogdankosh on 2/6/17.
//  Copyright © 2017 IgorKhomiak. All rights reserved.
//

import Foundation

class ValvularHeartDisease: EvaluationItem {
	// TODO: Content is missing or unclear
	
	let newonsetAF = EvaluationItem(literal: Presentation.newonsetAF)
	let aorticStenosis = EvaluationItem(literal: Presentation.aorticStenosis)
	let secvalvular = EvaluationItem(literal: Presentation.secvalvular)
	let calcAortValve = EvaluationItem(literal: Presentation.calcAortValve)
	let reumaticAV = EvaluationItem(literal: Presentation.reumaticAV)
	let congenStenAortValve = EvaluationItem(literal: Presentation.congenStenAortValve)
	let calcAortValveArea  = EvaluationItem(literal: Presentation.calcAortValveArea )
	let aortMeanPressGradient = EvaluationItem(literal: Presentation.aortMeanPressGradient)
	let aortRootDiameter = EvaluationItem(literal: Presentation.aortRootDiameter)
	
	let mitralStenosis = EvaluationItem(literal: Presentation.mitralStenosis)
	let mVA = EvaluationItem(literal: Presentation.mVA)
	let pHT = EvaluationItem(literal: Presentation.pHT)
	let rheumaticMV = EvaluationItem(literal: Presentation.rheumaticMV)
	let favValveMorph = EvaluationItem(literal: Presentation.favValveMorph )
	let lAClot = EvaluationItem(literal: Presentation.lAClot)
	let pulmonicStenosis  = EvaluationItem(literal: Presentation.pulmonicStenosis)
	let tricuspidStenosis = EvaluationItem(literal: Presentation.tricuspidStenosis)
	let pulValveVel = EvaluationItem(literal: Presentation.pulValveVel)
	let aorticRegurgitation = EvaluationItem(literal: Presentation.aorticRegurgitation)
	let holodiastolicRev = EvaluationItem(literal: Presentation.holodiastolicRev)
	let venaContractaWidth2 = EvaluationItem(literal: Presentation.venaContractaWidth2)
	let venaContractaWidth = EvaluationItem(literal: Presentation.venaContractaWidth)
	let regurVolume = EvaluationItem(literal: Presentation.regurVolume)
	let regurFrac = EvaluationItem(literal: Presentation.regurFrac)
	let eRO  = EvaluationItem(literal: Presentation.eRO)
	let lVESd = EvaluationItem(literal: Presentation.lVESd)
	let lVEDd = EvaluationItem(literal: Presentation.lVEDd)
	
	
	let aorticRootDiameter = EvaluationItem(literal: Presentation.aorticRootDiameter)
	let mitralRegurgitation = EvaluationItem(literal: Presentation.mitralRegurgitation)
	let tricuspidRegurgitation = EvaluationItem(literal: Presentation.tricuspidRegurgitation)
	let annularDiameter = EvaluationItem(literal: Presentation.annularDiameter)
	let centralJetArea = EvaluationItem(literal: Presentation.centralJetArea)
	let hepaticVeinFlowRev = EvaluationItem(literal: Presentation.hepaticVeinFlowRev)
	let abTVleaflet  = EvaluationItem(literal: Presentation.abTVleaflet)
	let pulmonicRegurgitation = EvaluationItem(literal: Presentation.pulmonicRegurgitation)
	let wideRegurJet = EvaluationItem(literal: Presentation.wideRegurJet)
	let abnpulval = EvaluationItem(literal: Presentation.abnpulval)
	let valvular_surgery_risk = EvaluationItem(literal: Presentation.valvular_surgery_risk)
	let vavularRiskLabel = EvaluationItem(literal: Presentation.vavularRiskLabel)
	let lowrisk = EvaluationItem(literal: Presentation.lowrisk)
	let intermediaterisk = EvaluationItem(literal: Presentation.intermediaterisk)
	let highrisk = EvaluationItem(literal: Presentation.highrisk)
	let prohibitive  = EvaluationItem(literal: Presentation.prohibitive)
	let other_surgical_risk = EvaluationItem(literal: Presentation.other_surgical_risk)
	let sep = EvaluationItem(literal: Presentation.separator)
	let vascular  = EvaluationItem(literal: Presentation.vascular)
	let lowriskelec = EvaluationItem(literal: Presentation.lowriskelec)
	let cardiac  = EvaluationItem(literal: Presentation.cardiac)
	
	/*
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
	
	
*/
	
	override var items: [EvaluationItem] {
		return [
			newonsetAF,
			aorticStenosis,
			secvalvular,
			calcAortValve,
			reumaticAV,
			congenStenAortValve,
			calcAortValveArea,
			aortMeanPressGradient,
			aortRootDiameter,
			mitralStenosis,
			mVA,
			pHT,
			rheumaticMV,
			favValveMorph,
			lAClot,
			pulmonicStenosis,
			tricuspidStenosis,
			pulValveVel,
			aorticRegurgitation,
			holodiastolicRev,
			venaContractaWidth2,
			venaContractaWidth,
			regurVolume,
			regurFrac,
			eRO,
			lVESd,
			lVEDd,
		
			aorticRootDiameter,
			mitralRegurgitation,
			tricuspidRegurgitation,
			annularDiameter,
			centralJetArea,
		   hepaticVeinFlowRev,
			abTVleaflet,
			pulmonicRegurgitation,
			wideRegurJet,
			abnpulval,
			valvular_surgery_risk,
			vavularRiskLabel,
			lowrisk,
			intermediaterisk,
			highrisk,
			prohibitive,
			other_surgical_risk,
			sep,
			vascular,
			lowriskelec,
			cardiac
		]
	}
	
}
