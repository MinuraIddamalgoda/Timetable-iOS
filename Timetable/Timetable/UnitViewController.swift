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
        
        let vc1 = sb.instantiateViewController(withIdentifier: "ArtsVC")
        let vc2 = sb.instantiateViewController(withIdentifier: "CommerceVC")
        let vc3 = sb.instantiateViewController(withIdentifier: "MedVC")
        let vc4 = sb.instantiateViewController(withIdentifier: "ScienceVC")
        
        return [vc1, vc2, vc3, vc4]
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.dataSource = self
        
        createDummyUnits()
        createDummyAssessments()
        createViewControllers()
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
    
    // Creates and returns a DateComponents object with the specified input
    // params
    func createDate(year: Int, month: Int, day: Int) -> DateComponents {
        var dateComponents = DateComponents()
        dateComponents.year = year
        dateComponents.month = month
        dateComponents.day = day
        return dateComponents
    }
    
    func createViewControllers() {
        if let firstViewController = viewControllerList.first {
            self.setViewControllers([firstViewController], direction: .forward, animated: true, completion: nil)
        }
    }
    
    // MARK - UIPageViewControllerDataSource methods
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        
        guard let vcIndex = viewControllerList.index(of: viewController) else {return nil}
        
        let previousIndex = vcIndex - 1
        
        guard previousIndex >= 0 else {return nil}
        
        return viewControllerList[previousIndex]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let vcIndex = viewControllerList.index(of: viewController) else {return nil}
        
        let nextIndex = vcIndex + 1
        
        guard viewControllerList.count != nextIndex || viewControllerList.count > nextIndex else {return nil}
        
        return viewControllerList[nextIndex]
    }

}
