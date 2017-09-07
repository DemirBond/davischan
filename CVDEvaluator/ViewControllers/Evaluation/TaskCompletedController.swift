//
//  TaskCompletedController.swift
//  CVDEvaluator
//
//  Created by Davis Chan on 8/7/17.
//  Copyright © 2017 IgorKhomiak. All rights reserved.
//

import UIKit

class TaskCompletedController: UIViewController, CAAnimationDelegate {
	
	@IBOutlet weak var backView: UIView!
	@IBOutlet weak var completeView: UIView!
	@IBOutlet weak var completeIcon: UIImageView!
	@IBOutlet weak var completeMessage: UILabel!
	
	var message: String?
	var icon: UIImage?
	
	let duration: TimeInterval = 0.2
	private let sheetWidth: CGFloat = 200.0
	private var sheetHeight: CGFloat = 200.0
	
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		// Do any additional setup after loading the view.
		
		if nil != message {
			self.completeMessage.text = message
		}
		
		self.completeView.alpha = 0.0
	}
	
	
	override func viewDidLayoutSubviews() {
		super.viewDidLayoutSubviews()
		
		self.view.addSubview(self.completeView)
		
		let origin = CGPoint(x: (self.view.frame.size.width - self.sheetWidth)/2.0, y: (self.view.frame.size.height - self.sheetHeight)/2.0)
		self.completeView.frame = CGRect(origin: origin, size: CGSize(width: self.sheetWidth, height: self.sheetHeight))
		self.completeView.layer.cornerRadius = 6.0
		self.completeView.clipsToBounds = true
	}
	
	
	override func viewDidAppear(_ animated: Bool) {
		super.viewDidAppear(animated)
		
		self.showMessage()
	}
	
	
	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}
	
	
	func showMessage() {
		self.completeView.alpha = 0.0
		
		UIView.animate(withDuration: self.duration, delay: 0.0, options: UIViewAnimationOptions.curveEaseInOut, animations: {
			self.backView.alpha = 0.7
		}, completion: { (animated) in
			UIView.animate(withDuration: self.duration/2.0, delay: 0.0, options: UIViewAnimationOptions.curveEaseInOut, animations: {
				self.backView.alpha = 0.48
				self.completeView.alpha = 1.0
			}, completion: nil)
		})
		
		Timer.scheduledTimer(timeInterval: 3.0,
		                     target: self,
		                     selector: #selector(self.hideMessage),
		                     userInfo: nil,
		                     repeats: false)
	}
	
	
	func hideMessage() {
		UIView.animate(withDuration: 0.3, delay: 0.0, options: UIViewAnimationOptions.curveEaseInOut, animations: {
			self.backView.alpha = 0.0
			self.completeView.alpha = 0.0
		}, completion: { (animated) in
			self.dismiss(animated: false, completion: nil)
		})
	}

	
	
	/*
	// MARK: - Navigation
	
	// In a storyboard-based application, you will often want to do a little preparation before navigation
	override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
	// Get the new view controller using segue.destinationViewController.
	// Pass the selected object to the new view controller.
	}
	*/

}
