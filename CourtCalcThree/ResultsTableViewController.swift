//
//  ResultsTableViewController.swift
//  CourtCalcThree
//
//  Created by RYAN CHRISTENSEN on 10/2/15.
//  Copyright © 2015 RYAN CHRISTENSEN. All rights reserved.
//

import UIKit

fileprivate func < <T : Comparable>(lhs: T?, rhs: T?) -> Bool {
  switch (lhs, rhs) {
  case let (l?, r?):
    return l < r
  case (nil, _?):
    return true
  default:
    return false
  }
}

fileprivate func >= <T : Comparable>(lhs: T?, rhs: T?) -> Bool {
  switch (lhs, rhs) {
  case let (l?, r?):
    return l >= r
  default:
    return !(lhs < rhs)
  }
}

fileprivate func <= <T : Comparable>(lhs: T?, rhs: T?) -> Bool {
  switch (lhs, rhs) {
  case let (l?, r?):
    return l <= r
  default:
    return !(rhs < lhs)
  }
}


class ResultsTableViewController: UITableViewController {
  
  let kSectionHeight: CGFloat = 25
  var numberFormatter: NewNumberFormatter!
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
  
  let kInchesToCM = Double(2.54)
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
      self.navigationController?.navigationBar.tintColor = UIColor.black
      
      let currentWeightKG = doConversion(value: weight, constant: kLbsToKG)
      let heightCM = doConversion(value: height, constant: kInchesToCM)
      let usualWeightKG = doConversion(value: usualWeight, constant: kLbsToKG)
      let proteinReq = AnotherNumberFormatter.reSharedInstance.string(from: (((weight as NSString).doubleValue) / kLbsToKG) as NSNumber)
      let fluid = AnotherNumberFormatter.reSharedInstance.string(from: (getFluid(age, weight: weight) as NSNumber))!
      let IBWPercent = (((weight as NSString).doubleValue) / (Double(IBW)! * kLbsToKG)) * 100
      let lowProtein = Double(proteinReq!)! * Double(proteinLow)!
      let highProtein = Double(proteinReq!)! * Double(proteinHigh)!
      let roundLowProtein = AnotherNumberFormatter.reSharedInstance.string(from: (lowProtein) as NSNumber)!
      let roundHighProtein = AnotherNumberFormatter.reSharedInstance.string(from: highProtein as NSNumber)!
      let UsualPercent = (((Double(currentWeightKG)! * kLbsToKG) / (usualWeight as NSString).doubleValue)) * 100
      let usualRound = AnotherNumberFormatter.reSharedInstance.string(from: (UsualPercent) as NSNumber)!
      let IBWRound = AnotherNumberFormatter.reSharedInstance.string(from: (IBWPercent) as NSNumber)!
      let finalIBW = getIBW(IBW)
      let finalTeeLow = AnotherNumberFormatter.reSharedInstance.string(from: (Double(TEELow) as NSNumber!))!
      let finalTeeHigh = AnotherNumberFormatter.reSharedInstance.string(from: (Double(TEEHigh) as NSNumber!))!
      let finalREE = AnotherNumberFormatter.reSharedInstance.string(from: (Double(REE) as NSNumber!))!
      let finalBMI = AnotherNumberFormatter.reSharedInstance.string(from: (Double(BMI) as NSNumber!))!
      
      self.heightInchesLabel.text = "\(height!)in/\(heightCM)cm"
      self.currentWeightLabel.text = "\(weight!)lbs/\(currentWeightKG)kg"
      self.usualWeightLabel.text = "\(usualWeight!)lbs/\(usualWeightKG)kg"
      self.proteinLowLabel.text = "\(roundLowProtein)g - \(roundHighProtein)g"
      self.REELabel.text = "\(finalREE) kcal/d"
      self.TEELowLabel.text = "\(finalTeeLow) - \(finalTeeHigh) kcal/d"
      self.fluidLabel.text = "\(fluid)mL"
      self.IBWRangeLabel.text = "\(round(finalIBW.first!))-\(round(finalIBW.last!))lbs"
      self.percentIBWLabel.text = "\(IBWRound)% of IBW"
      self.percentUsualLabel.text = "\(usualRound)% of Usual"
      self.BMILabel.text = "BMI:\(finalBMI)"
      

      setTextColor(bmi: Double(BMI)!)
    }
 
  
//MARK: SOME FUNCTIONS 
  
  func ageAsInt(_ age: String) -> Int {
    if let newAge = Int(age) {
      return newAge
    }
    return 0
  }
  
  func getFluid(_ age: String, weight: String) -> Double {
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
  
  func getIBW(_ IBW: String) -> [Double] {
    var newIBW = Double(IBW)
    newIBW = newIBW! * kLbsToKG
    let newIBWMin = newIBW! - (newIBW! * 0.1)
    let newIBWMax = newIBW! + (newIBW! * 0.1)
    let IBWs = [newIBWMin, newIBWMax]
    return IBWs
  }
  
  func doConversion(value: String, constant: Double) -> String {
    if constant == kLbsToKG {
      let convertedNumber = Double(value)! / constant
      return NewNumberFormatter.sharedInstance.string(from: (convertedNumber) as NSNumber)!
    } else {
      let convertedNumber = Double(value)! * constant
      return NewNumberFormatter.sharedInstance.string(from: (convertedNumber) as NSNumber)!
    }
  }
  
  func setTextColor(bmi: Double) {
    switch bmi {
    case 18.5 ..< 24.9:
      self.BMILabel.textColor = UIColor.green
    case 25 ..< 29.9:
      self.BMILabel.textColor = UIColor.orange
    default:
      self.BMILabel.textColor = UIColor.red
    }
  }
  
}



