//
//  CESplashController.swift
//  CVDEvaluator
//
//  Created by Davis Chan on 8/3/17.
//  Copyright © 2017 IgorKhomiak. All rights reserved.
//

import UIKit

class CESplashController: UIViewController {
	
	@IBOutlet weak var gotoLogin: UIButton!
	@IBOutlet weak var gotoSignin: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
		
		gotoLogin.layer.cornerRadius = gotoLogin.frame.size.height / 2
		gotoLogin.layer.borderColor = UIColor.white.cgColor
		gotoLogin.layer.borderWidth = 2.0
		
		gotoSignin.layer.cornerRadius = gotoSignin.frame.size.height / 2
		gotoSignin.layer.borderColor = UIColor.white.cgColor
		gotoSignin.layer.borderWidth = 2.0
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
