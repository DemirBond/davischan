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
import SwiftToast


struct CustomSwiftToast: SwiftToastProtocol {
	// Protocoled
	var duration: Double?
	var aboveStatusBar: Bool
	var statusBarStyle: UIStatusBarStyle
	var isUserInteractionEnabled: Bool
	var target: SwiftToastDelegate?
	var style: SwiftToastStyle
	
	// Customized
	var title: String
	var subtitle: String
	var backgroundColor: UIColor
}

class CustomSwiftToastView: UIView, SwiftToastViewProtocol {
	
	// Customized
	@IBOutlet weak var titleLabel: UILabel!
	@IBOutlet weak var subtitleLabel: UILabel!
	
	// Protocoled
	func nib() -> SwiftToastViewProtocol? {
		return Bundle.main.loadNibNamed("CustomSwiftToastView", owner: self, options: nil)?.first as? CustomSwiftToastView
	}
	
	func configure(with toast: SwiftToastProtocol) {
		if let customToast = toast as? CustomSwiftToast {
			
			// put your configure code here. e.g.:
			// subtitleLabel.text = customToast.subtitle
			// backgroundColor = customToast.backgroundColor
		}
	}
}


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
	
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		if self.navigationItem.leftBarButtonItem == nil {
			self.navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "backIcon"),
			                                                        style: .plain, target: self, action: #selector(self.leftButtonAction(_:)))
		}
		
		self.title = pageForm.title
		
		self.tableView.contentInset = UIEdgeInsetsMake(0, 0, 60.00, 0)
		
		self.tableView.dataSource = self
		
		for item in pageForm.items {
			let type = item.form.itemType
			if type == ItemType.date {
				dateModel = item
				break
			}
		}
		
		setupAppearance()
		checkDependancies()
		
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
		                                    #selector(self.bottomRightButtonAction1(_:)), #selector(self.bottomLeftButtonAction(_:)), nil]
		
		if ["nsr", "heartSpecialistManagement", "rhcInHSM"].contains(where: { $0 == pageForm.identifier }) {
			self.navigationController?.setToolbarHidden(false, animated: false)
			shortcutModel = DataManager.manager.evaluation!.outputInMain
			let dictInfo = ["leftBottom": "Aa", "rightBottom" : "Compute".localized]
			let toolbar = CVDToolbar()
			toolbar.setup(dict: dictInfo, target: self, actions: bottomSelectors )
			self.toolbarItems = toolbar.barItems
			
		} else if let id = CVDStyle.style.smartLink(from: pageForm.identifier) {
			self.navigationController?.setToolbarHidden(false, animated: false)
			let model = DataManager.manager.evaluation!.model(with: id)
			shortcutModel = model
			let dictInfo = ["leftBottom": "Aa", "rightBottom" : shortcutModel!.title + ""]
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
		
		self.navigationController?.setToolbarHidden(true, animated: false)
		
		if let selectedGender = bioModel.gender.male.storedValue?.radioGroup?.selectedRadioItem {
			bioModel.gender.subtitle = (selectedGender == bioModel.gender.male.identifier) ? "Male".localized : "Female".localized
		}
		
		self.tableView.reloadData()
		
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
	
	
	override func setupAppearance() {
		
		//self.clearsSelectionOnViewWillAppear = true
		self.navigationController?.navigationBar.isTranslucent = true
		self.view.backgroundColor = UIColor(palette: ColorPalette.snow)
		self.navigationItem.backBarButtonItem = UIBarButtonItem(title:"", style:.plain, target:nil, action:nil)
		self.tableView.tableFooterView = UIView()
		self.accessoryBar?.tintColor = UIColor(palette: ColorPalette.warmGrey)
		
		//self.navigationItem.title
		
		let applyStyle = { (style: ControllerStyle) -> Void in
			guard let appearanceInfo = style.styleInfo() else { return }
			
			let topSelectors: [Selector?] = [#selector(self.rightButtonAction(_:)), #selector(self.leftButtonAction(_:)), #selector(self.bottomLeftButtonAction(_:))]
			let cvdTopbar = CVDTopbar(dict: appearanceInfo, target: self, actions: topSelectors)
			
			if nil != cvdTopbar.title {
				self.navigationItem.title = cvdTopbar.title
			}
			
			if nil != cvdTopbar.tintColor {
				self.navigationController?.navigationBar.tintColor = cvdTopbar.tintColor
			}
			
			if nil != cvdTopbar.rightBarItem {
				self.navigationItem.rightBarButtonItems = [cvdTopbar.rightBarItem!, cvdTopbar.rightTextBarItem!]
			}
			
			if nil != cvdTopbar.leftBarItem {
				self.navigationItem.leftBarButtonItem = cvdTopbar.leftBarItem
			}
			
			let bottomSelectors: [Selector?] = [#selector(self.bottomRightButtonAction(_:)),
			                                    #selector(self.bottomRightButtonAction1(_:)), #selector(self.bottomLeftButtonAction(_:)), nil]
			
			let cvdToolbar = CVDToolbar()
			cvdToolbar.setup(dict: appearanceInfo, target: self, actions: bottomSelectors)
			cvdToolbar.barTintColor = .white
			cvdToolbar.sizeToFit()
			self.toolbarItems = cvdToolbar.barItems
			
		}
		
		// get  User Interface Info
		if let styleID = self.generatedID, let style = ControllerStyle(rawValue: styleID) {
			applyStyle(style)
		} else if  let styleID = self.createdID , let style = ControllerStyle(rawValue: styleID) {
			applyStyle(style)
		}
	}
	
	
	override func moveToItem(_ sender: UISegmentedControl) {
		guard nil != activeModel else { return }
		
		checkDependancies()
		
		repeat {
			if self.presentedViewController != nil {
				self.dismiss(animated: false, completion: nil)
			}
			
			let index = (modelChain as NSArray).index(of: activeModel!)
			if sender.selectedSegmentIndex == 0 {
				if index > 0 {
					activeModel = modelChain[index - 1]
				}
				
			} else if index < modelChain.count - 1 {
				activeModel = modelChain[index + 1]
			}
			
		} while nil != activeModel && activeModel!.form.isEnabled == false
		
		if let path = activeModel?.modelIndexPath {
			if let cell = tableView.cellForRow(at: path) as? GeneratedCell {
				activeField = cell.textField
				activeField?.isEnabled = true
				activeField?.becomeFirstResponder()
				
			} else {
				self.tableView.scrollToRow(at: path, at: UITableViewScrollPosition.middle, animated: false)
				if let cell = tableView.cellForRow(at: path) as? GeneratedCell {
					activeField = cell.textField
					activeField?.isEnabled = true
					activeField?.becomeFirstResponder()
				}
			}
		}
	}
	
	
	override func evaluateResponderChain() {
		
		var models = [EvaluationItem]()
		
		for (index, item) in pageForm.items.enumerated() {
			
			if [.textRight, .textLeft, .integerRight, .integerLeft, .decimalRight, .decimalLeft, .mail, .password, .date].contains(where: { $0 == item.form.itemType }) {
				item.modelIndexPath = IndexPath(row: index, section: 0)
				models.append(item)
			}
		}
		
		self.modelChain = models
		self.segmentedControl?.setEnabled(modelChain.count > 1, forSegmentAt: 0)
		self.segmentedControl?.setEnabled(modelChain.count > 1, forSegmentAt: 1)
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
			self.showCVDAlert(title: alertTitle, message: alertDescription, actions: actions)
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
	
	
	override func rightButtonAction(_ sender: UIBarButtonItem) {
		if validatePage() {
			performSegue(withIdentifier: unwindToEvaluationSegueID, sender: self.pageForm)
		}
	}
	
	
	override func leftButtonAction(_ sender: UIBarButtonItem) {
		if validatePage() {
			DataManager.manager.evaluation!.isBioCompleted = true
			_ = self.navigationController?.popViewController(animated: true)
		}
	}
	
	
	override func bottomRightButtonAction(_ sender: UIBarButtonItem) {
		if validatePage() && shortcutModel != nil && shortcutModel?.title != DataManager.manager.evaluation!.outputInMain.title{
			let storyboard = UIStoryboard(name: "Medical", bundle: nil)
			
			if generatedID == "bio" {
				DataManager.manager.setPAHValue(pah: true)
				let controller = storyboard.instantiateViewController(withIdentifier: "HypertensionControllerID") as! HypertensionController
				controller.pageForm = shortcutModel!
				self.navigationController?.pushViewController(controller, animated: true)
			
			} else {
				let controller = storyboard.instantiateViewController(withIdentifier: "GeneratedControllerID") as! GeneratedController
				controller.pageForm = self.shortcutModel!
				self.navigationController?.pushViewController(controller, animated: true)
			}
			
			print(validatePage().description + " -- " + (shortcutModel?.title)! + " -- " + DataManager.manager.evaluation!.outputInMain.title)
			self.pageForm.form.status = .valued
			
		} else if validatePage() && shortcutModel != nil && shortcutModel?.title == DataManager.manager.evaluation!.outputInMain.title {
			
			//			print("+++++++++++++" + generatedID!)
			if generatedID == DataManager.manager.evaluation?.heartSpecialistManagement.rhcInHSM.identifier || generatedID == DataManager.manager.evaluation?.heartSpecialistManagement.identifier {
				DataManager.manager.setPAHValue(pah: true)
			}
			
			let model = DataManager.manager.evaluation!
			
			self.startAnimating()
			
			let client: RestClient = RestClient.client
			let inputs = DataManager.manager.getEvaluationItemsAsRequestInputsString()
			let evaluation = EvaluationRequest(isSave: false, age: Int((model.bio.age.storedValue?.value)!)!, isPAH:String(DataManager.manager.getPAHValue()), name: "None", gender: model.bio.gender.female.isFilled ? 2:1, SBP: Int((model.bio.sbp.storedValue?.value)!)!, DBP: Int((model.bio.dbp.storedValue?.value)!)!, inputs: inputs)
			print("PAH:\t" + evaluation.isPAH + "\t Inputs:\t " + evaluation.inputs)
			
			client.computeEvaluation(evaluationRequest: evaluation, success: { (response) in print(response)
				
				let result = DataManager()
				result.setOutputEvaluation(response: response)
				
				self.stopAnimating()
				
				// add pah value false
				print(String(DataManager.manager.getPAHValue()))
				DataManager.manager.setPAHValue(pah: false)
				
				let controller = self.storyboard?.instantiateViewController(withIdentifier: "GeneratedControllerID") as! GeneratedController
				controller.pageForm = self.shortcutModel!
				self.navigationController?.pushViewController(controller, animated: true)
				self.pageForm.form.status = .valued
				
			}, failure: { error in print(error)
				
				var actions = [CVDAction] ()
				var alertTitle: String?
				var alertDescription : String?
				actions.append(CVDAction(title: "OK".localized, type: CVDActionType.cancel, handler: nil, short: true))
				alertTitle = "Network Connection".localized
				alertDescription = "Check network connection before computing the evaluation.".localized
				
				self.stopAnimating()
				
				self.showCVDAlert(title: alertTitle!, message: alertDescription, actions: actions)
				
			})
			
		}
		
	}
	
	/*
	func hideKeyboard() {
		activeField?.resignFirstResponder()
		self.activeField = nil
		self.activeModel = nil
		tableView.reloadData()
	}
	
	
	func createHandler(model: EvaluationItem, navigation: UINavigationController? ) -> CVDHandler {
		
		let storyboard = UIStoryboard(name: "Medical", bundle: nil)
		let handler = {() in
			let controller = storyboard.instantiateViewController(withIdentifier: "GeneratedControllerID") as! GeneratedController
			controller.pageForm = model
			navigation?.pushViewController(controller, animated: true)
		}
		return handler
	}
	
	
	func createPahHandler(model: EvaluationItem, navigation: UINavigationController? ) -> CVDHandler {
		
		let storyboard = UIStoryboard(name: "Medical", bundle: nil)
		let handler = {() in
			let controller = storyboard.instantiateViewController(withIdentifier: "GeneratedControllerID") as! GeneratedController
			controller.pageForm = model
			navigation?.pushViewController(controller, animated: true)
			DataManager.manager.setPAHValue(pah: true)
			
			DataManager.manager.resetAllPAHItems()
			
			DataManager.manager.equalizeAllItems()
		}
		return handler
	}
	
	
	func checkDependancies() {
		
		for depended in pageForm.items {
			guard let dependsOn = depended.dependancy?.dependsOn else { continue }
			
			for item in pageForm.items {
				if item.identifier == dependsOn {
					if let path = item.modelIndexPath {
						if let cell = tableView.cellForRow(at: path) as? GeneratedCell {
							let field = cell.textField
							item.storedValue?.value = field?.text
						}
					}
					
					if let str = item.storedValue?.value, let storedVal = Double(str),
						let minValue = depended.dependancy?.dependMinValue,
						let maxValue = depended.dependancy?.dependMaxValue {
						depended.form.isEnabled = storedVal >= minValue && storedVal <= maxValue
					}
					
					if let path = depended.modelIndexPath {
						if let cell = tableView.cellForRow(at: path) as? GeneratedCell {
							let field = cell.textField
							field?.isEnabled = depended.form.isEnabled
							cell.titleLabel?.textColor = depended.form.isEnabled ? CVDStyle.style.defaultFontColor : UIColor.lightGray
						}
					}
					
				}
			}
		}
	}
	*/
	
	
	//MARK: - EvaluationEditing protocol
	
	override func evaluationFieldDidBeginEditing(_ textField: UITextField, model: EvaluationItem) {
		self.activeField = textField
		self.activeModel = model
		self.pageForm.form.status = .valued
	}
	
	
	override func evaluationValueDidChange(model: EvaluationItem) {
		self.pageForm.form.status = .valued
		self.tableView.reloadData()
	}
	
	
	override func evaluationValueDidEnter(_ textField: UITextField, model: EvaluationItem) {
		Timer.scheduledTimer(timeInterval: 0.1,
		                     target: self,
		                     selector: #selector(self.checkDependancies),
		                     userInfo: nil,
		                     repeats: false)
	}

	//
	// will use woast cocoapods
	//
	override func evaluationValueDidNotValidate(model: EvaluationItem, message: String, description: String?) {
		
		guard !isCancelled else { return }
		let storyboard = UIStoryboard(name: "Medical", bundle: nil)
		
		let controller = storyboard.instantiateViewController(withIdentifier: "MessageControllerID") as! MessageController
		controller.message = message
		controller.descriptionMessage = description
		controller.modalPresentationStyle = UIModalPresentationStyle.overCurrentContext
		self.present(controller, animated: false) { controller.showMessage() }
		
//		var style = ToastStyle()
//		style.messageColor = .white
//		style.titleColor = .white
//		style.messageFont = .boldSystemFont(ofSize: 14.0)
//		style.titleFont = .boldSystemFont(ofSize: 17.0)
//		style.backgroundColor = .red
//		self.view.makeToast(description, duration: 3.0, position: .center, title: message, image: nil, style: style) { didTap in
//		
//		}

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
				return 50
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
