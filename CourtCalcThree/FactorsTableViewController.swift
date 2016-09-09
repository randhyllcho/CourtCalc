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
      age.delegate = self
      currentWeight.delegate = self
      normalWeight.delegate = self
      minActivityFactor.delegate = self
      maxActivityFactor.delegate = self
      minProteinFactor.delegate = self
      maxProteinFactor.delegate = self
      height.delegate = self
    }
  
  
// MARK: FUNCTIONS
  
  func BMI() -> Float {
    let weight = (self.currentWeight.text as NSString!).floatValue
    let height = (self.height.text as NSString!).floatValue
    let BMI = (weight / (height * height) * 703)
    return BMI
  }
  
  func getIBW() -> Double {
    let height = (self.height.text! as NSString).doubleValue
    if height > 60 {
      let heightFactor = (height - 60) * 2.3
      return heightFactor
    }
    return 0.0
  }
  
  func textFieldShouldReturn(textField: UITextField) -> Bool {
    let nextTag = textField.tag + 1
    let nextResponder: UIResponder? = textField.superview?.superview?.viewWithTag(nextTag)
    if let nextR = nextResponder {
      nextR.becomeFirstResponder()
    } else {
      textField.resignFirstResponder()
    }
    return false
  }
  
// MARK: PREPARE FOR SEGUE
  
  override func shouldPerformSegueWithIdentifier(identifier: String, sender: AnyObject?) -> Bool {
    if identifier == "RESULTS" {
      if age.text!.isEmpty {
        let alert = UIAlertController(title: "Missing Info", message: "Please Enter Age", preferredStyle: UIAlertControllerStyle.Alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .Default, handler: { (action) -> Void in
        }))
        presentViewController(alert, animated: true, completion: nil)
      }
     else if height.text!.isEmpty {
        let alert = UIAlertController(title: "Missing Info", message: "Please Enter Height", preferredStyle: UIAlertControllerStyle.Alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .Default, handler: { (action) -> Void in
        }))
        presentViewController(alert, animated: true, completion: nil)
    } else if currentWeight.text!.isEmpty {
      let alert = UIAlertController(title: "Missing Info", message: "Please Enter Weight", preferredStyle: UIAlertControllerStyle.Alert)
      alert.addAction(UIAlertAction(title: "Ok", style: .Default, handler: { (action) -> Void in
      }))
      presentViewController(alert, animated: true, completion: nil)
      } else if normalWeight.text!.isEmpty {
        let alert = UIAlertController(title: "Missing Info", message: "Please Enter Weight", preferredStyle: UIAlertControllerStyle.Alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .Default, handler: { (action) -> Void in
        }))
        presentViewController(alert, animated: true, completion: nil)
      } else if minActivityFactor.text!.isEmpty {
        let alert = UIAlertController(title: "Missing Info", message: "Please Enter Activity Factor", preferredStyle: UIAlertControllerStyle.Alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .Default, handler: { (action) -> Void in
        }))
        presentViewController(alert, animated: true, completion: nil)
      } else if maxActivityFactor.text!.isEmpty {
        let alert = UIAlertController(title: "Missing Info", message: "Please Enter Activity Factor", preferredStyle: UIAlertControllerStyle.Alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .Default, handler: { (action) -> Void in
        }))
        presentViewController(alert, animated: true, completion: nil)
      } else if minProteinFactor.text!.isEmpty {
        let alert = UIAlertController(title: "Missing Info", message: "Please Enter Protein Factor", preferredStyle: UIAlertControllerStyle.Alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .Default, handler: { (action) -> Void in
        }))
        presentViewController(alert, animated: true, completion: nil)
      } else if maxProteinFactor.text!.isEmpty {
        let alert = UIAlertController(title: "Missing Info", message: "Please Enter Protein Factor", preferredStyle: UIAlertControllerStyle.Alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .Default, handler: { (action) -> Void in
        }))
        presentViewController(alert, animated: true, completion: nil)
      } 
    }
    return true
  }
  
  override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    if segue.identifier == "RESULTS" {
      if sexSelector.selectedSegmentIndex == 0 {
        if let resultsVC = segue.destinationViewController as? ResultsTableViewController {
          
          let maleREE = conversion.maleREE(weight: (self.currentWeight?.text)!, height: (self.height?.text)!, age: (self.age?.text)!)
          let minMaleTEE = conversion.minMaleTEE(activity: (self.minActivityFactor?.text)!, weight: (self.currentWeight?.text)!, height: (self.height?.text)!, age: (self.age?.text)!)
          let maxMaleTEE = conversion.maxMaleTEE(activity: (self.maxActivityFactor?.text)!, weight: (self.currentWeight?.text)!, height: (self.height?.text)!, age: (self.age?.text)!)
          
          resultsVC.height = self.height.text
          resultsVC.age = self.age.text
          resultsVC.weight = self.currentWeight.text
          resultsVC.usualWeight = self.normalWeight.text
          resultsVC.proteinLow = self.minProteinFactor.text
          resultsVC.proteinHigh = self.maxProteinFactor.text
          resultsVC.activityLow = self.minActivityFactor.text
          resultsVC.activityHigh = self.maxActivityFactor.text
          resultsVC.REE = "\(maleREE)"
          print("This: \(maleREE)")
          resultsVC.TEELow = "\(minMaleTEE)"
          resultsVC.TEEHigh = "\(maxMaleTEE)"
          resultsVC.IBW = "\(getIBW() + 50)"
          resultsVC.BMI = "\(BMI())"
        }
      } else {
        if let resultsVC = segue.destinationViewController as? ResultsTableViewController {
          
          let femaleREE = conversion.femaleREE(weight: (self.currentWeight?.text)!, height: (self.height?.text)!, age: (self.age?.text)!)
          let minFemaleTEE = conversion.minFemaleTEE(activity: (self.minActivityFactor?.text)!, weight: (self.currentWeight?.text)!, height: (self.height?.text)!, age: (self.age?.text)!)
          let maxFemaleTEE = conversion.maxFemaleTEE(activity: (self.maxActivityFactor?.text)!, weight: (self.currentWeight?.text)!, height: (self.height?.text)!, age: (self.age?.text)!)
          
          print(currentWeight.text)
          print(height.text)
          print(age.text)
          
          resultsVC.height = self.height.text
          resultsVC.age = self.age.text
          resultsVC.weight = self.currentWeight.text
          resultsVC.usualWeight = self.normalWeight.text
          resultsVC.proteinLow = self.minProteinFactor.text
          resultsVC.proteinHigh = self.maxProteinFactor.text
          resultsVC.activityLow = self.minActivityFactor.text
          resultsVC.activityHigh = self.maxActivityFactor.text
          resultsVC.REE = "\(femaleREE)"
          print(femaleREE)
          resultsVC.TEELow = "\(minFemaleTEE)"
          resultsVC.TEEHigh = "\(maxFemaleTEE)"
          resultsVC.IBW = "\(getIBW() + 45.5)"
          resultsVC.BMI = "\(BMI())"
        }
      }
    }
  }
  
  

}
