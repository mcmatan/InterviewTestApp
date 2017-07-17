//
//  ProfileScreen.swift
//  MobileTest
//
//  Created by Matan Cohen on 17/07/2017.
//  Copyright © 2017 dapulse. All rights reserved.
//

import Foundation
import UIKit
import SnapKit

class ProfileScreen: UIViewController {
    let employeeView = EmployeeView(frame:CGRect.zero)
    let employeeDetailsView = EmployeeDetailsView(frame: CGRect.zero)
    let btnClose = UIButton(type: UIButtonType.system)
    
    
    public func setEmployee(emplyee: Employee) {
        self.employeeView.setEmployee(employee: emplyee)
        self.employeeDetailsView.setEmployee(employee: emplyee)
    }
    
    func closePress() {
        self .dismiss(animated: true, completion: nil)
    }

    override func loadView() {
        super.loadView()
     
        self.view.backgroundColor = UIColor.white
        self.btnClose.setTitle("Close", for: UIControlState.normal)
        self.btnClose.addTarget(self, action: #selector(closePress), for: UIControlEvents.touchUpInside)
        self.view.addSubview(self.employeeView)
        self.view.addSubview(self.employeeDetailsView)
        self.view.addSubview(self.btnClose)
        
        self.employeeView.snp.makeConstraints { (make) in
            make.top.equalTo(self.view.snp.top)
            make.centerX.equalTo(self.view.snp.centerX)
        }
        self.employeeDetailsView.snp.makeConstraints { (make) in
            make.top.equalTo(self.employeeView.snp.bottom)
            make.leading.equalTo(self.view.snp.leading)
        }
        self.btnClose.snp.makeConstraints { (make) in
            make.bottom.equalTo(self.view.snp.bottom)
            make.centerX.equalTo(self.view.snp.centerX)
            make.height.equalTo(100)
        }
    }
    
}
