//
//  UnitViewController.swift
//  Timetable
//
//  Created by Minura Iddamalgoda on 5/3/17.
//  Copyright © 2017 Minura Iddamalgoda. All rights reserved.
//

import UIKit

class UnitViewController:
    UIViewController {

    // MARK: - Variables
    // MARK: Model
    var unitsArr = [Unit]()
    var assessmentArr = [Assessment]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        createDummyUnits()
        createDummyAssessments()
        
        // Setting up UISegmentControl
        for i in 0...(unitsArr.count - 1) {
            segmentControl.setTitle(unitsArr[i].unitCode, forSegmentAt: i)
        }
    }
    
    // MARK: - Outlets
    @IBOutlet weak var segmentControl: UISegmentedControl!
    @IBOutlet weak var bannerImageView: UIImageView!
    
    // MARK: - Actions
    @IBAction func segmentControlValueChanged(_ sender: UISegmentedControl) {
        bannerImageView.image = unitsArr[sender.selectedSegmentIndex].background
    }
    
    // MARK: - Methods
    // Creates and returns a DateComponents object with the specified input
    // params
    func createDate(year: Int, month: Int, day: Int) -> DateComponents {
        var dateComponents = DateComponents()
        dateComponents.year = year
        dateComponents.month = month
        dateComponents.day = day
        return dateComponents
    }
    
    func segmentControlTapped() {
        print("tapped")
    }
    
    // MARK: Dummy data methods
    func createDummyUnits() {
        let artsUnit = Unit("Arts Hello", "ATS1011", UIImage.init(named: "arts_background")!, "Faculty of Arts")
        unitsArr.append(artsUnit)
        
        let commUnit = Unit("Commerce World", "BFC2011", UIImage.init(named: "commerce_background")!, "Faculty of Business and Economics")
        unitsArr.append(commUnit)
        
        let medUnit = Unit("Introduction to Medicine", "MED1040", UIImage.init(named: "medicine_background")!, "Faculty of Medicine")
        unitsArr.append(medUnit)
        
        let sciUnit = Unit("Science Unit", "SCI1030", UIImage.init(named: "science_background")!, "Faculty of Science")
        unitsArr.append(sciUnit)
    }
    
    func createDummyAssessments() {
        let startCalendar = NSCalendar.current
        let dueCalendar = NSCalendar(identifier: .gregorian)
        
        var startDate = startCalendar.date(from: createDate(year: 2017, month: 4, day: 5))
        var dueDate = dueCalendar!.date(from: createDate(year: 2017, month: 4, day: 17))
        let artsAssign = Assessment("Essay 1", "Write a 1000 word essay", startDate!, dueDate!, "Assessment", 25.0)
        assessmentArr.append(artsAssign)
        
        startDate = startCalendar.date(from: createDate(year: 2017, month: 4, day: 21))
        dueDate = startCalendar.date(from: createDate(year: 2017, month: 4, day: 21))
        let artsMidsem = Assessment("Midsem", "Mid-semester examination", startDate!, dueDate!, "Test", 25.0)
        assessmentArr.append(artsMidsem)
        
        startDate = startCalendar.date(from: createDate(year: 2017, month: 6, day: 1))
        dueDate = startCalendar.date(from: createDate(year: 2017, month: 6, day: 1))
        let artsExam = Assessment("Final Exam", "Invigilated Examination", startDate!, dueDate!, "Exam", 50.0)
        assessmentArr.append(artsExam)
    }
}
