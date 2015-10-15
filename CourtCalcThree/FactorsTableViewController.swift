//
//  FactorsTableViewController.swift
//  CourtCalcThree
//
//  Created by RYAN CHRISTENSEN on 9/28/15.
//  Copyright © 2015 RYAN CHRISTENSEN. All rights reserved.
//

import UIKit

class FactorsTableViewController: UITableViewController, UITextFieldDelegate {
  
  @IBOutlet weak var sexSelector: UISegmentedControl!
  @IBOutlet weak var age: UITextField!
  @IBOutlet weak var currentWeight: UITextField!
  @IBOutlet weak var normalWeight: UITextField!
  @IBOutlet weak var minActivityFactor: UITextField!
  @IBOutlet weak var maxActivityFactor: UITextField!
  @IBOutlet weak var minProteinFactor: UITextField!
  @IBOutlet weak var maxProteinFactor: UITextField!
  @IBOutlet weak var height: UITextField!
  
  let kSectionHeight: CGFloat = 25


    override func viewDidLoad() {
        super.viewDidLoad()
      tableView.sectionHeaderHeight = kSectionHeight
      self.tableView.delegate = self
      self.tableView.dataSource = self
      
    }
  
//  override func viewWillDisappear(animated: Bool) {
//    super.viewWillDisappear(animated)
//    femaleREE()
//    minFemaleTEE()
//    maxFemaleTEE()
//    BMI()
//  }
  
  @IBAction func sexSelectorSelected(sender: AnyObject) {
    if sexSelector.selectedSegmentIndex == 0 {
      maleREE()
      minMaleTEE()
      maxMaleTEE()
      BMI()
    } else {
      femaleREE()
      minFemaleTEE()
      maxFemaleTEE()
      BMI()
    }
  }
  
// MARK: FUNCTIONS
  func femaleREE() -> Float {
    let REE = (10 * (self.currentWeight?.text as NSString!).floatValue) + (6 * (self.height?.text as NSString!).floatValue) - (5 * (self.age?.text as NSString!).floatValue) - 161
    return REE
  }
  
  func maleREE() -> Float {
    let REE = (10 * (self.currentWeight?.text as NSString!).floatValue) + (6 * (self.height?.text as NSString!).floatValue) - (5 * (self.age?.text as NSString!).floatValue) + 5
    return REE
  }
  
  func minFemaleTEE() -> Float{
    let minTEE = (minActivityFactor.text as NSString!).floatValue * femaleREE()
    return minTEE
  }
  
  func maxFemaleTEE() -> Float {
    let maxTEE = (maxActivityFactor.text as NSString!).floatValue * femaleREE()
    return maxTEE
  }
  
  func minMaleTEE() -> Float{
    let minTEE = (minActivityFactor.text as NSString!).floatValue * maleREE()
    return minTEE
  }
  
  func maxMaleTEE() -> Float {
    let maxTEE = (maxActivityFactor.text as NSString!).floatValue * maleREE()
    return maxTEE
  }
  
  func BMI() -> Float {
    let weight = (self.currentWeight.text as NSString!).floatValue
    let height = (self.height.text as NSString!).floatValue
    let BMI = (weight / (height * height) * 703)
    return BMI
  }
  
// MARK: PREPARE FOR SEGUE
  override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    if segue.identifier == "RESULTS" {
      if let resultsVC = segue.destinationViewController as? ResultsTableViewController {
        resultsVC.height = self.height.text
        resultsVC.age = self.age.text
        resultsVC.weight = self.currentWeight.text
        resultsVC.usualWeight = self.normalWeight.text
        resultsVC.proteinLow = self.minProteinFactor.text
        resultsVC.proteinHigh = self.maxProteinFactor.text
        resultsVC.activityLow = self.minActivityFactor.text
        resultsVC.activityHigh = self.maxActivityFactor.text
      }
    }
  }
  
//TODO: 
  // calculate IBW and weight range. Get % of IBW, % of usual body weight and % change from current to normal weight
  // find space for that everything that doesnt look like hell...
  // get the functions to pass between view controllers without breaking MVC

}
