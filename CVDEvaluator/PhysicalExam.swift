//
//  PhysicalExam.swift
//  CVDEvaluator
//
//  Created by bogdankosh on 2/13/17.
//  Copyright © 2017 IgorKhomiak. All rights reserved.
//

import Foundation

class PhysicalExam: EvaluationItem {
	
	let hepatojulularRefluxInPhysicalExam = EvaluationItem(literal: Presentation.hepatojulularRefluxInPhysicalExam)
	let jugularVenousDistentionInPhysicalExam = EvaluationItem(literal: Presentation.jugularVenousDistentionInPhysicalExam)
	let bruitInPhysicalExam = EvaluationItem(literal: Presentation.bruitInPhysicalExam)
	let displacedPMIInPhysicalExam = EvaluationItem(literal: Presentation.displacedPMIInPhysicalExam)
	let leftSidedS3S4Gallop = EvaluationItem(literal: Presentation.leftSidedS3S4Gallop)
	let leftSidedS4Gallop = EvaluationItem(literal: Presentation.leftSidedS4Gallop)
	let frictionRubInPhysicalExam = EvaluationItem(literal: Presentation.frictionRubInPhysicalExam)
	let distantInPhysicalExam = EvaluationItem(literal: Presentation.distantInPhysicalExam)
	let heartMurmurInPhysicalExam = HeartMurmurInPhysicalExam(literal: Presentation.heartMurmurInPhysicalExam)
	let newRalesInPhysicalExam = EvaluationItem(literal: Presentation.newRalesInPhysicalExam)
	let pulmonaryEdemaInPhysicalExam = EvaluationItem(literal: Presentation.pulmonaryEdemaInPhysicalExam)
	
	let rhonchiInPhysicalExam = EvaluationItem(literal: Presentation.rhonchiInPhysicalExam)
	let thoraxInPhysicalExam = EvaluationItem(literal: Presentation.thoraxInPhysicalExam)
	let percussionInPhysicalExam = EvaluationItem(literal: Presentation.percussionInPhysicalExam)
	
	let diminishedBreathSoundsInPhysicalExam = EvaluationItem(literal: Presentation.diminishedBreathSoundsInPhysicalExam)
	let abdominalTendernessInPhysicalExam = EvaluationItem(literal: Presentation.abdominalTendernessInPhysicalExam)
	let anyCNSSymptomsInPhysicalExam = EvaluationItem(literal: Presentation.anyCNSSymptomsInPhysicalExam)
	let coldClammyExtremitiesInPhysicalExam = EvaluationItem(literal: Presentation.coldClammyExtremitiesInPhysicalExam)
	let edemaInPhysicalExam = EvaluationItem(literal: Presentation.edemaInPhysicalExam)
	let differenceinSBPInPhysicalExam = EvaluationItem(literal: Presentation.differenceinSBPInPhysicalExam)
	let neckveins = EvaluationItem(literal: Presentation.neckveins)
	let ascitesInPhysicalExam = EvaluationItem(literal: Presentation.ascitesInPhysicalExam)
	/*
	let weaknessInPhysicalExam = EvaluationItem(literal: Presentation.weaknessInPhysicalExam)
	//let abdominalPainInPhysicalExam = EvaluationItem(literal: Presentation.abdominalPainInPhysicalExam)
	let abdominalPainInPhysicalExam = AbdominalPainInPhysicalExam(literal: Presentation.abdominalPainInPhysicalExam)
	//AbdominalPainInPhysicalExam
	//let associatedFindingsInPhysicalExam = EvaluationItem(literal: Presentation.associatedFindingsInPhysicalExam)
	//let associatedSymptomsInPhysicalExam = EvaluationItem(literal: Presentation.associatedSymptomsInPhysicalExam)
	let associatedFindingsInPhysicalExam = FindingsInPhysicalExam(literal: Presentation.associatedFindingsInPhysicalExam)
	let associatedSymptomsInPhysicalExam = SymptomsInPhysicalExam(literal: Presentation.associatedSymptomsInPhysicalExam)
	
	let palpitationsInPhysicalExam = PalpitationsInPhysicalExam(literal: Presentation.palpitationsInPhysicalExam )
	//"#id:chkp| #title:Section Palpitations| #type:#disclosureControl"
	let shockInPhysicalExam = ShockInPhysicalExam(literal: Presentation.shockInPhysicalExam)
	//"#id:chkss | #title:Section Shock | #type:#disclosureControl"
	let cyanosisInPhysicalExam = SectionCyanosis(literal: Presentation.cyanosisInPhysicalExam)
	//"#id:chkscy | #title:Sectioncyanosis | #type:#disclosureControl"
	*/
	
	override var items: [EvaluationItem] {
		return [
			neckveins,
			hepatojulularRefluxInPhysicalExam,
			jugularVenousDistentionInPhysicalExam,
			bruitInPhysicalExam,
			displacedPMIInPhysicalExam,
			leftSidedS3S4Gallop,
			leftSidedS4Gallop,
			frictionRubInPhysicalExam,
			distantInPhysicalExam,
			heartMurmurInPhysicalExam,
			newRalesInPhysicalExam,
			pulmonaryEdemaInPhysicalExam,
			
			rhonchiInPhysicalExam,
		   thoraxInPhysicalExam,
		   percussionInPhysicalExam,
			
			diminishedBreathSoundsInPhysicalExam,
			abdominalTendernessInPhysicalExam,
			ascitesInPhysicalExam,
			anyCNSSymptomsInPhysicalExam,
			coldClammyExtremitiesInPhysicalExam,
			edemaInPhysicalExam,
			
			differenceinSBPInPhysicalExam,
			/*
			weaknessInPhysicalExam,
			abdominalPainInPhysicalExam,
			associatedFindingsInPhysicalExam,
			associatedSymptomsInPhysicalExam,
			
			palpitationsInPhysicalExam,
			shockInPhysicalExam,
			cyanosisInPhysicalExam
			*/
		]
	}
}

class HeartMurmurInPhysicalExam: EvaluationItem {
	let abnormalAuscultationLabel = EvaluationItem(literal: Presentation.abnormalAuscultationLabel)
	let s1Mitral = S1Mitral(literal: Presentation.s1Mitral)
	let s2Aortic = S2Aortic(literal: Presentation.s2Aortic)
	let p2Pulmonic = P2Pulmonic(literal: Presentation.p2Pulmonic)
	let s1Tricuspid = S1Tricuspid(literal: Presentation.s1Tricuspid)
	let murmur = Murmur(literal: Presentation.murmur)
//	let systolicMurmur = SystolicMurmur(literal: Presentation.systolicMurmur)
//	let diastolicMurmur = DiastolicMurmur(literal: Presentation.diastolicMurmur)
	
	override var items: [EvaluationItem] {
		return [
			abnormalAuscultationLabel,
			s1Mitral,
			s2Aortic,
			p2Pulmonic,
			s1Tricuspid,
			murmur
		]
	}
	
	class S1Mitral: EvaluationItem {
		let blnS1MitralLoud = EvaluationItem(literal: Presentation.blnS1MitralLoud)
		let blnS1MitralNormal = EvaluationItem(literal: Presentation.blnS1MitralNormal)
		let blnS1MitralSoft = EvaluationItem(literal: Presentation.blnS1MitralSoft)
		
		override var items: [EvaluationItem] {
			return [
				blnS1MitralLoud,
				blnS1MitralNormal,
				blnS1MitralSoft
			]
		}
	}
	
	class S2Aortic: EvaluationItem {
		let blnS2AorticLoud = EvaluationItem(literal: Presentation.blnS2AorticLoud)
		let blnS2AorticNormal = EvaluationItem(literal: Presentation.blnS2AorticNormal)
		let blnS2AorticSoft = EvaluationItem(literal: Presentation.blnS2AorticSoft)
		
		override var items: [EvaluationItem] {
			return [
				blnS2AorticLoud,
				blnS2AorticNormal,
				blnS2AorticSoft
			]
		}
	}
	
	class P2Pulmonic: EvaluationItem {
		let blnP2PulmonicLoud = EvaluationItem(literal: Presentation.blnP2PulmonicLoud)
		let blnP2PulmonicNormal = EvaluationItem(literal: Presentation.blnP2PulmonicNormal)
		let blnP2PulmonicSoft = EvaluationItem(literal: Presentation.blnP2PulmonicSoft)
		
		override var items: [EvaluationItem] {
			return [
				blnP2PulmonicLoud,
				blnP2PulmonicNormal,
				blnP2PulmonicSoft
			]
		}

	}
	class S1Tricuspid: EvaluationItem {
		let blnP2TricuspidLoud = EvaluationItem(literal: Presentation.blnP2TricuspidLoud)
		let blnP2TricuspidNormal = EvaluationItem(literal: Presentation.blnP2TricuspidNormal)
		let blnP2TricuspidSoft = EvaluationItem(literal: Presentation.blnP2TricuspidSoft)
		
		override var items: [EvaluationItem] {
			return [
				blnP2TricuspidLoud,
				blnP2TricuspidNormal,
				blnP2TricuspidSoft
			]
		}
	}
	
	class Murmur: EvaluationItem {
		let systolicMurmur = SystolicMurmur(literal: Presentation.systolicMurmur)
		let diastolicMurmur = DiastolicMurmur(literal: Presentation.diastolicMurmur)
		
		override var items: [EvaluationItem] {
			return [systolicMurmur, diastolicMurmur]
		}
	}
	
	class SystolicMurmur: EvaluationItem {
		let blnCresDecres = CrescendoDecrescendo(literal: Presentation.blnCresDecres)
		let blnPlateuShaped = PlateuShaped(literal: Presentation.blnPlateuShaped)
		let blnsquat = EvaluationItem(literal: Presentation.blnsquat)
		let blnejectionsound = EvaluationItem(literal: Presentation.blnejectionsound)
		let blnsystolicclick = EvaluationItem(literal: Presentation.blnsystolicclick)
		
		override var items: [EvaluationItem] {
			return [
				blnCresDecres,
				blnPlateuShaped,
				blnsquat,
				blnejectionsound,
				blnsystolicclick
			]
		}
	}
	
	class CrescendoDecrescendo: EvaluationItem {
		let blnEarlyMidSysPeak = EvaluationItem(literal: Presentation.blnEarlyMidSysPeak)
		let blnLateSysPeak = EvaluationItem(literal: Presentation.blnLateSysPeak)
		
		override var items: [EvaluationItem] {
			return [
				blnEarlyMidSysPeak,
				blnLateSysPeak
			]
		}
	}
	
	class PlateuShaped: EvaluationItem {
		let blnHalosystolic = EvaluationItem(literal: Presentation.blnHalosystolic)
		let blnPansystolic = EvaluationItem(literal: Presentation.blnPansystolic)
		let blnMidsystolic = EvaluationItem(literal: Presentation.blnMidsystolic)
		
		override var items: [EvaluationItem] {
			return [
				blnHalosystolic,
				blnPansystolic,
				blnMidsystolic
			]
		}

	}
	
	class DiastolicMurmur: EvaluationItem {
		let blnDescrescendo = EvaluationItem(literal: Presentation.blnDescrescendo)
		let blnRumble = EvaluationItem(literal: Presentation.blnRumble)
		let mitralOpeningSnap = EvaluationItem(literal: Presentation.mitralOpeningSnap)

		
		override var items: [EvaluationItem] {
			return [
				blnDescrescendo,
				blnRumble,
				mitralOpeningSnap
			]
		}
	}
}

class EdemaInPhysicalExam: EvaluationItem {

	let localizedEdema = EvaluationItem(literal: Presentation.localizedEdema)
	let diffuseEdema = EvaluationItem(literal: Presentation.diffuseEdema)
	let separator1 = EvaluationItem(literal: Presentation.separator)
	let pittingEdema = EvaluationItem(literal: Presentation.pittingEdema)
	let nonpittingEdema = EvaluationItem(literal: Presentation.nonpittingEdema)
	
	override var items: [EvaluationItem] {
		return [
			pittingEdema,
			nonpittingEdema,
			separator1,
			localizedEdema,
			diffuseEdema
		]
	}
	
}

class AbdominalPainInPhysicalExam: EvaluationItem {
	
	//let typeAbdominalPain = EvaluationItem(literal: Presentation.typeAbdominalPain)
	//let locationAbdominalPain = EvaluationItem(literal: Presentation.locationAbdominalPain)
	let typeAbdominalPain = TypeAbdominalPain(literal: Presentation.typeAbdominalPain)
	let locationAbdominalPain = LocationAbdominalPain(literal: Presentation.locationAbdominalPain)
	
	
	override var items: [EvaluationItem] {
		return [
			typeAbdominalPain,
			locationAbdominalPain
		]
	}
	
	class TypeAbdominalPain: EvaluationItem {
		let sharpTypeAbdominalPain = EvaluationItem(literal: Presentation.sharpTypeAbdominalPain)
		let colickyTypeAbdominalPain = EvaluationItem(literal: Presentation.colickyTypeAbdominalPain)
		let achingTypeAbdominalPain = EvaluationItem(literal: Presentation.achingTypeAbdominalPain)
		
		override var items: [EvaluationItem] {
			return [
				sharpTypeAbdominalPain,
			   colickyTypeAbdominalPain,
			   achingTypeAbdominalPain
			]
		}
	}
	

	class LocationAbdominalPain: EvaluationItem {
		let locLocationAbdominalPain = EvaluationItem(literal: Presentation.locLocationAbdominalPain)
		let diffuseLocationAbdominalPain = EvaluationItem(literal: Presentation.diffuseLocationAbdominalPain)
		let epigastricFindAbdominalPain = EvaluationItem(literal: Presentation.epigastricFindAbdominalPain)
		let periumbilicalLocationAbdominalPain = EvaluationItem(literal: Presentation.periumbilicalLocationAbdominalPain)
		let suprapubicEdemaLocationAbdominalPain = EvaluationItem(literal: Presentation.suprapubicEdemaLocationAbdominalPain)
		let shoulderAbdominalPain = EvaluationItem(literal: Presentation.shoulderAbdominalPain)
		
		override var items: [EvaluationItem] {
			return [
				locLocationAbdominalPain,
				diffuseLocationAbdominalPain,
				epigastricFindAbdominalPain,
				periumbilicalLocationAbdominalPain,
				suprapubicEdemaLocationAbdominalPain,
				shoulderAbdominalPain
			]
		}
	}
	
}

class FindingsInPhysicalExam: EvaluationItem {
	
	let abdominalFindings = EvaluationItem(literal: Presentation.abdominalFindings)
	let reboundFindings = EvaluationItem(literal: Presentation.reboundFindings)
	let pulsatileFindings = EvaluationItem(literal: Presentation.pulsatileFindings)
	let bowelFindings = EvaluationItem(literal: Presentation.bowelFindings)
	let psoasFindings = EvaluationItem(literal: Presentation.psoasFindings)
	let mcburneyFindings = EvaluationItem(literal: Presentation.mcburneyFindings)
	let rovsingsignFindings = EvaluationItem(literal: Presentation.rovsingsignFindings)
	let murphysignFindings = EvaluationItem(literal: Presentation.murphysignFindings)
	let obturatorFindings = EvaluationItem(literal: Presentation.obturatorFindings)
	let carnettsignFindings = EvaluationItem(literal: Presentation.carnettsignFindings)
	let costovertebralFindings = EvaluationItem(literal: Presentation.costovertebralFindings)
	let skinfindingsFindings = SkinAbdominalPain(literal: Presentation.skinfindingsFindings)
	//let skinfindingsFindings = EvaluationItem(literal: Presentation.skinfindingsFindings)
	
	override var items: [EvaluationItem] {
		return [
			abdominalFindings,
			reboundFindings,
			pulsatileFindings,
			bowelFindings,
			psoasFindings,
			mcburneyFindings,
			rovsingsignFindings,
			murphysignFindings,
			obturatorFindings,
			carnettsignFindings,
			costovertebralFindings,
			skinfindingsFindings
		]
	}
	
	class SkinAbdominalPain: EvaluationItem {
		
		let wallSkinFindings = EvaluationItem(literal: Presentation.wallSkinFindings)
		let herpesSkinFindings = EvaluationItem(literal: Presentation.herpesSkinFindings)
		let rashSkinFindings = EvaluationItem(literal: Presentation.rashSkinFindings)
		let celulitisSkinFindings = EvaluationItem(literal: Presentation.celulitisSkinFindings)
		let jaundiceSkinFindings = EvaluationItem(literal: Presentation.jaundiceSkinFindings)
		let caoutmedusaSkinFindings = EvaluationItem(literal: Presentation.caoutmedusaSkinFindings)
		
		
		
		override var items: [EvaluationItem] {
			return [
				wallSkinFindings,
				herpesSkinFindings,
				rashSkinFindings,
			   celulitisSkinFindings,
			   jaundiceSkinFindings,
			   caoutmedusaSkinFindings
			]
		}
		
	}
 
}

class SymptomsInPhysicalExam: EvaluationItem {
	
	let vomitingSymptoms = VomitAbdominalPain(literal: Presentation.vomitingSymptoms)
	//let vomitingSymptoms = EvaluationItem(literal: Presentation.vomitingSymptoms)
	let anorexiaSymptoms = EvaluationItem(literal: Presentation.anorexiaSymptoms)
	let bowelHabitSymptoms = EvaluationItem(literal: Presentation.bowelHabitSymptoms)
	let operativeSymptoms = EvaluationItem(literal: Presentation.operativeSymptoms)
	let familyhistorySymptoms = EvaluationItem(literal: Presentation.familyhistorySymptoms)
	let hematuriaSymptoms = EvaluationItem(literal: Presentation.hematuriaSymptoms)
	let urinarySymptoms = EvaluationItem(literal: Presentation.urinarySymptoms)
	let obgynSymptoms = EvaluationItem(literal: Presentation.obgynSymptoms)
	
	override var items: [EvaluationItem] {
		return [
			vomitingSymptoms,
			anorexiaSymptoms,
			bowelHabitSymptoms,
			operativeSymptoms,
			familyhistorySymptoms,
			hematuriaSymptoms,
			urinarySymptoms,
			obgynSymptoms
		]
	}
	
	class VomitAbdominalPain: EvaluationItem {
		
		let vomitingVomitSymptoms = EvaluationItem(literal: Presentation.vomitingVomitSymptoms)
		let abdominalVomitSymptoms = EvaluationItem(literal: Presentation.abdominalVomitSymptoms)
		
		override var items: [EvaluationItem] {
			return [
				vomitingVomitSymptoms,
				abdominalVomitSymptoms
			]
		}
		
	}
	
}


class PalpitationsInPhysicalExam: EvaluationItem {
	
	let frequencyPalpitations = FrequencyPalpitations(literal: Presentation.frequencyPalpitations)
	let typePalpitations = TypePalpitations(literal: Presentation.typePalpitations)
	let durationPalpitations = DurationPalpitations(literal: Presentation.durationPalpitations)
	let syncopePalpitations = SyncopePalpitations(literal: Presentation.syncopePalpitations)
	let ekgPalpitations = EKGPalpitations(literal: Presentation.ekgPalpitations)
	let onsetPalpitations = OnsetPalpitations(literal: Presentation.onsetPalpitations)
	
	override var items: [EvaluationItem] {
		return [
			frequencyPalpitations,
			typePalpitations,
			durationPalpitations,
			syncopePalpitations,
			ekgPalpitations,
			onsetPalpitations
		]
	}
	
	class FrequencyPalpitations: EvaluationItem {
		
		let dailyFreqPalpitations = EvaluationItem(literal: Presentation.dailyFreqPalpitations)
		let weeklyFreqPalpitations = EvaluationItem(literal: Presentation.weeklyFreqPalpitations)
		let monthlyFreqPalpitations = EvaluationItem(literal: Presentation.monthlyFreqPalpitations)
		let yearlyFreqPalpitations = EvaluationItem(literal: Presentation.yearlyFreqPalpitations)
		
		override var items: [EvaluationItem] {
			return [
				dailyFreqPalpitations,
				weeklyFreqPalpitations,
				monthlyFreqPalpitations,
				yearlyFreqPalpitations
			]
		}
		
	}
	
	class TypePalpitations: EvaluationItem {
		
		let extrasystolicTypePalpitations = EvaluationItem(literal: Presentation.extrasystolicTypePalpitations)
		let tachycardicTypePalpitations = TachycardicPalpitations(literal: Presentation.tachycardicTypePalpitations)
		let anxietyTypePalpitations = EvaluationItem(literal: Presentation.anxietyTypePalpitations)
		let pulsationTypePalpitations = EvaluationItem(literal: Presentation.pulsationTypePalpitations)
		
		override var items: [EvaluationItem] {
			return [
				extrasystolicTypePalpitations,
				tachycardicTypePalpitations,
				anxietyTypePalpitations,
				pulsationTypePalpitations
			]
		}
		
		class TachycardicPalpitations: EvaluationItem {
			
			let abruptTachycardicTypePalpitations = EvaluationItem(literal: Presentation.abruptTachycardicTypePalpitations)
			let gradualTachycardicTypePalpitations = EvaluationItem(literal: Presentation.gradualTachycardicTypePalpitations)
			let noresponseTachycardicTypePalpitations = EvaluationItem(literal: Presentation.noresponseTachycardicTypePalpitations)
			
			override var items: [EvaluationItem] {
				return [
					abruptTachycardicTypePalpitations,
					gradualTachycardicTypePalpitations,
					noresponseTachycardicTypePalpitations
				]
			}
		}
		
	}
	
	class DurationPalpitations: EvaluationItem {
		
		let secondsDurationPalpitations = EvaluationItem(literal: Presentation.secondsDurationPalpitations)
		let minutesDurationPalpitations = EvaluationItem(literal: Presentation.minutesDurationPalpitations)
		let hoursDurationPalpitations = EvaluationItem(literal: Presentation.hoursDurationPalpitations)
		
		override var items: [EvaluationItem] {
			return [
				secondsDurationPalpitations,
				minutesDurationPalpitations,
				hoursDurationPalpitations
			]
		}
		
	}
	
	class SyncopePalpitations: EvaluationItem {
		
		let palSyncopePalpitations = EvaluationItem(literal: Presentation.palSyncopePalpitations)
		let anginaSyncopePalpitations = EvaluationItem(literal: Presentation.anginaSyncopePalpitations)
		let pulsationsSyncopePalpitations = EvaluationItem(literal: Presentation.pulsationsSyncopePalpitations)
		let polyuriaSyncopePalpitations = EvaluationItem(literal: Presentation.polyuriaSyncopePalpitations)
		
		
		override var items: [EvaluationItem] {
			return [
				palSyncopePalpitations,
				anginaSyncopePalpitations,
				pulsationsSyncopePalpitations,
				polyuriaSyncopePalpitations
			]
			
		}
		
	}
	
	class EKGPalpitations: EvaluationItem {
		
		let nsrEkgPalpitations = EvaluationItem(literal: Presentation.nsrEkgPalpitations)
		let regularEkgPalpitations = EvaluationItem(literal: Presentation.regularEkgPalpitations)
		let irregularEkgPalpitations = EvaluationItem(literal: Presentation.irregularEkgPalpitations)
		
		override var items: [EvaluationItem] {
			return [
				nsrEkgPalpitations,
				regularEkgPalpitations,
				irregularEkgPalpitations
			]
		}

	}
	
	class OnsetPalpitations: EvaluationItem {
		
		let suddenOnsetPalpitations = EvaluationItem(literal: Presentation.suddenOnsetPalpitations)
		let positionOnsetPalpitations = EvaluationItem(literal: Presentation.positionOnsetPalpitations)
		let exertionOnsetPalpitations = EvaluationItem(literal: Presentation.exertionOnsetPalpitations)
		let postexertionOnsetPalpitations = EvaluationItem(literal: Presentation.postexertionOnsetPalpitations)
		
		
		override var items: [EvaluationItem] {
			return [
				suddenOnsetPalpitations,
				positionOnsetPalpitations,
				exertionOnsetPalpitations,
				postexertionOnsetPalpitations
			]
		}
	}
	
}

class ShockInPhysicalExam: EvaluationItem {
	let hypovolemiaSectionShock = EvaluationItem(literal: Presentation.hypovolemiaSectionShock)
	let infectiousSectionShock = EvaluationItem(literal: Presentation.infectiousSectionShock)
	let spinalcordSectionShock = EvaluationItem(literal: Presentation.spinalcordSectionShock)
	let allergenSectionShock = EvaluationItem(literal: Presentation.allergenSectionShock)
	let pharmacologicSectionShock = EvaluationItem(literal: Presentation.pharmacologicSectionShock)
	
	override var items: [EvaluationItem] {
		return [
			hypovolemiaSectionShock,
			infectiousSectionShock,
			spinalcordSectionShock,
			allergenSectionShock,
			pharmacologicSectionShock
		]
	}
}

class SectionCyanosis: EvaluationItem {
	let centralSectioncyanosis = EvaluationItem(literal: Presentation.centralSectioncyanosis)
	let peripheralSectioncyanosis = EvaluationItem(literal: Presentation.peripheralSectioncyanosis)
	
	override var items: [EvaluationItem] {
		return [
			centralSectioncyanosis,
			peripheralSectioncyanosis
		]
	}
	
}

