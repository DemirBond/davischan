//
//  BaseController.swift
//  CVDEvaluator
//
//  Created by IgorKhomiak on 2/2/17.
//  Copyright © 2017 IgorKhomiak. All rights reserved.
//

import UIKit


class BaseController: UIViewController, BuildAppearance, EvaluationEditing {
	
	var activeField: UITextField?
	var activeModel: EvaluationItem?
	var isCancelled = false
	
	var modelChain = [EvaluationItem]()
	var pageForm = EvaluationItem()
	
	var createdID: String! { return nil }
	var generatedID: String? { return nil }
	
	weak var styleController: StyleController?
	

	override func viewDidLoad() {
		super.viewDidLoad()
		
		setupAppearance()
		evaluateResponderChain()
		
		if pageForm.form.status == .open {
			pageForm.form.status = .viewed
		}
	}
	
	
	func setupAppearance() {
		
		//self.view.backgroundColor = UIColor(palette: ColorPalette.snow)
		self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style:.plain, target:nil, action:nil)
		
		let applyStyle = { (style: ControllerStyle) -> Void in
			guard let appearanceInfo = style.styleInfo() else { return }
			
			// TopBar
			let topSelectors: [Selector?] = [#selector(self.leftButtonAction(_:)),
			                                 #selector(self.rightTextButtonAction(_:)),
			                                 #selector(self.rightListButtonAction(_:)),
			                                 #selector(self.rightMenuButtonAction(_:))]
			let cvdTopbar = CVDTopbar(dict: appearanceInfo, target: self, actions: topSelectors)
			if nil != cvdTopbar.title {
				self.navigationItem.title = cvdTopbar.title
			}
			if nil != cvdTopbar.tintColor {
				self.navigationController?.navigationBar.tintColor = cvdTopbar.tintColor
			}
			if nil != cvdTopbar.leftBarItem {
				self.navigationItem.leftBarButtonItem = cvdTopbar.leftBarItem
			}
			
			var rightBarItems: [UIBarButtonItem] = []
			if nil != cvdTopbar.rightMenuBarItem {
				rightBarItems.append(cvdTopbar.rightMenuBarItem!)
			}
			if nil != cvdTopbar.rightListBarItem {
				rightBarItems.append(cvdTopbar.rightListBarItem!)
			}
			if nil != cvdTopbar.rightTextBarItem {
				rightBarItems.append(cvdTopbar.rightTextBarItem!)
			}
			self.navigationItem.rightBarButtonItems = rightBarItems
			
			// BottomBar
			let bottomSelectors: [Selector?] = [#selector(self.bottomRightButtonAction(_:)),
			                                    #selector(self.bottomRightButtonAction1(_:))]
			let cvdToolbar = CVDToolbar()
			cvdToolbar.setup(dict: appearanceInfo, target: self, actions: bottomSelectors)
			cvdToolbar.barTintColor = .white
			cvdToolbar.sizeToFit()
			self.toolbarItems = cvdToolbar.barItems
		}
		
		// get  User Interface Info
		if  let styleID = self.createdID , let style = ControllerStyle(rawValue: styleID) {
			applyStyle(style)
		}
		if let styleID = self.generatedID, let style = ControllerStyle(rawValue: styleID) {
			applyStyle(style)
		}
	}
	
	
	func evaluateResponderChain() {
		
		var models = [EvaluationItem]()
		
		for (index, item) in pageForm.items.enumerated() {
			
			if [.textRight, .textLeft, .integerRight, .integerLeft, .decimalRight, .decimalLeft, .mail, .password].contains(where: { $0 == item.form.itemType }) {
				item.modelIndexPath = IndexPath(row: index, section: 0)
				models.append(item)
			}
		}
		
		self.modelChain = models
	}
	
	
	func setupFixedSpace(width: CGFloat) -> UIBarButtonItem {
		let item = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.fixedSpace, target: nil, action: nil)
		item.width = width
		return item
	}
	
	
	func showCVDAlert(title: String, message: String?, actions: [CVDAction]) {
		let storyboard = UIStoryboard(name: "Medical", bundle: nil)
		
		let controller = storyboard.instantiateViewController(withIdentifier: "CVDAlertControllerID") as! CVDAlertController
		controller.titleMessage = title
		controller.descriptionMessage = message
		controller.addActions(actions)
		
		controller.modalPresentationStyle = UIModalPresentationStyle.overCurrentContext
		self.present(controller, animated: false)
	}
	
	
	func showDropMenu(actions: [MenuAction]) {
		let storyboard = UIStoryboard(name: "Medical", bundle: nil)
		
		let controller = storyboard.instantiateViewController(withIdentifier: "SideMenuControllerID") as! SideMenuController
		controller.addActions(actions)
		
		controller.modalPresentationStyle = UIModalPresentationStyle.overCurrentContext
		self.present(controller, animated: false)
	}
	
	
	
	// MARK: - Actions
	
	@IBAction func doneAction(_ sender: AnyObject) {
	}
	
	func leftButtonAction(_ sender: UIBarButtonItem) { /* tooverride */}
	func rightTextButtonAction(_ sender: UIBarButtonItem) {
		let storyboard = UIStoryboard(name: "Medical", bundle: nil)
		let controller = storyboard.instantiateViewController(withIdentifier: "StyleControllerID") as! StyleController
		controller.modalPresentationStyle = UIModalPresentationStyle.overCurrentContext
		self.present(controller, animated: false) { () }
		styleController = controller
	}
	func rightListButtonAction(_ sender: UIBarButtonItem) { /* tooverride */}
	func rightMenuButtonAction(_ sender: UIBarButtonItem) { /* tooverride */}
	
	func bottomRightButtonAction(_ sender: UIBarButtonItem) { /* tooverride */}
	func bottomRightButtonAction1(_ sender: UIBarButtonItem) { /* tooverride */}
	
	
	
	//MARK: - EvaluationEditing protocol
	
	func evaluationFieldDidBeginEditing(_ textField: UITextField, model: EvaluationItem) {
		self.activeField = textField
		// from tablw view
		self.activeModel = model
		pageForm.form.status = .valued
	}
	
	
	func keyboardReturnDidPress(model: EvaluationItem) {
	}

	
	func evaluationValueDidChange(model: EvaluationItem) {
		pageForm.form.status = .valued
	}
	
	
	func evaluationValueDidEnter(_ textField: UITextField, model: EvaluationItem) {		
	}
	
	
	func evaluationValueDidNotValidate(model: EvaluationItem, message: String, description: String?) {
		
		guard !isCancelled else { return }
		let storyboard = UIStoryboard(name: "Medical", bundle: nil)
		
		let controller = storyboard.instantiateViewController(withIdentifier: "MessageControllerID") as! MessageController
		controller.message = message
		controller.descriptionMessage = description
		controller.modalPresentationStyle = UIModalPresentationStyle.overCurrentContext
		self.present(controller, animated: false) { controller.showMessage() }
	}
	
	
	func evaluationFieldTogglesDropDown() {
		// 
	}
	
}
