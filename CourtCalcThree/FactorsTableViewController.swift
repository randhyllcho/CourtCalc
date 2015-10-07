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
      
    }
  
  override func viewWillDisappear(animated: Bool) {
    super.viewWillDisappear(animated)
    femaleREE()
    minFemaleTEE()
    maxFemaleTEE()
    BMI()
  }
  
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
  
  override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    if segue.identifier == "RESULTS" {
      

    }
  }

}
