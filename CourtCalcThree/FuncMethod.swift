//
//  FuncMethod.swift
//  CourtCalcThree
//
//  Created by RYAN CHRISTENSEN on 10/15/15.
//  Copyright © 2015 RYAN CHRISTENSEN. All rights reserved.
//

import UIKit


protocol Factor {
  var factor: String { get set }
}


struct StringConversion: Factor {
  var factor = ""
  
  func getIBW(_ factor: String) -> Float {
    let heightFactor = (factor as NSString!).floatValue - 60.0
    let weightAddition = 6.0 * heightFactor
    let IBW = weightAddition + 106.0
    return IBW
  }
  
  func maleREE(weight: String, height: String, age: String) -> Float {
    let REE = (10 * ((weight as NSString!).floatValue) / 2.2) + (6.25 * ((height as NSString!).floatValue) * 2.54) - (5 * (age as NSString!).floatValue) + 5
    return REE
  }
  
  func femaleREE(weight: String, height: String, age: String) -> Float {
    let REE = (10 * ((weight as NSString!).floatValue) / 2.2) + (6.25 * ((height as NSString!).floatValue) * 2.54) - (5 * (age as NSString!).floatValue) - 161
    return REE
  }
  
  func minMaleTEE(activity: String, weight: String, height: String, age: String) -> Float{
    let REE = (10 * ((weight as NSString!).floatValue) / 2.2) + (6.25 * ((height as NSString!).floatValue) * 2.54) - (5 * (age as NSString!).floatValue) + 5
    let minTEE = (activity as NSString!).floatValue * REE
    return minTEE
  }
  
  func maxMaleTEE(activity: String, weight: String, height: String, age: String) -> Float {
    let REE = (10 * ((weight as NSString!).floatValue) / 2.2) + (6.25 * ((height as NSString!).floatValue) * 2.54) - (5 * (age as NSString!).floatValue) + 5
    let maxTEE = (activity as NSString!).floatValue * REE
    return maxTEE
  }
  
  func minFemaleTEE(activity: String, weight: String, height: String, age: String) -> Float{
    let REE = (10 * ((weight as NSString!).floatValue) / 2.2) + (6.25 * ((height as NSString!).floatValue) * 2.54) - (5 * (age as NSString!).floatValue) - 161
    let minTEE = (activity as NSString!).floatValue * REE
    return minTEE
  }
  
  func maxFemaleTEE(activity: String, weight: String, height: String, age: String) -> Float {
    let REE = (10 * ((weight as NSString!).floatValue) / 2.2) + (6.25 * ((height as NSString!).floatValue) * 2.54) - (5 * (age as NSString!).floatValue) - 161
    let maxTEE = (activity as NSString!).floatValue * REE
    return maxTEE
  }

}
