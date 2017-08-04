//
//  PoliciesController.swift
//  CVDEvaluator
//
//  Created by IgorKhomiak on 3/16/17.
//  Copyright © 2017 IgorKhomiak. All rights reserved.
//

import UIKit


class PoliciesController: BaseController {

	@IBOutlet weak var textView: UITextView!

	override var createdID: String! { return "policies" }
	
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		self.navigationController?.setToolbarHidden(true, animated: false)
		self.title = self.pageForm.title
	}
	
	
	
	// MARK: - Actions
	
	@IBAction func printAction(_ sender: AnyObject) {
		let attrs = [NSFontAttributeName: UIFont.systemFont(ofSize: 10), NSForegroundColorAttributeName: UIColor.black] as [String : Any]
		let str = NSAttributedString(string: textView.text, attributes: attrs)
		let print = UISimpleTextPrintFormatter(attributedText: str)
		
		let vc = UIActivityViewController(activityItems: [print], applicationActivities: nil)
		present(vc, animated: true)
	}
	
}
