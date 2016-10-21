//
//  NumberFormatter.swift
//  CourtCalcThree
//
//  Created by RYAN CHRISTENSEN on 9/28/15.
//  Copyright © 2015 RYAN CHRISTENSEN. All rights reserved.
//

import UIKit

class NewNumberFormatter: NumberFormatter {
  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)!
  }
  override init() {
    super.init()
    self.maximumFractionDigits = 1
    self.minimumFractionDigits = 1
    self.alwaysShowsDecimalSeparator = true
    self.numberStyle = .decimal
  }
  static let sharedInstance = NewNumberFormatter()
}


class AnotherNumberFormatter: NumberFormatter {
  override init() {
    super.init()
    self.maximumFractionDigits = 0
    self.minimumFractionDigits = 0
    self.alwaysShowsDecimalSeparator = false
    self.numberStyle = .decimal
  }

  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)!
  }
  static let reSharedInstance = AnotherNumberFormatter()
}
