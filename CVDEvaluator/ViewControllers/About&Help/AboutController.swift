//
//  
//  CVDEvaluator
//
//  Created by IgorKhomiak on 2/2/17.
//  Copyright © 2017 IgorKhomiak. All rights reserved.
//

import UIKit
import MessageUI


class AboutCell: GeneratedCell {}


class AboutController: BaseTableController, MFMailComposeViewControllerDelegate {
	
	override var createdID: String? { return "about" }
	
	required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
		self.pageForm = AboutPage(literal: General.aboutPage)
	}

	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		self.title = pageForm.title
		self.navigationController?.setToolbarHidden(false, animated: false)
		
		let bottomSelectors: [Selector?] = [nil, nil, #selector(self.bottomLeftButtonAction(_:)), nil]
		
		let dictInfo = ["leftBottom": "Aa"]
		let toolbar = CVDToolbar()
		toolbar.setup(dict: dictInfo, target: self, actions: bottomSelectors )
		self.toolbarItems = toolbar.barItems
	}
	
	
	// MARK: - Table view data source
	
	override func numberOfSections(in tableView: UITableView) -> Int {
		return 1
	}
	
	override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return pageForm.items.count
	}
	
	override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		
		let color = UIColor.init(hexString: "#E5E5E5")?.cgColor
		let borderWidth = CGFloat(0.5)
		
		
		switch indexPath.row {
			
		case 0:
			let cell = tableView.dequeueReusableCell(withIdentifier: "DisclosureSimpleCellNoArrow") as! GeneratedCell
			cell.layer.borderWidth = borderWidth
			cell.layer.borderColor = color
			
			let itemModel = pageForm.items[indexPath.row]
			
			cell.accessoryBar = nil
			cell.delegate = self
			cell.cellModel = itemModel
			cell.selectionStyle = .none

			if cell.cellModel.identifier == "version" {
				cell.subtitleLabel?.text = appVersion()!
			}
			
			return cell
			
		case 1:
			let cell = tableView.dequeueReusableCell(withIdentifier: "AboutCell") as! GeneratedCell
			cell.layer.borderWidth = borderWidth
			cell.layer.borderColor = color
			
			let itemModel = pageForm.items[indexPath.row]
			
			cell.accessoryBar = self.accessoryBar
			cell.delegate = self
			cell.cellModel = itemModel
			cell.selectionStyle = .none
			
			return cell

			
		case 2, 3:
			let cell = tableView.dequeueReusableCell(withIdentifier: "DisclosureSimpleCell") as! GeneratedCell
			cell.layer.borderWidth = borderWidth
			cell.layer.borderColor = color
			
			let itemModel = pageForm.items[indexPath.row]
			
			cell.accessoryBar = self.accessoryBar
			cell.delegate = self
			cell.cellModel = itemModel
			cell.selectionStyle = .gray
			
			return cell

			
		default:
			return UITableViewCell()
		}
	}
	
	
	override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
		if indexPath.row == 1 {
			return 200.0
		} else {
			return 50.0
		}
	}
	
	
	override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		
		let storyboard = UIStoryboard(name: "Medical", bundle: nil)
		
		let settingsModel = pageForm as! AboutPage
		let itemModel = settingsModel.items[indexPath.row]
		switch itemModel.identifier {
			
		case settingsModel.rateApp.identifier:
			let controller = storyboard.instantiateViewController(withIdentifier: "RateControllerID") as! BaseTableController
			controller.pageForm = itemModel
			self.navigationController?.pushViewController(controller, animated: true)
			
		case settingsModel.writeAReview.identifier:
			sendEmail(recipient: "cvmedicalsoftware@gmail.com",subject: "App Rating")

		default:
			()
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
	
}
