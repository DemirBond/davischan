//
//  DemoController.swift
//  CVDEvaluator
//
//  Created by IgorKhomiak on 2/8/17.
//  Copyright © 2017 IgorKhomiak. All rights reserved.
//

import UIKit


class DemoController: BaseController, UIScrollViewDelegate, CAAnimationDelegate {
	
	@IBOutlet weak var scrollView: UIScrollView!
	@IBOutlet weak var panelView: UIView!
	@IBOutlet weak var pageControl: UIPageControl!
	
	@IBOutlet weak var contiuneButton: UIButton!
	
	static let demoHomeSegueID = "demoHomeSegueID"
	
	override var createdID: String! { return "demo" }
	
	var currentPageNum = 0
	let imageNames = ["demo1", "demo2", "demo3", "demo4"]
	let descriptions = ["Heart Check is an app that puts the power of a cardiologist in your pocket.",
	                    "Just look thourgh the different categories and pick out the symptoms you see",
	                    "The app has every sympton you would likely think of. No cardiologist needed when using this!",
	                    "At the end you are given a detailed diagnosis based on the power of the cloud."]
	
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		self.pageControl.numberOfPages = imageNames.count
		self.pageControl.currentPage = 0
		self.contiuneButton.isHidden = false //true
		self.scrollView.delegate = self
		
		let button = UIButton()
		button.setTitle("Continue", for: .normal)
		button.addTarget(self, action: #selector(continueButton), for: .touchUpInside)
		
		let barButton = UIBarButtonItem(title: "Continue", style: .done, target: self, action: #selector(continueButton) )
		barButton.tintColor = UIColor(palette: ColorPalette.purple)
		
		self.navigationItem.rightBarButtonItem = barButton  //  button
		
	}
	
	
	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		
		//self.navigationController?.setToolbarHidden(true, animated: false)
	}
	
	
	override func viewDidAppear(_ animated: Bool) {
		super.viewDidAppear(animated)
		
		self.navigationItem.hidesBackButton = true
		
		self.scrollView.contentSize = CGSize(width: self.panelView.frame.size.width * CGFloat(imageNames.count), height: self.panelView.frame.size.height)
		var offsetX = CGFloat(0.0)
		for (index, value) in imageNames.enumerated() {
			let viewRect = CGRect(x: offsetX, y: 0.0, width: self.panelView.frame.size.width, height: self.panelView.frame.size.height)
			if let demoView = DemoView.extract(name: value, description: descriptions[index]) {
				demoView.frame = viewRect
				self.scrollView.addSubview(demoView)
				
			}
			offsetX += self.panelView.frame.size.width
		}
		
		let animation: CATransition = CATransition()
		animation.delegate = self
		animation.type = kCATransitionFade
		animation.duration = 0.7
		animation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
		
		self.scrollView.layer.add(animation, forKey: "FadeAnimation")
		
		NSLog("page %@", pageControl.currentPage);
		
		if (pageControl.currentPage == 3) {
			self.contiuneButton.isHidden = false;
		}
	}
	
	
	func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
	 
		let indexOfPage = scrollView.contentOffset.x / scrollView.frame.size.width; //your stuff with index
		print("the index is \(indexOfPage)")
		
		self.pageControl.currentPage = Int(indexOfPage)
		
	}
	
	
	override func bottomRightButtonAction(_ sender: UIBarButtonItem) {
		if currentPageNum < imageNames.count-1 {
			currentPageNum += 1
			pageControl.currentPage = currentPageNum
			let offsetX = self.view.frame.size.width * CGFloat(currentPageNum)
			self.scrollView.scrollRectToVisible(CGRect(x: offsetX, y: 0.0, width: self.view.frame.size.width, height: 1.0), animated: true)
			
		} else {
			self.performSegue(withIdentifier: DemoController.demoHomeSegueID, sender: nil)
		}
	}
	
	
	@IBAction func continueButtonPressed(_ sender: Any) {
		print("button pressed")
		self.performSegue(withIdentifier: DemoController.demoHomeSegueID, sender: nil)
	}
	
	
	func continueButton(){
		print("button pressed")
		self.performSegue(withIdentifier: DemoController.demoHomeSegueID, sender: nil)
	}
	
	
	override func bottomRightButtonAction1(_ sender: UIBarButtonItem) {
		self.performSegue(withIdentifier: DemoController.demoHomeSegueID, sender: nil)
	}
	
}
