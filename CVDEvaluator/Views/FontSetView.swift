//
//  FontSetView.swift
//  CVDEvaluator
//
//  Created by IgorKhomiak on 3/13/17.
//  Copyright © 2017 IgorKhomiak. All rights reserved.
//

import UIKit

class FontSetView: UIView {

	@IBOutlet weak var sizeButton: UIButton!
	@IBOutlet weak var fontLabel: UILabel!
	@IBOutlet weak var underscoreView: UIView!
	
	var delegate: FontChanging?
	var fontSize: CGFloat!
	
	private(set) var font: UIFont = CVDStyle.style.fonts[1] // fontsize - 17
	
	func applySettings(font: UIFont, size: CGFloat) {
		self.font = font
		self.fontSize = size
		self.fontLabel.font = self.font
		self.fontLabel.textColor = CVDStyle.style.subtitleColor
	}
	
	@IBAction func changeFontActon(_ sender: AnyObject) {
		self.delegate?.userDidChoose(font: self.font, withSize: fontSize)
		selectSizeItem()
	}
	
	
	func selectSizeItem() {
		self.underscoreView.backgroundColor = UIColor(palette: ColorPalette.purple)
		self.fontLabel.textColor = CVDStyle.style.defaultFontColor
	}
	func deselectSizeItem() {
		self.underscoreView.backgroundColor = UIColor.clear
		self.fontLabel.textColor = CVDStyle.style.subtitleColor
	}

}
