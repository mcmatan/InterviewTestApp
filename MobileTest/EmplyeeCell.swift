//
//  EmpolyCell.swift
//  MobileTest
//
//  Created by Matan Cohen on 17/07/2017.
//  Copyright © 2017 dapulse. All rights reserved.
//

import Foundation
import UIKit
import SnapKit


class EmployeeCell: UICollectionViewCell {
    let employeeView = EmployeeView(frame:CGRect.zero)
    
    func setEmployee(employee: Employee) {
        self.employeeView.setEmployee(employee: employee)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }

    
    func setupView(){
        self.contentView.addSubview(self.employeeView)
        self.employeeView.snp.makeConstraints { (make) in
            make.edges.equalTo(self.contentView)
        }
    }
    
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
