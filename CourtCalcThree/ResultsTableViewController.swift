//
//  ResultsTableViewController.swift
//  CourtCalcThree
//
//  Created by RYAN CHRISTENSEN on 10/2/15.
//  Copyright © 2015 RYAN CHRISTENSEN. All rights reserved.
//

import UIKit

class ResultsTableViewController: UITableViewController {
  
  let kSectionHeight: CGFloat = 25

    override func viewDidLoad() {
        super.viewDidLoad()
      tableView.sectionHeaderHeight = kSectionHeight
      self.navigationController?.navigationBar.tintColor = UIColor.blackColor()
      self.navigationController?.navigationBar.items?.first?.title = "Back"

    }

}
