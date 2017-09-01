//
//  CVDAlertController.swift
//  CVDEvaluator
//
//  Created by IgorKhomiak on 2/22/17.
//  Copyright © 2017 IgorKhomiak. All rights reserved.
//

import UIKit

let longWidth: CGFloat = 175.0
let shortWidth: CGFloat = 120.0
let sheetWidth: CGFloat = 255.0
let buttonHeight: CGFloat = 44.0


struct CVDButton {
	
	let action: CVDAction
	let up: String
	let pressed: String
	weak var target: AnyObject?
	var button: UIButton
	var textColor = UIColor(palette: ColorPalette.white) ?? UIColor.white
	var highlightedColor = UIColor(palette: ColorPalette.cosmicLatte) ?? UIColor.lightGray

	
	init(action: CVDAction, up: String,  pressed: String, target: AnyObject?, fontColor: UIColor? = nil, pressedColor: UIColor? = nil) {
		
		self.action = action
		self.up = up
		self.pressed = pressed
		
		self.target = target
		self.button = UIButton(type: UIButtonType.custom)
		if let color = fontColor {
			self.textColor = color
		}
		if let color = pressedColor {
			self.highlightedColor = color
		}
		
		let (imageUp, imageDown) = resizibleImage(named: up, highlighted: pressed )
		self.button.setBackgroundImage(imageUp, for: UIControlState.normal)
		self.button.setBackgroundImage(imageDown, for: UIControlState.highlighted)
		
		self.button.setTitle(action.title, for: UIControlState.normal)
		self.button.setTitleColor(textColor, for: UIControlState.normal)
		self.button.setTitleColor(highlightedColor, for: UIControlState.highlighted)
		self.button.addTarget(target, action: #selector(CVDAlertController.buttonAction), for: UIControlEvents.touchUpInside)
	}
}


class CVDAlertController: UIViewController {
	
	let duration: TimeInterval = 0.2
	private var sheetHeight: CGFloat = 0.0
	
	private var buttonOffsetY: CGFloat = 45.0
	
	@IBOutlet weak var titleLabel: UILabel!
	@IBOutlet weak var descriptionLabel: UILabel!
	@IBOutlet weak var sheetView: UIView!
	@IBOutlet weak var stageView: UIView!
	
	var titleMessage: String = "Warning"
	var descriptionMessage: String?
	private var cvdButtons = [CVDButton]()
	
	fileprivate(set) var alertActions = [CVDAction]()
	
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		self.stageView.alpha = 0.0
		setupAlertSheet()
	}
	
	
	override func viewDidAppear(_ animated: Bool) {
		super.viewDidAppear(animated)
		
		self.showAlert()
	}
	
	
	func addActions(_ actions: [CVDAction]) {
		alertActions.append(contentsOf: actions)
	}
	
	
	func setupAlertSheet() {
		sheetHeight = 30.0
		
		let images = ["destruct" : ["up": "red", "pressed" : "red pressed"],
		              "navigation" :["up": "purple", "pressed" : "purple pressed"],
		              "default" : ["up": "purple", "pressed" : "purple pressed"],
		              "cancel" : ["up": "outline", "pressed" : "outline"]]
		
		self.titleLabel.text = titleMessage
		self.titleLabel.font = AlertTitleStyle.textFont
		let titleHeight = calculateTextHeight(message: self.titleMessage,  forWidth: sheetWidth - 16.0, font: AlertTitleStyle.textFont)
		sheetHeight += titleHeight
		sheetHeight += 14.0
		
		self.descriptionLabel.text = descriptionMessage
		self.descriptionLabel.font = TextItemStyle.textFont
		if nil != self.descriptionMessage {
			let subtitleHeight = calculateTextHeight(message: self.descriptionMessage!, forWidth: sheetWidth - 16.0, font: TextItemStyle.textFont)
			sheetHeight += subtitleHeight
		}
		sheetHeight += 20.0
		
		self.view.addSubview(self.sheetView)
		
		for action in alertActions {
			let buttonWidth = action.isShort ? shortWidth : longWidth
			let buttonOffsetX = (sheetWidth - buttonWidth) / 2.0
			
			var cvdButton: CVDButton!
			
			switch action.actionType {
			case CVDActionType.destruct:
				cvdButton = CVDButton(action: action, up: images["destruct"]!["up"]!, pressed: images["destruct"]!["pressed"]!,target: self)
				
			case CVDActionType.done:
				cvdButton = CVDButton(action: action, up: images["default"]!["up"]!, pressed: images["default"]!["pressed"]!, target: self)
				
			case CVDActionType.navigate:
				cvdButton = CVDButton(action: action, up: images["navigate"]!["up"]!, pressed: images["navigate"]!["pressed"]!, target: self)
				
			case CVDActionType.cancel:
				cvdButton = CVDButton(action: action, up: images["cancel"]!["up"]!, pressed: images["cancel"]!["pressed"]!, target: self,
					fontColor: UIColor(palette: ColorPalette.almostBlack),
					pressedColor: UIColor(palette: ColorPalette.greyishBrown))
			}
			
			sheetHeight += 14.0
			self.sheetView.addSubview(cvdButton.button)
			cvdButton.button.frame = CGRect(x: buttonOffsetX, y: sheetHeight, width: buttonWidth, height: buttonHeight)
			sheetHeight += 44.0
			cvdButtons.append(cvdButton!)
		}
		
		sheetHeight += 40.0
		
		let origin = CGPoint(x: (self.view.frame.size.width - sheetWidth)/2.0, y: (self.view.frame.size.height - sheetHeight)/2.0)
		self.sheetView.frame = CGRect(origin: origin, size: CGSize(width: sheetWidth, height: sheetHeight))
		self.sheetView.layer.cornerRadius = 6.0
		self.sheetView.clipsToBounds = true
	}
	
	
	func buttonAction(_ sender: UIButton) {
		var action: CVDAction?
		for alertbutton in cvdButtons {
			if sender == alertbutton.button {
				action = alertbutton.action
				break
			}
		}
		self.hideAlert(completion: action?.handler)
	}
	
	
	func showAlert() {
		self.sheetView.alpha = 0.0
		
		UIView.animate(withDuration: self.duration, delay: 0.0, options: UIViewAnimationOptions.curveEaseInOut, animations: {
			self.stageView.alpha = 0.7
		}, completion: { (animated) in
			UIView.animate(withDuration: self.duration/2.0, delay: 0.0, options: UIViewAnimationOptions.curveEaseInOut, animations: {
				self.stageView.alpha = 0.48
				self.sheetView.alpha = 1.0
			}, completion: nil)
		})
	}
	
	
	func hideAlert(completion: CVDHandler?) {
		UIView.animate(withDuration: self.duration, delay: 0.0, options: UIViewAnimationOptions.curveEaseInOut, animations: {
			self.sheetView.alpha = 0.0
			self.stageView.alpha = 0.0
		}, completion: { (animated) in
			self.dismiss(animated: false, completion: nil)
			completion?()
		})
	}
}
