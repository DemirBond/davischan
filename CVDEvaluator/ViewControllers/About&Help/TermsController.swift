//
//  TermsController.swift
//  CVDEvaluator
//
//  Created by IgorKhomiak on 3/16/17.
//  Copyright © 2017 IgorKhomiak. All rights reserved.
//

import UIKit


class TermsController: BaseController {
	
	@IBOutlet weak var textView: UITextView!
	
	
	override func viewDidLoad() {
		super.viewDidLoad()

		self.navigationController?.setToolbarHidden(true, animated: false)
		self.title = self.pageForm.title
	}
	
	
	
	// MARK: - Actions
	
	@IBAction func printAction(_ sender: AnyObject) {
		let str: NSAttributedString =  textView.attributedText
		let print = UISimpleTextPrintFormatter(attributedText: str)
			
		let vc = UIActivityViewController(activityItems: [print], applicationActivities: nil)
		present(vc, animated: true)
	}

}
