//
//  RateController.swift
//  CVDEvaluator
//
//  Created by bogdankosh on 3/17/17.
//  Copyright © 2017 IgorKhomiak. All rights reserved.
//

import UIKit


class RateController: BaseTableController {
	
	
	override func viewDidLoad() {
		super.viewDidLoad()
		self.navigationController?.setToolbarHidden(true, animated: false)
		self.title = self.pageForm.title
	}
	
	
	// MARK: - Table view data source
	
	override func numberOfSections(in tableView: UITableView) -> Int {
		return 1
	}
	
	
	override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return self.pageForm.items.count
	}
	
	
	
	// MARK: - Table view delegates
	
	override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		
		let itemModel = pageForm.items[indexPath.row]
		
		let cellType = itemModel.form.itemType
		let cell = tableView.dequeueReusableCell(withIdentifier: cellType.reuseIdentifier(), for: indexPath) as! GeneratedCell
		cell.accessoryBar = self.accessoryBar
		cell.delegate = self
		cell.cellModel = itemModel
		cell.selectionStyle = .none
		
		return cell
	}
	
	
	override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
		return 60.0
	}

}
