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
  var numberFormatter: NSNumberFormatter!
  var age: String!
  var height: String!
  var weight: String!
  var usualWeight: String!
  var REE: String!
  var TEELow: String!
  var TEEHigh: String!
  var proteinLow: String!
  var proteinHigh: String!
  var activityLow: String!
  var activityHigh: String!

// MARK: ALL THE OUTLETS...
  @IBOutlet weak var ageLabel: UILabel!
  @IBOutlet weak var heightInchesLabel: UILabel!
  @IBOutlet weak var heightCMLabel: UILabel!
  @IBOutlet weak var currentWeightLabel: UILabel!
  @IBOutlet weak var usualWeightLabel: UILabel!
  @IBOutlet weak var currentKGWeightLabel: UILabel!
  @IBOutlet weak var usualWeightKGLabel: UILabel!
  @IBOutlet weak var REELabel: UILabel!
  @IBOutlet weak var TEELowLabel: UILabel!
  @IBOutlet weak var TEEHighLabel: UILabel!
  @IBOutlet weak var fluidLabel: UILabel!
  @IBOutlet weak var proteinLowLabel: UILabel!
  @IBOutlet weak var proteinHighLabel: UILabel!
  
// MARK: VDL
    override func viewDidLoad() {
        super.viewDidLoad()
      tableView.sectionHeaderHeight = kSectionHeight
      self.navigationController?.navigationBar.tintColor = UIColor.blackColor()
      self.navigationController?.navigationBar.items?.first?.title = "Back"
      
      let currentWeightKG = NumberFormatter.sharedInstance.stringFromNumber(((weight as NSString).floatValue) / 2.2)!
      let heightCM = NumberFormatter.sharedInstance.stringFromNumber(((height as NSString).floatValue) * 2.54)!
      let usualWeightKG = NumberFormatter.sharedInstance.stringFromNumber(((usualWeight as NSString).floatValue) / 2.2)!
      let proteinReq = AnotherNumberFormatter.reSharedInstance.stringFromNumber((((weight as NSString).floatValue) / 2.2))!
      
      self.ageLabel.text = "\(age) Years"
      self.heightInchesLabel.text = "\(height)IN"
      self.heightCMLabel.text = "\(heightCM)CM"
      self.currentWeightLabel.text = "\(weight)lbs"
      self.currentKGWeightLabel.text = "\(currentWeightKG)kg"
      self.usualWeightLabel.text = "\(usualWeight)lbs"
      self.usualWeightKGLabel.text = "\(usualWeightKG)kg"
      self.proteinLowLabel.text = "\(proteinReq)g"
      self.proteinHighLabel.text = "\(proteinReq)g"
    }
  

  

}
