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
	@IBOutlet weak var doneButton: UIBarButtonItem!
	@IBOutlet weak var toolBar: UIToolbar!
	@IBOutlet var headers : [FontSetView]!
	
	let duration: TimeInterval = 0.45
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
		self.sheetView.frame = CGRect(x: 0.0, y: self.view.frame.size.height, width: self.view.frame.size.width, height: sheetHeight)
		
		showMessage()
		updateSelection()
	}
	
	
	 private func showMessage() {
		
		UIView.animate(withDuration: self.duration, delay: 0.0, options: UIViewAnimationOptions.curveEaseInOut, animations: {
			self.sheetView.frame = CGRect(x: 0.0, y: self.view.frame.size.height - self.sheetHeight,
				width: self.view.frame.size.width, height: self.sheetHeight)
		}, completion: { (animated) in
			()
		})
	}
	
	
	func removeMessage() {
		self.dismiss(animated: false, completion: nil)
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
			self.sheetView.frame = CGRect(x: 0.0, y: self.view.frame.size.height, width: self.view.frame.size.width, height: self.sheetHeight)
		}, completion: { (animated) in
			self.dismiss(animated: false, completion: nil)
		})
	}

	
	@IBAction func doneAction(_ sender: AnyObject) {
		hideMessage()
	}

}
