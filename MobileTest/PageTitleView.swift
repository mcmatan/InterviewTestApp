//
//  PageTitleView.swift
//  MobileTest
//
//  Created by Matan Cohen on 17/07/2017.
//  Copyright © 2017 dapulse. All rights reserved.
//

import Foundation
import UIKit
import SnapKit


class PageTitleView: UIView {
    private let title = UILabel()
    init(title: String) {
        super.init(frame: CGRect.zero)
        setupView(title: title)
    }
    
    public func setTitle(title: String) {
        self.title.text = title
    }
    
    convenience init() {
        self.init(title: "")
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("This class does not support NSCoding")
    }
    
    func setupView(title: String) {
        self.title.text = title
        self.addSubview(self.title)
        self.title.snp.makeConstraints { (make) in
            make.edges.equalTo(self)
        }
    }
}
