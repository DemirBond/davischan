//
//  HelpSupportController.swift
//  CVDEvaluator
//
//  Created by IgorKhomiak on 3/16/17.
//  Copyright © 2017 IgorKhomiak. All rights reserved.
//

import UIKit
import MessageUI


class HelpSupportController: BaseTableController, MFMailComposeViewControllerDelegate {

	
    override func viewDidLoad() {
        super.viewDidLoad()
		self.navigationController?.setToolbarHidden(true, animated: false)
		self.title = self.pageForm.title
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
	
	
	
	// MARK: - MFMailComposeViewController delegate
	
	func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
		controller.dismiss(animated: true)
	}
	
	
	
	// MARK: - Table view data source
	
	override func numberOfSections(in tableView: UITableView) -> Int {
		return 1
	}
	
	
	override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return self.pageForm.items.count
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
		
		return cell
	}
	
	
	override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		
		let settingsModel = pageForm as! Support
		let itemModel = settingsModel.items[indexPath.row]
		
		switch itemModel.identifier {
			
			case settingsModel.medical.identifier :
				sendEmail(recipient: "cvmedicalsoftware@gmail.com", subject: "Medical support" )
			
			case settingsModel.developer.identifier :
				sendEmail(recipient: "cvmedicalsoftware@gmail.com", subject: "Technical support" )
			
			default:
				()
			
		}
		
		hideKeyboard()
	}
	
}
