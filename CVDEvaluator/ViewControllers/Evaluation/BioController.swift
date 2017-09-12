//
//  BioController.swift
//  CVDEvaluator
//
//  Created by IgorKhomiak on 2/10/17.
//  Copyright © 2017 IgorKhomiak. All rights reserved.
//  Updated by EvrimGuler 5/18/2017

import UIKit
import NVActivityIndicatorView
import ToastSwiftFramework


class BioController: BaseTableController, NVActivityIndicatorViewable { //, UITableViewDelegate, UITableViewDataSource{
	
	let unwindToEvaluationSegueID = "unwindToEvaluationSegueID"
	
	var cellExpanded:Bool = false
	
	@IBOutlet weak var datePicker: UIDatePicker!
	
	weak var shortcutModel: EvaluationItem?
	private var dateModel: EvaluationItem?
	
	override var createdID: String! { return "generated" }
	override var generatedID: String? { return pageForm.identifier }
	
	var bioModel = BioPersonal(literal: Presentation.bio)
	
	let genderList = ["Male", "Female"]
	
	var showingDropDown = false
	
	var isSaved: Bool = false
	
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		if self.navigationItem.leftBarButtonItem == nil {
			self.navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "backIcon"),
			                                                        style: .plain, target: self, action: #selector(self.leftButtonAction(_:)))
		}
		
		//self.tableView.contentInset = UIEdgeInsetsMake(0, 0, 60.00, 0)
		
		self.tableView.dataSource = self
		
		for item in pageForm.items {
			let type = item.form.itemType
			if type == ItemType.date {
				dateModel = item
				break
			}
		}
		
		self.tableView.tableFooterView = UIView()
		
		// tableView.register(DisclosureSimpleCellExpandable.self, forCellReuseIdentifier: "DisclosureSimpleCellExpandable")
	}
	
	
	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		
		self.toolbarItems = nil
		shortcutModel = nil
		
		if pageForm.identifier == "bio", let form = pageForm as? BioPersonal {
			if let selectedGender = form.gender.male.storedValue?.radioGroup?.selectedRadioItem {
				form.gender.subtitle = (selectedGender == form.gender.male.identifier) ? "Male".localized : "Female".localized
			}
		}
		
		let bottomSelectors: [Selector?] = [#selector(self.bottomRightButtonAction(_:)),
		                                    #selector(self.bottomRightButtonAction1(_:))]
		
		if let id = CVDStyle.style.smartLink(from: pageForm.identifier) {
			self.navigationController?.setToolbarHidden(false, animated: false)
			let model = DataManager.manager.evaluation!.model(with: id)
			shortcutModel = model
			let dictInfo = ["rightBottom" : shortcutModel!.title + ""]
			let toolbar = CVDToolbar()
			toolbar.setup(dict: dictInfo, target: self, actions: bottomSelectors )
			self.toolbarItems = toolbar.barItems
		
		} else {
			self.navigationController?.setToolbarHidden(true, animated: false)
			
		}
		
		self.tableView.reloadData()
	}
	
	
	override func viewDidAppear(_ animated: Bool) {
		super.viewDidAppear(animated)
		
	}
	
	
	override func viewWillDisappear(_ animated : Bool) {
		super.viewWillDisappear(animated)
		
		if self.isMovingFromParentViewController && (DataManager.manager.evaluation?.isBioCompleted ?? false) {
			let isValid = validatePage()
			if isValid {
				DataManager.manager.saveCurrentEvaluation()
			}
		}
	}
	
	
	func validatePage() -> Bool {
		do {
			try pageForm.validateEvaluationItem()
			return true
			
		} catch let err {
			
			var actions = [CVDAction] ()
			
			actions.append(CVDAction(title: "OK".localized, type: CVDActionType.cancel, handler: nil, short: true))
			
			actions.append(CVDAction(title: "Back".localized, type: CVDActionType.cancel, handler: {
				self.navigationController?.popViewController(animated: true)
			}, short: true))
			
			let alertTitle: String = "Cannot save this form".localized
			
			var alertDescription : String?
			switch err {
				case InputError.incorrectInput:
					alertDescription = "One of the fields contains unsupported characters. Please correct and try again.".localized
				case InputError.toLong:
					alertDescription = "Entering in one of the fields is too long. Please shorten it and try again.".localized
				case InputError.outOfBounds:
					alertDescription = "Entered numerical value into one of field exceeds the limits. Please set number between limits.".localized
				case InputError.emptyInput:
					alertDescription = "Required Fields cannot be empty. Please fill in all fields marked (*).".localized
				
				default:
					()
			}
			// self.showCVDAlert(title: alertTitle, message: alertDescription, actions: actions)
			
			return false
		}
	}
	
	
	
	// MARK: - Actions
	
	@IBAction func selectDate(_ sender: UIDatePicker) {
		
		let date = sender.date
		
		let formatter = DateFormatter()
		formatter.dateFormat = "MM/yyyy"
		let strDate = formatter.string(from: date)
		self.dateModel?.storedValue?.value = strDate
		
		if let path = dateModel?.modelIndexPath {
			let cell = tableView.cellForRow(at: path) as! DateCell
			cell.textField?.text = strDate
		}
	}
	
	
	override func leftButtonAction(_ sender: UIBarButtonItem) {
		if validatePage() {
			DataManager.manager.evaluation!.isBioCompleted = true
			_ = self.navigationController?.popViewController(animated: true)
		}
		else {
			DataManager.manager.evaluation!.isBioViewed = true
			self.navigationController?.popViewController(animated: true)
		}
	}
	
	
	/*override func rightMenuButtonAction(_ sender: UIBarButtonItem) {
		if validatePage() {
			performSegue(withIdentifier: unwindToEvaluationSegueID, sender: self.pageForm)
		}
	}*/
	override func rightMenuButtonAction(_ sender: UIBarButtonItem) {
		
		var actions = [MenuAction] ()
		
		// Reset Fields
		actions.append(MenuAction(title: "Reset Fields", handler: {
			self.resetFields(items: self.pageForm.items)
			
			self.tableView.reloadData()
		}))
		
		self.showDropMenu(actions: actions)
	}
	
	
	override func bottomRightButtonAction(_ sender: UIBarButtonItem) {
		if validatePage() {
			DataManager.manager.evaluation!.isBioCompleted = true
		}
		else {
			DataManager.manager.evaluation!.isBioViewed = true
		}

		let storyboard = UIStoryboard(name: "Medical", bundle: nil)
		
		let controller = storyboard.instantiateViewController(withIdentifier: "GeneratedControllerID") as! GeneratedController
		controller.pageForm = self.shortcutModel!
		self.navigationController?.pushViewController(controller, animated: true)
		
		self.pageForm.form.status = .valued
	}
	
	
	func resetFields(items: [EvaluationItem]) {
		for item: EvaluationItem in items {
			let type = item.form.itemType
			if type == ItemType.textLeft || type == ItemType.decimalLeft || type == ItemType.integerLeft {
				if let _: String = item.storedValue?.value {
					item.storedValue?.value = nil
				}
			}
			else if type == ItemType.check || type == ItemType.disclosureControl || type == ItemType.disclosureControlExpandable {
				if let _: Bool = item.storedValue?.isChecked {
					item.storedValue?.isChecked = false
				}
				if type == ItemType.disclosureControlExpandable {
					resetFields(items: item.items)
				}
			}
			else if type == ItemType.radio {
				if let _: String = item.storedValue?.radioGroup?.selectedRadioItem {
					item.storedValue?.radioGroup?.selectedRadioItem = nil
				}
			}
		}
	}
	
	
	
	//MARK: - EvaluationEditing protocol
	
	override func evaluationValueDidNotValidate(model: EvaluationItem, message: String, description: String?) {
		
		guard !isCancelled else { return }
		let storyboard = UIStoryboard(name: "Medical", bundle: nil)
		
		let controller = storyboard.instantiateViewController(withIdentifier: "MessageControllerID") as! MessageController
		controller.message = message
		controller.descriptionMessage = description
		controller.modalPresentationStyle = UIModalPresentationStyle.overCurrentContext
		self.present(controller, animated: false) { controller.showMessage() }

	}
	
	
	
	// MARK: - UITableView DataSource
	
	override func numberOfSections(in tableView: UITableView) -> Int {
		return 1
	}
	
	
	override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return pageForm.items.count
	}
	
}



extension BioController {
	
	// MARK: - UITableView Delegates
	
	override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		
		let itemModel = pageForm.items[indexPath.row]
		
		let cellType = itemModel.form.itemType
		let cell = tableView.dequeueReusableCell(withIdentifier: cellType.reuseIdentifier(), for: indexPath) as! GeneratedCell
		cell.accessoryBar = self.accessoryBar
		cell.delegate = self
		
		// self.textField?.text = self.cellModel.storedValue?.value
		
		if cellType == .date {
			cell.textField?.inputView = self.datePicker
		}
		
		cell.cellModel = itemModel
		
		if let title = cell.cellModel?.title{
			print("cell title \(title)")
		}
		else {
			print("cell title nl")
		}
		
		cell.updateCell()
		
		if cellType ==  .textLeft || cellType ==  .integerLeft || cellType ==  .decimalLeft  {
			cell.textField?.textColor = CVDStyle.style.purpleColor
			cell.textField?.borderStyle = UITextBorderStyle.none
		}
		
		if cellType ==  .disclosureSimple{
			cell.subtitleLabel?.textColor = CVDStyle.style.purpleColor
		}
		
		if cellType ==  .disclosureSimpleExpandable{
			//cell.titleLabel?.text = cell.cellModel?.title
			cell.subtitleLabel?.text = "pick one" // cell.cellModel?.subtitle
			
			cell.subLabelOne?.text = genderList[0]
			cell.subLabelTwo?.text = genderList[1]
			
			cell.subtitleLabel?.textColor = CVDStyle.style.purpleColor
		}
		
//		cell.textField?.textColor = UIColor.darkGray
		
		/*
		if (!isShowingList) {
			// Not a list in this case.
			// We'll only display the item of the demoData array of which array
			// index matches the selectedValueList.
			[[cell textLabel] setText:[demoData objectAtIndex:selectedValueIndex]];
			
			// We'll also display the disclosure indicator to prompt user to
			// tap on that cell.
			cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
		}
		else{
			// Listing the array items.
			[[cell textLabel] setText:[demoData objectAtIndex:[indexPath row]]];
			
			// We'll display the checkmark next to the already selected value.
			// That means that we'll apply the checkmark only to the cell
			// where the [indexPath row] value is equal to selectedValueIndex value.
			if ([indexPath row] == selectedValueIndex) {
				cell.accessoryType = UITableViewCellAccessoryCheckmark;
			}
			else{
				cell.accessoryType = UITableViewCellAccessoryNone;
			}
		}*/
		
		switch itemModel.form.itemType {
			
			case .disclosureControl where itemModel.storedValue!.isChecked == false:
				cell.selectionStyle = .none
			
			case .disclosureControlWithCheck where itemModel.storedValue!.isChecked == false:
				cell.selectionStyle = .none
			
			case .disclosureRadio where itemModel.storedValue?.radioGroup!.selectedRadioItem != itemModel.identifier:
				cell.selectionStyle = .none
			
			case .disclosureVieved, .disclosureControl, .disclosureControlWithCheck, .disclosureSimple,  .disclosureRadio, .disclosureWeather:
				cell.selectionStyle = .gray
			
			case .partnerCard:
				()
			
			default:
				cell.selectionStyle = .none
		}
		
		return cell
	}
	
	
	override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		
		let itemModel = pageForm.items[indexPath.row]
		print("row selected type \(itemModel.form.itemType)")
		
		//self.textField?.text = self.cellModel.storedValue?.value
		
		switch itemModel.form.itemType {
			
			case .disclosureSimple, .disclosureVieved, .disclosureWeather,
			     .disclosureControl where itemModel.storedValue!.isChecked,
			     .disclosureRadio where itemModel.storedValue?.radioGroup!.selectedRadioItem == itemModel.identifier:
				
				if pageForm.identifier == "bio" || validatePage() {
					let storyboard = UIStoryboard(name: "Medical", bundle: nil)
					
					if itemModel.identifier == identifierBy(literal: Presentation.pah) {
						let controller = storyboard.instantiateViewController(withIdentifier: "HypertensionControllerID") as! HypertensionController
						controller.pageForm = itemModel
						
						self.navigationController?.pushViewController(controller, animated: true)
					
					} else {
						let controller = storyboard.instantiateViewController(withIdentifier: "GeneratedControllerID") as! GeneratedController
						controller.pageForm = itemModel
						self.navigationController?.pushViewController(controller, animated: true)
					}
				}
				
				hideKeyboard()
		
			case .disclosureSimpleExpandable:
				cellExpanded = !cellExpanded
				tableView.beginUpdates()
				tableView.endUpdates()
			
			default:
				()
		}
	}
	
	
	override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
		let itemModel = pageForm.items[indexPath.row]
		
		if (itemModel.form.itemType == .disclosureSimpleExpandable) {
			if cellExpanded {
				return 150
			}
			else {
				return 60
			}
		}
		
		return itemModel.calculateCellHeight(forWidth: self.view.frame.size.width)
	}
	
}

//All you have to do is to implement this method. If you have a current table view which is not expandable, you can turn it into an expandable table view just by copying and pasting the code for first cell from cellForRowAtIndexPath method.
/*
extension BioController: ExpyTableViewDataSource {
	func expandableCell(forSection section: Int, inTableView tableView: ExpyTableView) -> UITableViewCell {
		
		
		let itemModel = pageForm.items[section]
		
		let cellType = itemModel.form.itemType
		let cell = tableView.dequeueReusableCell(withIdentifier: cellType.reuseIdentifier(), for: section) as! GeneratedCell
		cell.accessoryBar = self.accessoryBar
		cell.delegate = self
		
		
		if cellType == .date {
			cell.textField?.inputView = self.datePicker
		}
		
		//let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: HeaderTableViewCell.self)) as! HeaderTableViewCell
		//Make your customizations here.
		//cell.labelHeader.text = "Section: \(section) Row: 0"
		return cell
	}
}
*/

/*
extension BioController: ExpyTableViewDataSource {
	// Then return your expandable cell instance from this data source method.
	
	func expandableCell(forSection section: Int, inTableView tableView: ExpyTableView) -> UITableViewCell {
		// This cell will be displayed at IndexPath with (section: section and row: 0)
		let itemModel = pageForm.items[indexPath.row]
		
		let cellType = itemModel.form.itemType
		let cell = tableView.dequeueReusableCell(withIdentifier: cellType.reuseIdentifier(), for: indexPath)
		cell.accessoryBar = self.accessoryBar
		cell.delegate = self
	}
}

extension BioController: ExpyTableViewDelegate {

}
*/
