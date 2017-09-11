//
//  AboutController.swift
//  CVDEvaluator
//
//  Created by IgorKhomiak on 2/7/17.
//  Copyright © 2017 IgorKhomiak. All rights reserved.
//

import UIKit
import MessageUI


class AboutController: BaseTableController, MFMailComposeViewControllerDelegate {
	
	override var createdID: String! { return "about" }
	
	
	required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
		
		self.pageForm = About(literal: General.about)
	}
	
	
	override func viewDidLoad() {
		super.viewDidLoad()
	}
	
	
	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)

		self.navigationController?.setToolbarHidden(false, animated: false)
		
	}
	
	

	// MARK: - Table view data source
	
	override func numberOfSections(in tableView: UITableView) -> Int {
		return 1
	}
	
	
	override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return pageForm.items.count
	}
	
	
	
	// MARK: - Table view delegates
	
	override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		
		let itemModel = pageForm.items[indexPath.row]
		
		let cellType = itemModel.form.itemType
		let cell = tableView.dequeueReusableCell(withIdentifier: cellType.reuseIdentifier(), for: indexPath) as! GeneratedCell
		cell.accessoryBar = self.accessoryBar
		cell.delegate = self
		cell.cellModel = itemModel
		cell.selectionStyle = (cellType == .separator) ? .none : .gray
		
		if cell.cellModel.identifier == "version" {
			cell.subtitleLabel?.text = appVersion()!
			cell.accessoryBar = nil
			cell.selectionStyle = .none
		}
		
		return cell
	}

	
	override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		
		let storyboard = UIStoryboard(name: "Medical", bundle: nil)
		
		let aboutModel = pageForm as! About
		let itemModel = aboutModel.items[indexPath.row]
		
		switch itemModel.identifier {
			
//			case aboutModel.rateApp.identifier:
//				let controller = storyboard.instantiateViewController(withIdentifier: "RateControllerID") as! BaseTableController
//				controller.pageForm = itemModel
//				self.navigationController?.pushViewController(controller, animated: true)
//			
//			case aboutModel.writeAReview.identifier:
//				sendEmail(recipient: "cvmedicalsoftware@gmail.com",subject: "App Rating")
			
			case aboutModel.privacyPolicy.identifier :
				let controller = storyboard.instantiateViewController(withIdentifier: "PoliciesControllerID") as! PoliciesController
				controller.pageForm = itemModel
				self.navigationController?.pushViewController(controller, animated: true)
			
			case aboutModel.termsOfUse.identifier :
				let controller = storyboard.instantiateViewController(withIdentifier: "TermsControllerID") as! TermsController
				controller.pageForm = itemModel
				self.navigationController?.pushViewController(controller, animated: true)
			
			case aboutModel.helpSupport.identifier :
				let controller = storyboard.instantiateViewController(withIdentifier: "HelpSupportControllerID") as! HelpSupportController
				controller.pageForm = itemModel
				self.navigationController?.pushViewController(controller, animated: true)

			default:
				()
		}
	}
	
	
	override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
		let itemModel = pageForm.items[indexPath.row]
		return itemModel.calculateCellHeight(forWidth: self.view.frame.size.width)
	}

	
	fileprivate func appVersion() -> String? {
		guard let appVersion = Bundle.main.object(forInfoDictionaryKey:
			"CFBundleShortVersionString") as? String else { return nil }
		
		if let build = Bundle.main.object(forInfoDictionaryKey:
			"CFBundleVersion") {
			return appVersion + " (\(build))"
		}
		else {
			return appVersion
		}
	}
	
	
	func sendEmail(recipient: String, subject: String) {
		if MFMailComposeViewController.canSendMail() {
			let mail = MFMailComposeViewController()
			mail.mailComposeDelegate = self
			mail.setToRecipients([recipient])
			mail.setSubject(subject)
			
			present(mail, animated: true)
			
		} else {
			// show failure alert
		}
	}
	
	
	func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
		controller.dismiss(animated: true)
	}
	
	
	/*
	// MARK: - Navigation
	
	// In a storyboard-based application, you will often want to do a little preparation before navigation
	override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
	// Get the new view controller using segue.destinationViewController.
	// Pass the selected object to the new view controller.
	}
	*/
	
}
