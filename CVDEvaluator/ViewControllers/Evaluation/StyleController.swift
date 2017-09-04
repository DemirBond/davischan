//
//  StyleController.swift
//  CVDEvaluator
//
//  Created by IgorKhomiak on 3/13/17.
//  Copyright © 2017 IgorKhomiak. All rights reserved.
//

import UIKit


class StyleController: UIViewController {

	@IBOutlet weak var sheetView: UIView!
	@IBOutlet weak var backView: UIView!
	@IBOutlet weak var doneButton: UIBarButtonItem!
	@IBOutlet weak var toolBar: UIToolbar!
	@IBOutlet var headers : [FontSetView]!
	
	let duration: TimeInterval = 0.2
	let sheetHeight: CGFloat = 94.0

	
	override func viewDidLoad() {
		super.viewDidLoad()

		let tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.removeMessage))
		self.view.addGestureRecognizer(tapRecognizer)
		
		for (index, item) in headers.enumerated() {
			item.applySettings(font: CVDStyle.style.fonts[index], size: CVDStyle.style.fontSizeArray[index])
			item.delegate = (self.presentingViewController as? UINavigationController)?.topViewController as? FontChanging
		}
    }


	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		
		self.backView.alpha = 0.0
		self.sheetView.alpha = 0.0
		
		showMessage()
		updateSelection()
	}
	
	
	private func showMessage() {
		UIView.animate(withDuration: self.duration, delay: 0.0, options: UIViewAnimationOptions.curveEaseInOut, animations: {
			self.backView.alpha = 0.55
		}, completion: { (animated) in
			UIView.animate(withDuration: self.duration/2.0, delay: 0.0, options: UIViewAnimationOptions.curveEaseInOut, animations: {
				self.backView.alpha = 0.48
				self.sheetView.alpha = 1.0
			}, completion: nil)
		})
	}
	
	
	func removeMessage() {
		hideMessage()
	}
	
	
	func updateSelection() {
		for item in headers {
			if item.fontSize != CVDStyle.style.currentFontSize {
				item.deselectSizeItem()
			} else {
				item.selectSizeItem()
			}
		}
	}
	
	
	private func hideMessage() {
		UIView.animate(withDuration: self.duration, delay: 0.0, options: UIViewAnimationOptions.curveEaseInOut, animations: {
			self.sheetView.alpha = 0.0
			self.backView.alpha = 0.0
		}, completion: { (animated) in
			self.dismiss(animated: false, completion: nil)
		})
	}

	
	@IBAction func doneAction(_ sender: AnyObject) {
		hideMessage()
	}

}
