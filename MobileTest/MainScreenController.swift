//
//  MainScreenController.swift
//  MobileTest
//
//  Created by Matan Cohen on 17/07/2017.
//  Copyright © 2017 dapulse. All rights reserved.
//

import Foundation
import UIKit
import SnapKit

let titleTopOffset = 100
let screenSize: CGRect = UIScreen.main.bounds

class MainScreenController: UIViewController, EmployScrollDidSelect {
    let pageTitle = PageTitleView(title: "DaPulse")
    let employScroll = EmployScroll(frame: CGRect(x: 0, y: 0, width: screenSize.width, height: screenSize.height * 0.3))
    
    // injected on AppDelegate
    var companyService: CompanyService?
    var managerScreen: ManagerScreen?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        weak var weakSelf = self
        companyService?.getCompanyName({ (name) in
            weakSelf?.pageTitle.setTitle(title: name)
            print(name)
        })
        
        companyService?.getTopLevelEmployees(completion: { (employees) in
            weakSelf?.employScroll.setEmployees(employees: employees)
            print(employees)
        })
    }
    
    override func loadView() {
        super.loadView()
        self.setupView()
        self.employScroll.delegate = self
    }
    
    //MARK: View layout
    
    func setupView() {
        view.backgroundColor = .white
        self.view.addSubview(self.pageTitle)
        self.pageTitle.snp.makeConstraints { (make) in
            make.top.equalTo(self.view).offset(titleTopOffset)
            make.centerX.equalTo(self.view)
        }
        self.view.addSubview(self.employScroll)
        self.employScroll.snp.makeConstraints { (make) in
            make.leading.equalTo(self.view)
            make.trailing.equalTo(self.view)
            make.centerY.equalTo(self.view)
            make.height.equalTo(200)
        }
        
    }
    
    //MARK: Delegate
    
    func didSelectEmployee(employee: Employee) {
        if (employee.isManager) {
            self.managerScreen?.setManager(employee: employee)
            self.navigationController?.pushViewController(self.managerScreen!, animated: true)
        }
    }
}

