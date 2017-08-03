//
//  MessageController.swift
//  CVDEvaluator
//
//  Created by IgorKhomiak on 2/21/17.
//  Copyright © 2017 IgorKhomiak. All rights reserved.
//

import UIKit

class MessageController: UIViewController {
	
	let duration: TimeInterval = 0.45
	private var sheetHeight: CGFloat = 0.0
	
	@IBOutlet weak var messageLabel: UILabel!
	@IBOutlet weak var decriptionLabel: UILabel!
	@IBOutlet weak var sheetView: UIView!
	@IBOutlet weak var okButton: UIButton?
	
	var message: String?
	var descriptionMessage: String?

	override func viewDidLoad() {
		super.viewDidLoad()
		sheetHeight = 20.0
		
		let tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(MessageController.removeMessage))
		self.view.addGestureRecognizer(tapRecognizer)
		if nil != message {
			self.messageLabel.text = message
			let subtitleHeight = calculateTextHeight(message: message!, forWidth: sheetWidth - 16.0, font: TextItemStyle.textFont)
			sheetHeight += subtitleHeight
		}
		
		sheetHeight += 8.0
		
		if nil != descriptionMessage {
			self.decriptionLabel.text = descriptionMessage
			let subtitleHeight = calculateTextHeight(message: descriptionMessage!, forWidth: sheetWidth - 16.0, font: TextItemStyle.textFont)
			sheetHeight += subtitleHeight
		}
		
		sheetHeight += 8.0
		
		Timer.scheduledTimer(timeInterval: 3.0,
			target: self,
			selector: #selector(self.hideMessage),
			userInfo: nil,
			repeats: false)
	}
	
	
	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		self.sheetView.frame = CGRect(x: 0.0, y: -sheetHeight, width: self.view.frame.size.width, height: sheetHeight)
	}
	
	
	func showMessage() {
		self.sheetView.frame.origin = CGPoint(x: 0.0, y: -self.sheetView.frame.size.height)

		UIView.animate(withDuration: duration, animations: {
			self.sheetView.frame.origin = CGPoint.zero
		})
	}
	
	func removeMessage() {
		self.dismiss(animated: false, completion: nil)
	}

	
	func hideMessage() {
		UIView.animate(withDuration: self.duration, delay: 0.0, options: UIViewAnimationOptions.curveEaseInOut, animations: {
			self.sheetView.frame.origin = CGPoint(x: 0.0, y: -self.sheetView.frame.size.height)
		}, completion: { (animated) in
			self.dismiss(animated: false, completion: nil)
		})
	}
	
	
}
