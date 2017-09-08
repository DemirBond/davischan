//
//  SideMenuController.swift
//  CVDEvaluator
//
//  Created by Davis Chan on 9/8/17.
//  Copyright © 2017 IgorKhomiak. All rights reserved.
//

import UIKit


struct MenuButton {
	
	let action: MenuAction
	weak var target: AnyObject?
	var button: UIButton
	var textColor = UIColor(palette: ColorPalette.black) ?? UIColor.black
	var highlightedColor = UIColor(palette: ColorPalette.cosmicLatte) ?? UIColor.lightGray
	
	
	init(action: MenuAction, target: AnyObject?, fontColor: UIColor? = nil, pressedColor: UIColor? = nil) {
		
		self.action = action
		
		self.target = target
		self.button = UIButton(type: UIButtonType.custom)
		if let color = fontColor {
			self.textColor = color
		}
		if let color = pressedColor {
			self.highlightedColor = color
		}
		
		self.button.setTitle(action.title, for: UIControlState.normal)
		self.button.setTitleColor(textColor, for: UIControlState.normal)
		self.button.setTitleColor(highlightedColor, for: UIControlState.highlighted)
		self.button.titleLabel?.font = UIFont(name: "HelveticaNeue", size: 16)
		self.button.addTarget(target, action: #selector(SideMenuController.buttonAction), for: UIControlEvents.touchUpInside)
	}
}


class SideMenuController: UIViewController {

	@IBOutlet weak var backView: UIView!
	@IBOutlet weak var sheetView: UIView!
	@IBOutlet weak var sheetHeightConstraint: NSLayoutConstraint!
	
	let duration: TimeInterval = 0.3
	var sheetHeight: CGFloat = 0.0
	
	private var menuButtons = [MenuButton]()
	
	fileprivate(set) var menuActions = [MenuAction]()
	
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		// Do any additional setup after loading the view.
		let tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.removeMenu))
		self.view.addGestureRecognizer(tapRecognizer)
		
		self.backView.alpha = 0.0
		setupMenuSheet()
	}
	
	
	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		
		self.backView.alpha = 0.0
		self.sheetView.alpha = 0.0
		
		showMenu()
	}

	
	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}
	
	
	func addActions(_ actions: [MenuAction]) {
		menuActions.append(contentsOf: actions)
	}
	
	
	func setupMenuSheet() {
		sheetHeight = 0.0
		
		for action in menuActions {
			var menuButton: MenuButton!
			menuButton = MenuButton(action: action, target: self)
			
			self.sheetView.addSubview(menuButton.button)
			menuButton.button.frame = CGRect(x: 0, y: sheetHeight, width: 150, height: 40)
			
			if Int(sheetHeight/40) < menuActions.count - 1 {
				let seperator: UIView = UIView(frame: CGRect(x: 0, y: sheetHeight + 40.0, width: 150, height: 1))
				seperator.backgroundColor = UIColor(palette: ColorPalette.lineGray)
				self.sheetView.addSubview(seperator)
			}
			
			sheetHeight += 40.0
			menuButtons.append(menuButton!)
		}
		
		let origin = CGPoint(x: self.view.frame.size.width, y: 68)
		self.sheetView.frame = CGRect(origin: origin, size: CGSize(width: 130, height: sheetHeight))
		
		self.sheetView.layer.borderWidth = 0.0
		self.sheetView.layer.shadowColor = UIColor(palette: ColorPalette.warmGrey)?.cgColor
		self.sheetView.layer.shadowOffset = CGSize(width: 1.0, height: 2.0)
		self.sheetView.layer.shadowRadius = 2.0
		self.sheetView.layer.shadowOpacity = 0.8
		self.sheetView.layer.masksToBounds = false
		self.sheetView.layer.cornerRadius = 0.0
		
		self.sheetHeightConstraint.constant = sheetHeight
	}
	
	
	func buttonAction(_ sender: UIButton) {
		var action: MenuAction?
		for menuButton in menuButtons {
			if sender == menuButton.button {
				action = menuButton.action
				break
			}
		}
		self.hideMenu(completion: action?.handler)
	}
	
	
	func removeMenu() {
		self.hideMenu(completion: nil)
	}
	
	
	private func showMenu() {
		UIView.animate(withDuration: self.duration, delay: 0.0, options: UIViewAnimationOptions.curveEaseInOut, animations: {
			self.backView.alpha = 0.0
		}, completion: { (animated) in
			UIView.animate(withDuration: self.duration/2.0, delay: 0.0, options: UIViewAnimationOptions.curveEaseInOut, animations: {
				self.backView.alpha = 0.0
				self.sheetView.alpha = 1.0
			}, completion: nil)
		})
	}
	
	
	private func hideMenu(completion: MenuHandler?) {
		UIView.animate(withDuration: self.duration, delay: 0.0, options: UIViewAnimationOptions.curveEaseInOut, animations: {
			self.sheetView.alpha = 0.0
			self.backView.alpha = 0.0
		}, completion: { (animated) in
			self.dismiss(animated: false, completion: nil)
			completion?()
		})
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
