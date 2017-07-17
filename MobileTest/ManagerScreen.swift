//
//  ManagerScreen.swift
//  MobileTest
//
//  Created by Matan Cohen on 17/07/2017.
//  Copyright © 2017 dapulse. All rights reserved.
//

import Foundation
import UIKit

class ManagerScreen: UIViewController, EmployScrollDidSelect {
    private let pageTitle = PageTitleView(title: "R&D")
    private let manageerEmployeeView = EmployeeView(frame: CGRect.zero)
    private let employeesTitle = PageTitleView(title: "Employees")
    private let employScroll = EmployScroll(frame: CGRect(x: 0, y: 0, width: screenSize.width, height: screenSize.height * 0.3))
    private var manager: Employee?

    
    // injected on AppDelegate
    var companyService: CompanyService?
    
    public func setManager(employee: Employee) {
        self.manager = employee
    
        self.pageTitle.setTitle(title: employee.department)
        self.manageerEmployeeView.setEmployee(employee: employee)
        companyService?.getEmployees(forManagerId: employee.id, completion: { (employees) in
            self.employScroll.setEmployees(employees: employees)
            print(employees)
        })
    }
    
    override func loadView() {
        super.loadView()
        
        self.employScroll.delegate = self
        self.view.backgroundColor = UIColor.white
        self.view.addSubview(self.pageTitle)
        self.pageTitle.snp.makeConstraints { (make) in
            make.top.equalTo(self.view).offset(titleTopOffset)
            make.centerX.equalTo(self.view)
        }
        self.view.addSubview(self.manageerEmployeeView)
        self.manageerEmployeeView.snp.makeConstraints { (make) in
            make.top.equalTo(self.pageTitle.snp.bottom)
            make.centerX.equalTo(self.view)
        }
        self.view.addSubview(self.employeesTitle)
        self.employeesTitle.snp.makeConstraints { (make) in
            make.top.equalTo(self.manageerEmployeeView.snp.bottom)
            make.leading.equalTo(self.view)
        }
        self.view.addSubview(self.employScroll)
        self.employScroll.snp.makeConstraints { (make) in
            make.leading.equalTo(self.view)
            make.trailing.equalTo(self.view)
            make.height.equalTo(200)
            make.top.equalTo(self.employeesTitle.snp.bottom)
        }
    }
    
    //MARK: Delegate
    
    func didSelectEmployee(employee: Employee) {
        let profile = ProfileScreen()
        profile.setEmployee(emplyee: employee)
        self.navigationController?.present(profile, animated: true, completion: nil)
    }
    
}
