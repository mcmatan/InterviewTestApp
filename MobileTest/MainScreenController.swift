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

class MainScreenController: UIViewController {
    let pageTitle = PageTitleView(title: "DaPulse")
    let employScroll = EmployScroll(frame: CGRect.zero)
    
    // injected on AppDelegate
    var companyService: CompanyService?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        companyService?.getCompanyName({ (name) in
            print(name)
        })
        
        companyService?.getTopLevelEmployees(completion: { (employees) in
            print(employees)
        })
        
        companyService?.getEmployees(forManagerId: 22, completion: { (employees) in
            print(employees)
        })
    }
    
    override func loadView() {
        super.loadView()
        self.setupView()
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
}

