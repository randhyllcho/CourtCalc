//
//  FactorsTableViewController.swift
//  CourtCalcThree
//
//  Created by RYAN CHRISTENSEN on 9/28/15.
//  Copyright © 2015 RYAN CHRISTENSEN. All rights reserved.
//

import UIKit

class FactorsTableViewController: UITableViewController, UITextFieldDelegate, Factor {
  
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
  
  var conversion = StringConversion()
  var factor = ""


    override func viewDidLoad() {
        super.viewDidLoad()
      tableView.sectionHeaderHeight = kSectionHeight

    }
  
  @IBAction func sexSelectorSelected(sender: AnyObject) {
    if sexSelector.selectedSegmentIndex == 0 {
      
    } else {

    }
  }
  
// MARK: FUNCTIONS
  
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
        
        let maleREE = conversion.maleREE(weight: (self.currentWeight?.text)!, height: (self.height?.text)!, age: (self.age?.text)!)
        let minMaleTEE = conversion.minMaleTEE(activity: (self.minActivityFactor?.text)!, weight: (self.currentWeight?.text)!, height: (self.height?.text)!, age: (self.age?.text)!)
        let maxMaleTEE = conversion.maxMaleTEE(activity: (self.maxActivityFactor?.text)!, weight: (self.currentWeight?.text)!, height: (self.height?.text)!, age: (self.age?.text)!)
        let femaleREE = conversion.femaleREE(weight: (self.currentWeight?.text)!, height: (self.height?.text)!, age: (self.age?.text)!)
        print(femaleREE)
        let minFemaleTEE = conversion.minFemaleTEE(activity: (self.minActivityFactor?.text)!, weight: (self.currentWeight?.text)!, height: (self.height?.text)!, age: (self.age?.text)!)
        print(minFemaleTEE)
        let maxFemaleTEE = conversion.maxFemaleTEE(activity: (self.maxActivityFactor?.text)!, weight: (self.currentWeight?.text)!, height: (self.height?.text)!, age: (self.age?.text)!)
        print(maxFemaleTEE)
        
        resultsVC.height = self.height.text
        resultsVC.age = self.age.text
        resultsVC.weight = self.currentWeight.text
        resultsVC.usualWeight = self.normalWeight.text
        resultsVC.proteinLow = self.minProteinFactor.text
        resultsVC.proteinHigh = self.maxProteinFactor.text
        resultsVC.activityLow = self.minActivityFactor.text
        resultsVC.activityHigh = self.maxActivityFactor.text
        resultsVC.REE = "\(maleREE)"
        resultsVC.TEELow = "\(minMaleTEE)"
        resultsVC.TEEHigh = "\(maxMaleTEE)"
        
      }
    }
  }
  
//TODO: 
  // calculate IBW and weight range. Get % of IBW, % of usual body weight and % change from current to normal weight
  // find space for that everything that doesnt look like hell...
  // get the functions to pass between view controllers without breaking MVC

}
