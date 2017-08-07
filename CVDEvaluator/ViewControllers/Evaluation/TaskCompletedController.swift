//
//  TaskCompletedController.swift
//  CVDEvaluator
//
//  Created by Davis Chan on 8/7/17.
//  Copyright © 2017 IgorKhomiak. All rights reserved.
//

import UIKit

class TaskCompletedController: UIViewController, CAAnimationDelegate {
	
	@IBOutlet weak var completeView: UIView!
	@IBOutlet weak var completeIcon: UIImageView!
	@IBOutlet weak var completeMessage: UILabel!
	
	var message: String?
	var icon: UIImage?
	
	let duration: TimeInterval = 0.45
	private var sheetHeight: CGFloat = 0.0
	
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		// Do any additional setup after loading the view.
		
		if nil != message {
			self.completeMessage.text = message
		}
		
		self.completeView.backgroundColor = UIColor(red: 255.0, green: 255.0, blue: 255.0, alpha: 0.0)
		self.completeView.clipsToBounds = true
		
		let animation: CATransition = CATransition()
		animation.delegate = self
		animation.type = kCATransitionFade
		animation.duration = 0.7
		animation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
		
		self.completeView.layer.add(animation, forKey: "FadeAnimation")
		self.completeView.backgroundColor = UIColor(red: 255.0, green: 255.0, blue: 255.0, alpha: 1.0)
		
		Timer.scheduledTimer(timeInterval: 3.0,
		                     target: self,
		                     selector: #selector(self.hideMessage),
		                     userInfo: nil,
		                     repeats: false)
	}
	
	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}
	
	
	func hideMessage() {

		self.completeView.backgroundColor = UIColor(red: 255.0, green: 255.0, blue: 255.0, alpha: 0.0)
		
		self.dismiss(animated: false, completion: nil)
		
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
