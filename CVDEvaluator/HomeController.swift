//
//  HomeController.swift
//  CVDEvaluator
//
//  Created by IgorKhomiak on 1/30/17.
//  Copyright © 2017 IgorKhomiak. All rights reserved.
//

import UIKit

class HomeCell: UITableViewCell {
	@IBOutlet weak var titleLabel: UILabel!
	@IBOutlet weak var descriptionLabel: UILabel!
	@IBOutlet weak var icon: UIImageView!
	@IBOutlet weak var buttonContentView: UIView!
}


class HomeController: BaseController, UITableViewDelegate, UITableViewDataSource {
	
	static let settingsSegueID = "settingsSegueID"
	static let evaluationSegueID = "evaluationSegueID"
	static let newEvaluationSegueID = "newEvaluationSegueID"
	static let savedEvaluationSegueID = "savedEvaluationSegueID"
	
	@IBOutlet weak var tableView: UITableView!
	
	override var createdID: String! { return "home" }
	
	var cellHeight: CGFloat = 150.0
	
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		tableView.tableFooterView = UIView()
	}
	
	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		
		self.navigationController?.setToolbarHidden(true, animated: false)
		
		DataManager.manager.fetchEvaluations()
		cellHeight = min(255, (self.view.frame.size.height - 64.0) / 2.0)
		
		self.tableView.reloadData()
	}
	
	override func viewDidAppear(_ animated: Bool) {
		super.viewDidAppear(animated)
		
		self.navigationItem.hidesBackButton = true
		
		if let index = self.tableView.indexPathForSelectedRow{
			self.tableView.deselectRow(at: index, animated: true)
		}
	}
	
	override func rightButtonAction(_ sender: UIBarButtonItem) {
		performSegue(withIdentifier: HomeController.settingsSegueID, sender: nil)
	}
	
	
	func numberOfSections(in tableView: UITableView) -> Int {
		return 1
	}
	
	
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return DataManager.manager.hasSavedEvaluations() ? 2 : 1
	}
	
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		
		switch indexPath.row {
		case 0:
			let cell = tableView.dequeueReusableCell(withIdentifier: "HomeCell", for: indexPath) as! HomeCell
			cell.titleLabel.text = "New Evaluation".localized
			cell.descriptionLabel.text = "Create a new evaluation\nfor a patient".localized
			cell.icon.image = UIImage(named: "clipboard")
			
			let shadowSize : CGFloat = 5.0
			let shadowPath = UIBezierPath(rect: CGRect(x: -shadowSize / 2,
			                                           y: -shadowSize / 2,
			                                           width: cell.buttonContentView.frame.size.width + shadowSize,
			                                           height: cell.buttonContentView.frame.size.height + shadowSize))
			/*
			cell.buttonContentView.layer.masksToBounds = false
			cell.buttonContentView.layer.shadowColor = UIColor.black.cgColor
			cell.buttonContentView.layer.shadowOffset = CGSize(width: -5.0, height: -5.0)
			cell.buttonContentView.layer.shadowOpacity = 1.0
			*/
			// cell.buttonContentView.layer.shadowPath = shadowPath.cgPath
			
			return cell
			
		case 1:
			let cell = tableView.dequeueReusableCell(withIdentifier: "HomeCell", for: indexPath) as! HomeCell
			cell.titleLabel.text = "Saved Evaluations".localized
			cell.descriptionLabel.text = "View and edit previously saved\nevaluations".localized
			cell.icon.image = UIImage(named: "folder")
			return cell
			
		default:
			return UITableViewCell()
		}
	}
	
	func setButtonShadows(cell:HomeCell){
		let shadowSize : CGFloat = 5.0
		let shadowPath = UIBezierPath(rect: CGRect(x: -shadowSize / 2,
		                                           y: -shadowSize / 2,
		                                           width: cell.buttonContentView.frame.size.width + shadowSize,
		                                           height: cell.buttonContentView.frame.size.height + shadowSize))
		cell.buttonContentView.layer.masksToBounds = false
		cell.buttonContentView.layer.shadowColor = UIColor.black.cgColor
		cell.buttonContentView.layer.shadowOffset = CGSize(width: 0.0, height: 0.0)
		cell.buttonContentView.layer.shadowOpacity = 0.5
		cell.buttonContentView.layer.shadowPath = shadowPath.cgPath
	}
	
	func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
		return cellHeight
	}

	
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		if indexPath.row == 0 {
			DataManager.manager.evaluation = Evaluation()
			performSegue(withIdentifier: HomeController.newEvaluationSegueID, sender: nil)
		} else {
			performSegue(withIdentifier: HomeController.savedEvaluationSegueID, sender: nil)
		}
	}
		
}
