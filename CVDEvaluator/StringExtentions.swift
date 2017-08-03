//
//  StringExtentions.swift
//  CVDEvaluator
//
//  Created by Ahmet Küçük on 5/18/17.
//  Copyright © 2017 IgorKhomiak. All rights reserved.
//

import Foundation
import CoreData
import UIKit

extension NSMutableAttributedString {
	
	public func setAsLink(textToFind:String, linkURL:String) -> Bool {
		
		let foundRange = self.mutableString.range(of: textToFind)
		if foundRange.location != NSNotFound {
			self.addAttribute(NSLinkAttributeName, value: linkURL, range: foundRange)
			return true
		}
		return false
	}
}

extension String {
	var html2AttributedString: NSAttributedString? {
		do {
			return try NSAttributedString(data: Data(utf8), options: [NSDocumentTypeDocumentAttribute: NSHTMLTextDocumentType, NSCharacterEncodingDocumentAttribute: String.Encoding.utf8.rawValue], documentAttributes: nil)
		} catch {
			print(error)
			return nil
		}
	}
	var unicodes: [UInt32] { return unicodeScalars.map{$0.value} }
}

extension Data {
	var attributedString: NSAttributedString? {
		do {
			return try NSAttributedString(data: self, options:[NSDocumentTypeDocumentAttribute: NSHTMLTextDocumentType, NSCharacterEncodingDocumentAttribute: String.Encoding.utf8.rawValue], documentAttributes: nil)
		} catch {
			print(error)
		}
		return nil
	}
}

extension String {
	var data: Data {
		return Data(utf8)
	}
}
