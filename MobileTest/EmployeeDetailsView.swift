//
//  EmployeeDetailsView.swift
//  MobileTest
//
//  Created by Matan Cohen on 17/07/2017.
//  Copyright © 2017 dapulse. All rights reserved.
//

import Foundation
import UIKit
import SnapKit

class EmployeeDetailsView: UIView {
    private let phoneTitle = UILabel()
    private let phoneDiscription = UILabel()
    private let emailTitle = UILabel()
    private let emailDiscription = UILabel()
    
    public func setEmployee(employee: Employee) {
        self.phoneDiscription.text = employee.phone
        self.emailDiscription.text = employee.email
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView(){
        self.emailTitle.text = "Email"
        self.phoneTitle.text = "Phone"
        self.addSubview(self.phoneTitle)
        self.addSubview(self.phoneDiscription)
        self.addSubview(self.emailTitle)
        self.addSubview(self.emailDiscription)
        
        self.phoneTitle.snp.makeConstraints { (make) in
            make.leading.equalTo(self)
            make.top.equalTo(self)
        }
        
        self.phoneDiscription.snp.makeConstraints { (make) in
            make.leading.equalTo(self.phoneTitle.snp.trailing)
            make.top.equalTo(self)
        }
        
        self.emailTitle.snp.makeConstraints { (make) in
            make.leading.equalTo(self)
            make.top.equalTo(phoneTitle.snp.bottom)
        }
        
        self.emailDiscription.snp.makeConstraints { (make) in
            make.leading.equalTo(self.emailTitle.snp.trailing)
            make.top.equalTo(phoneTitle.snp.bottom)
        }
    }
}
