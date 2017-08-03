//
//  AuxiliaryFunctions.swift
//  CVDEvaluator
//
//  Created by IgorKhomiak on 2/22/17.
//  Copyright © 2017 IgorKhomiak. All rights reserved.
//

import Foundation
import UIKit


func resizibleImage(named: String, highlighted: String) -> (UIImage, UIImage) {
	let imageUp = UIImage(named: named)
	let imageDown = UIImage(named: highlighted)
	let resizableUp = imageUp!.resizableImage(withCapInsets: UIEdgeInsets(top: 0.0, left: 50.0, bottom: 0.0, right: 50.0), resizingMode: .stretch)
	let resizableDown = imageDown!.resizableImage(withCapInsets: UIEdgeInsets(top: 0.0, left: 50.0, bottom: 0.0, right: 50.0), resizingMode: .stretch)
	
	return (resizableUp, resizableDown)
}

func calculateTextHeight(message: String, forWidth width: CGFloat, font: UIFont) -> CGFloat {
	
	let constraintRect = CGSize(width: width, height: 5000.0)
	
	let boundingBox = message.boundingRect(with: constraintRect,
		options: NSStringDrawingOptions.usesLineFragmentOrigin,
		attributes: [NSFontAttributeName: font], context: nil)
	
	return boundingBox.size.height
}


func validateEmail(mail: String) -> Bool {
	
	let emailFormat = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
	let emailPredicate = NSPredicate(format:"SELF MATCHES %@", emailFormat)
	return emailPredicate.evaluate(with: mail)
}
