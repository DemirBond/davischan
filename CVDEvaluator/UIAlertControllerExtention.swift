//
//  HexExtention.swift
//  CVDEvaluator
//
//  Created by IgorKhomiak on 1/31/17.
//  Copyright © 2017 IgorKhomiak. All rights reserved.
//

import UIKit


extension UIAlertController {
	
	public static func infoAlert(message: String?, title: String?, viewcontroller: UIViewController, handler: @escaping (() -> Void) ) {
		let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
		let defaultAction = UIAlertAction(title: "OK", style: .default, handler: { (UIAlertAction) -> Void in
				handler()
		}  )
		alertController.addAction(defaultAction)
		viewcontroller.present(alertController, animated: true, completion: nil)
	}
}
