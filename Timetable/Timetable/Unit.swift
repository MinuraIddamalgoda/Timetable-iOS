//
//  Unit.swift
//  Timetable
//
//  Created by Minura Iddamalgoda on 5/3/17.
//  Copyright © 2017 Minura Iddamalgoda. All rights reserved.
//

import Foundation
import UIKit

class Unit: NSObject {
    var name: String = ""
    var unitCode: String = ""
    var background: UIImage = UIImage()
    var faculty: String = ""
    
    init(_ name: String, _ unitCode: String, _ background: UIImage, _ faculty: String) {
        self.name = name
        self.unitCode = unitCode
        self.background = background
        self.faculty = faculty
    }
}
