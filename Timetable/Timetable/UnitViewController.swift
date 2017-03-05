//
//  UnitViewController.swift
//  Timetable
//
//  Created by Minura Iddamalgoda on 5/3/17.
//  Copyright © 2017 Minura Iddamalgoda. All rights reserved.
//

import UIKit

class UnitViewController:
    UIPageViewController,
    UIPageViewControllerDataSource {

    // MARK: - Variables
    // MARK: Model
    var unitsArr = [Unit]()
    var assessmentArr = [Assessment]()
    
    // MARK Controller
    lazy var viewControllerList: [UIViewController] = {
        let sb = UIStoryboard(name: "Main", bundle: nil)
        
        let vc1 = sb.instantiateViewController(withIdentifier: "OneVC")
        let vc2 = sb.instantiateViewController(withIdentifier: "TwoVC")
        let vc3 = sb.instantiateViewController(withIdentifier: "ThreeVC")
        let vc4 = sb.instantiateViewController(withIdentifier: "FourVC")
        
        return [vc1, vc2, vc3, vc4]
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.dataSource = self
        
        createDummyUnits()
        createDummyAssessments()
    }
    
    // MARK: - Methods
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
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEE, dd MMM yyyy HH:mm:ss zzz"
        
        var startDate: Date = dateFormatter.date(from: "Sun, 05 Mar 2017 00:01:00 AEST")!
        var dueDate: Date = dateFormatter.date(from: "Fri, 17 Mar 2017 17:00:00 AEST")!
        let artsAssign = Assessment("Essay 1", "Write a 1000 word essay", startDate, dueDate, "Assessment", 25.0)
        assessmentArr.append(artsAssign)
        
        startDate = dateFormatter.date(from: "Tue, 21 Mar 2017 12:00:00 AEST")!
        dueDate = dateFormatter.date(from: "Tue, 21 Mar 2017 13:00:00 AEST")!
        let artsMidsem = Assessment("Midsem", "Mid-semester examination", startDate, dueDate, "Test", 25.0)
        assessmentArr.append(artsMidsem)
        
        startDate = dateFormatter.date(from: "Thu, 01 Jun 2017 13:30:00 AEST")!
        dueDate = dateFormatter.date(from: "Thu, 01 Jun 2017 15:30:00 AEST")!
        let artsExam = Assessment("Final Exam", "Invigilated Examination", startDate, dueDate, "Exam", 50.0)
        assessmentArr.append(artsExam)
    }
    
    func createViewControllers() {
        if let firstViewController = viewControllerList.first {
            self.setViewControllers([firstViewController], direction: .forward, animated: true, completion: nil)
        }
    }
    
    // MARK - UIPageViewControllerDataSource methods
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        return nil
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        return nil
    }

}
