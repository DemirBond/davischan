//
//  ReferencesController.swift
//  CVDEvaluator
//
//  Created by Ahmet Küçük on 5/19/17.
//  Copyright © 2017 IgorKhomiak. All rights reserved.
//

import UIKit

class ReferencesController: UIViewController, UIWebViewDelegate {
	
	var referenceHtml: String?
	
    @IBOutlet var referenceWebView: UIWebView!
	
	override func viewDidLoad() {
		super.viewDidLoad()
		

		referenceHtml = DataManager.manager.evaluation!.outputInMain.references.subtitle
		
		if referenceHtml != nil && referenceWebView != nil {
			referenceWebView.loadHTMLString(referenceHtml!, baseURL: nil)
		}
		
		// Do any additional setup after loading the view.
	}
    
    
    public func webViewDidStartLoad(_ webView: UIWebView) {
        
    }
    
    
    public func webViewDidFinishLoad(_ webView: UIWebView) {
        
    }
	
	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}
	
	public func webView(_ webView: UIWebView, shouldStartLoadWith request: URLRequest, navigationType: UIWebViewNavigationType) -> Bool {
		print("in On Click Link")
		
		switch navigationType {
		case .linkClicked:
			// Open links in Safari
			guard let url = request.url else { return true }
			
			if #available(iOS 10.0, *) {
				UIApplication.shared.open(url, options: [:], completionHandler: nil)
			} else {
				// openURL(_:) is deprecated in iOS 10+.
				UIApplication.shared.openURL(url)
			}
			return false
		default:
			// Handle other navigation types...
			return true
		}

	}
	
}
