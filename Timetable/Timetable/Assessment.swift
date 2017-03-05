//
//  Assessment.swift
//  Timetable
//
//  Created by Minura Iddamalgoda on 5/3/17.
//  Copyright © 2017 Minura Iddamalgoda. All rights reserved.
//

import Foundation

class Assessment: NSObject {
    var name: String = ""
    var assessmentDesc: String = ""
    var startDate: Date = Date()
    var dueDate: Date = Date()
    var type: String = ""
    var weight: Float = 0.0
    
    init(_ name: String,_ assessmentDesc: String,_ startDate: Date,_ dueDate: Date,_ type: String,_ weight: Float) {
        self.name = name
        self.assessmentDesc = assessmentDesc
        self.startDate = startDate
        self.dueDate = dueDate
        self.type = type
        self.weight = weight
    }
}
