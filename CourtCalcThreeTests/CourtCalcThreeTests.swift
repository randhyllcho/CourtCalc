//
//  CourtCalcThreeTests.swift
//  CourtCalcThreeTests
//
//  Created by RYAN CHRISTENSEN on 9/28/15.
//  Copyright © 2015 RYAN CHRISTENSEN. All rights reserved.
//

import XCTest
@testable import CourtCalcThree

class CourtCalcThreeTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
      func getIBW() -> Float {
        let heightFactor = Float(74.0) - 60.0
        let weightAddition = 6.0 * heightFactor
        let IBW = weightAddition + 106.0
        return IBW
      }
        self.measureBlock {
            // Put the code you want to measure the time of here.
          func getIBW() -> Float {
            let heightFactor = Float(74.0) - 60.0
            let weightAddition = 6.0 * heightFactor
            let IBW = weightAddition + 106.0
            return IBW
          }
        }
    }
    
}
