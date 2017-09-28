//
//  HypertensionController.swift
//  CVDEvaluator
//
//  Created by IgorKhomiak on 3/10/17.
//  Copyright © 2017 IgorKhomiak. All rights reserved.
//

import UIKit

class HypertensionController: GeneratedController {

	let unwindFromHypertentionSegueID = "unwindFromHypertentionSegueID"
	
	@IBOutlet weak var sectionPanel: UIView!
	@IBOutlet weak var button1: UIButton!
	@IBOutlet weak var button2: UIButton!
	@IBOutlet weak var button3: UIButton!
	
	private var selectedTabNum = 0
	private var buttons = [UIButton] ()
	
	let tab1Tag = 0
	let tab2Tag = 1
	let tab3Tag = 2
	
	override var createdID: String! { return "hypertension" }
	override var generatedID: String? { return pageForm.identifier }

	override func viewDidLoad() {
		super.viewDidLoad()
		button1.titleLabel?.textColor = SectionButttonStyle.fontColor
		button1.titleLabel?.font = SectionButttonStyle.textFont
		button1.setTitle(pageForm.items[0].title, for: UIControlState.normal)
		button1.setTitleColor(SectionButttonStyle.fontColor, for: UIControlState.normal)
		button1.tag = tab1Tag
		
		button2.titleLabel?.font = SectionButttonStyle.textFont
		button2.setTitle(pageForm.items[1].title, for: UIControlState.normal)
		button2.setTitleColor(SectionButttonStyle.fontColor, for: UIControlState.normal)
		button2.tag = tab2Tag
		
		button3.titleLabel?.font = SectionButttonStyle.textFont
		button3.setTitle(pageForm.items[2].title, for: UIControlState.normal)
		button3.setTitleColor(SectionButttonStyle.fontColor, for: UIControlState.normal)
		button3.tag = tab3Tag
		
		buttons.append(button1)
		buttons.append(button2)
		buttons.append(button3)
		
		let tabNum = UserDefaults.standard.integer(forKey: "TabNumber")
		
		if tabNum >= 0 && tabNum < 3 {
			selectedTabNum = tabNum
		} else {
			selectedTabNum = 0
		}
		selectTab(button: buttons[selectedTabNum], selected: true)
    }
	
	func selectTab(button: UIButton, selected: Bool) {
		if selected {
			button.setTitleColor(UIColor(palette: ColorPalette.lighterPurple), for: UIControlState.normal)
		} else {
			button.setTitleColor(SectionButttonStyle.fontColor, for: UIControlState.normal)
		}
	}
	
	// MARK: - Actions
	
	@IBAction func switchTabAction(_ sender: UIButton) {
		
		selectedTabNum = sender.tag
		UserDefaults.standard.set(selectedTabNum, forKey: "TabNumber")
		
		for button in buttons {
			selectTab(button: button, selected: button.tag == selectedTabNum)
		}

		self.tableView.reloadData()
	}

	override func rightMenuButtonAction(_ sender: UIBarButtonItem) {
		if validatePage() {
			performSegue(withIdentifier: unwindFromHypertentionSegueID, sender: self.pageForm)
		}
	}

	// MARK: - Table view data source
	
	override func numberOfSections(in tableView: UITableView) -> Int {
		return 1
	}
	
	
	override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		let segmentForm = pageForm.items[selectedTabNum]
		return segmentForm.items.count
	}
	

	override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let segmentForm = pageForm.items[selectedTabNum]
		let itemModel = segmentForm.items[indexPath.row]
		
		let cellType = itemModel.form.itemType
		let cell = tableView.dequeueReusableCell(withIdentifier: cellType.reuseIdentifier(), for: indexPath) as! GeneratedCell
		cell.delegate = self
		cell.cellModel = itemModel
		
		cell.updateCell()
		
		
		switch itemModel.form.itemType {
			
		case .disclosureControl where itemModel.storedValue!.isChecked == false:
			cell.selectionStyle = .none
			
		case .disclosureRadio where itemModel.storedValue?.radioGroup!.selectedRadioItem != itemModel.identifier:
			cell.selectionStyle = .none
			
		case .disclosureVieved, .disclosureControl, .disclosureSimple, .disclosureRadio, .disclosureWeather:
			cell.selectionStyle = .gray
			
		case .partnerCard:
			()
			
		default:
			cell.selectionStyle = UITableViewCellSelectionStyle.none
		}
		return cell
	}
	
	
	override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		let segmentForm = pageForm.items[selectedTabNum]
		let itemModel = segmentForm.items[indexPath.row]
		switch itemModel.form.itemType {
			
		case .disclosureSimple, .disclosureVieved, .disclosureWeather,
		     .disclosureControl where itemModel.storedValue!.isChecked,
		     .disclosureRadio where itemModel.storedValue?.radioGroup!.selectedRadioItem == itemModel.identifier:
			
			if validatePage() {
				let storyboard = UIStoryboard(name: "Medical", bundle: nil)
				let controller = storyboard.instantiateViewController(withIdentifier: "GeneratedControllerID") as! GeneratedController
				controller.pageForm = itemModel
				self.navigationController?.pushViewController(controller, animated: true)
			}
			
			hideKeyboard()
			
		default:
			()
		}
	}
	
	override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
		return sectionPanel
	}
	
	override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
		return 44.0
	}
	
	override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
		let segmentForm = pageForm.items[selectedTabNum]
		let itemModel = segmentForm.items[indexPath.row]
		return itemModel.calculateCellHeight(forWidth: self.view.frame.size.width)
	}
	
}
