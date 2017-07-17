//
//  EmployeeeView.swift
//  MobileTest
//
//  Created by Matan Cohen on 17/07/2017.
//  Copyright © 2017 dapulse. All rights reserved.
//

import Foundation
import UIKit

let profileImageSize = 100


class EmployeeView: UIView {
    private let imageView = UIImageView()
    private let title = UILabel()
    private let discription = UILabel()
    
    
    public func setEmployee(employee: Employee) {
        self.title.text = employee.name
        self.discription.text = employee.title
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    
    func setupView(){
        backgroundColor = UIColor.white
        self.addSubview(self.imageView)
        self.addSubview(self.title)
        self.addSubview(self.discription)
        
        self.imageView.backgroundColor = UIColor.yellow
        self.imageView.snp.makeConstraints { (make) in
            make.centerX.equalTo(self)
            make.top.equalTo(self)
            make.width.equalTo(profileImageSize)
            make.height.equalTo(profileImageSize)
        }
        self.title.snp.makeConstraints { (make) in
            make.centerX.equalTo(self)
            make.top.equalTo(imageView.snp.bottom)
        }
        self.discription.snp.makeConstraints { (make) in
            make.centerX.equalTo(self)
            make.top.equalTo(title.snp.bottom)
            make.bottom.equalTo(self)
        }
        
        self.imageView.layer.cornerRadius = CGFloat(Float(profileImageSize/2))
        self.imageView.clipsToBounds = true
        self.title.text = "Test1"
        self.discription.text = "Test2"
    }
    
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
