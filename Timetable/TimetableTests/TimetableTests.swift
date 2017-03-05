//
//  TimetableTests.swift
//  TimetableTests
//
//  Created by Minura Iddamalgoda on 5/3/17.
//  Copyright © 2017 Minura Iddamalgoda. All rights reserved.
//

import XCTest
@testable import Timetable

class TimetableTests: XCTestCase {
    
    // MARK: - Unit class tests
    func testUnitClass() {
        let artsUnit = Unit("Arts Hello", "ATS1011", UIImage.init(named: "arts_background")!, "Faculty of Arts")
        XCTAssertNotNil(artsUnit)
    }
    
    
}
