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
  var IBW: String!
  var BMI: String!
  
  let kInchesToCM = Float(2.54)
  let kLbsToKG = Double(2.2)

  

// MARK: ALL THE OUTLETS...
  
  @IBOutlet weak var heightInchesLabel: UILabel!
  @IBOutlet weak var currentWeightLabel: UILabel!
  @IBOutlet weak var usualWeightLabel: UILabel!
  @IBOutlet weak var REELabel: UILabel!
  @IBOutlet weak var TEELowLabel: UILabel!
  @IBOutlet weak var fluidLabel: UILabel!
  @IBOutlet weak var proteinLowLabel: UILabel!
  @IBOutlet weak var IBWRangeLabel: UILabel!
  @IBOutlet weak var percentIBWLabel: UILabel!
  @IBOutlet weak var percentUsualLabel: UILabel!
  @IBOutlet weak var BMILabel: UILabel!

  
// MARK: VDL
  
    override func viewDidLoad() {
        super.viewDidLoad()
      tableView.sectionHeaderHeight = kSectionHeight
      self.navigationController?.navigationBar.tintColor = UIColor.blackColor()
      
      let currentWeightKG = NumberFormatter.sharedInstance.stringFromNumber(((weight as NSString).doubleValue) / kLbsToKG)!
      let heightCM = NumberFormatter.sharedInstance.stringFromNumber(((height as NSString).floatValue) * kInchesToCM)!
      let usualWeightKG = NumberFormatter.sharedInstance.stringFromNumber(((usualWeight as NSString).doubleValue) / kLbsToKG)!
      let proteinReq = AnotherNumberFormatter.reSharedInstance.stringFromNumber((((weight as NSString).doubleValue) / kLbsToKG))!
      let fluid = AnotherNumberFormatter.reSharedInstance.stringFromNumber(getFluid(age, weight: weight))!
      let IBWPercent = (((weight as NSString).doubleValue) / (Double(IBW)! * kLbsToKG)) * 100
      let lowProtein = Double(proteinReq)! * Double(proteinLow)!
      let highProtein = Double(proteinReq)! * Double(proteinHigh)!
      let roundLowProtein = AnotherNumberFormatter.reSharedInstance.stringFromNumber(lowProtein)!
      let roundHighProtein = AnotherNumberFormatter.reSharedInstance.stringFromNumber(highProtein)!
      let UsualPercent = (((Double(currentWeightKG)! * kLbsToKG) / (usualWeight as NSString).doubleValue)) * 100
      let usualRound = AnotherNumberFormatter.reSharedInstance.stringFromNumber(UsualPercent)!
      let IBWRound = AnotherNumberFormatter.reSharedInstance.stringFromNumber(IBWPercent)!
      let finalIBW = getIBW(IBW)
      let finalTeeLow = AnotherNumberFormatter.reSharedInstance.stringFromNumber(Double(TEELow)!)!
      let finalTeeHigh = AnotherNumberFormatter.reSharedInstance.stringFromNumber(Double(TEEHigh)!)!
      let finalREE = AnotherNumberFormatter.reSharedInstance.stringFromNumber(Double(REE)!)!
      let finalBMI = AnotherNumberFormatter.reSharedInstance.stringFromNumber(Double(BMI)!)!
      
      self.heightInchesLabel.text = "\(height)in/\(heightCM)cm"
      self.currentWeightLabel.text = "\(weight)lbs/\(currentWeightKG)kg"
      self.usualWeightLabel.text = "\(usualWeight)lbs/\(usualWeightKG)kg"
      self.proteinLowLabel.text = "\(roundLowProtein)g - \(roundHighProtein)g"
      self.REELabel.text = "\(finalREE) kcal/d"
      self.TEELowLabel.text = "\(finalTeeLow) - \(finalTeeHigh) kcal/d"
      self.fluidLabel.text = "\(fluid)mL"
      self.IBWRangeLabel.text = "\(round(finalIBW.first!))-\(round(finalIBW.last!))lbs"
      self.percentIBWLabel.text = "\(IBWRound)% of IBW"
      self.percentUsualLabel.text = "\(usualRound)% of Usual"
      self.BMILabel.text = "BMI:\(finalBMI)"
      
      if Double(BMI) >= 18.5 && Double(BMI) <= 24.9 {
        self.BMILabel.textColor = UIColor.greenColor()
      } else if Double(BMI) >= 25 && Double(BMI) <= 29.9 {
        self.BMILabel.textColor = UIColor.orangeColor()
      } else if Double(BMI) >= 30 {
        self.BMILabel.textColor = UIColor.redColor()
      } else {
        self.BMILabel.textColor = UIColor.blueColor()
      }
    }
 
  
//MARK: SOME FUNCTIONS 
  
  func ageAsInt(age: String) -> Int {
    if let newAge = Int(age) {
      return newAge
    }
    return 0
  }
  
  func getFluid(age: String, weight: String) -> Double {
    let newAge = ageAsInt(age)
    let nweight = Double(weight)
    let weightKG = nweight! / kLbsToKG
    var fluid = 0.0
    
    if newAge >= 20 && newAge <= 55 {
      fluid = weightKG * 35.0
      return fluid
    } else if newAge > 55 && newAge <= 75 {
      fluid = weightKG * 30.0
      return fluid
    } else {
      fluid = weightKG * 25
      return fluid
    }
  }
  
  func getIBW(IBW: String) -> [Double] {
    var newIBW = Double(IBW)
    newIBW = newIBW! * kLbsToKG
    let newIBWMin = newIBW! - (newIBW! * 0.1)
    let newIBWMax = newIBW! + (newIBW! * 0.1)
    let IBWs = [newIBWMin, newIBWMax]
    return IBWs
  }
  
  
}



