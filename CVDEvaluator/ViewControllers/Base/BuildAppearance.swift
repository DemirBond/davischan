//
//  BuildAppearance.swift
//  CVDEvaluator
//
//  Created by IgorKhomiak on 2/9/17.
//  Copyright © 2017 IgorKhomiak. All rights reserved.
//

import Foundation
import UIKit

protocol BuildAppearance {
	
	var pageForm: EvaluationItem {get set}
	
	var createdID: String!  {get}
	var generatedID: String?  {get}
	
	func setupAppearance()
	
	func leftButtonAction(_ sender: UIBarButtonItem)
	func rightTextButtonAction(_ sender: UIBarButtonItem)
	func rightListButtonAction(_ sender: UIBarButtonItem)
	func rightMenuButtonAction(_ sender: UIBarButtonItem)
	
	func bottomRightButtonAction(_ sender: UIBarButtonItem)
	func bottomRightButtonAction1(_ sender: UIBarButtonItem)
}

protocol FontChanging {
	func userDidChoose(font: UIFont, withSize size: CGFloat)
}
