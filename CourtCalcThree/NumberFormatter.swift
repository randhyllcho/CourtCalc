//
//  NumberFormatter.swift
//  CourtCalcThree
//
//  Created by RYAN CHRISTENSEN on 9/28/15.
//  Copyright © 2015 RYAN CHRISTENSEN. All rights reserved.
//

import UIKit

class NumberFormatter: NSNumberFormatter {
  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)!
  }
  override init() {
    super.init()
    self.maximumFractionDigits = 1
    self.minimumFractionDigits = 1
    self.alwaysShowsDecimalSeparator = true
    self.numberStyle = .DecimalStyle
  }
  static let sharedInstance = NumberFormatter()
}

