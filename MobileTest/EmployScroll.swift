//
//  HorizontalCollectionview.swift
//  MobileTest
//
//  Created by Matan Cohen on 17/07/2017.
//  Copyright © 2017 dapulse. All rights reserved.
//

import Foundation
import UIKit

import UIKit

let cellId = "myCell"

protocol EmployScrollDidSelect: NSObjectProtocol {
    func didSelectEmployee(employee: Employee)
}

class EmployScroll: UIView, UICollectionViewDataSource, UICollectionViewDelegate {
    private var employees: [Employee]?
    var myCollectionView:UICollectionView?
    weak var delegate: EmployScrollDidSelect?
    
    public func setEmployees(employees: [Employee]) {
        self.employees = employees
        self.myCollectionView?.reloadData()
    }

    override init(frame: CGRect) {
        super.init(frame: CGRect.zero)
        setupView(frame: frame)
    }
    
    convenience init() {
        self.init(frame: CGRect.zero)
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("This class does not support NSCoding")
    }
    
    func setupView(frame: CGRect) {
        self.frame = frame
        self.backgroundColor = UIColor.green
        self.setupCollectionView()
    }
    
    func setupCollectionView() {

        let cellSize = self.frame.height;
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
        layout.itemSize = CGSize(width: cellSize, height: cellSize)
        layout.scrollDirection = .horizontal
        
        myCollectionView = UICollectionView(frame: CGRect(x: 0, y: 0, width: self.frame.width, height: self.frame.height), collectionViewLayout: layout)
        myCollectionView?.dataSource = self
        myCollectionView?.delegate = self
        myCollectionView?.backgroundColor = UIColor.red
        myCollectionView?.register(EmployeeCell.self, forCellWithReuseIdentifier: cellId)
        
        self.addSubview(self.myCollectionView!)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if let isEmployees = self.employees {
            return isEmployees.count
        } else {
            return 0
        }
    }
    
    internal func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! EmployeeCell
        let currentEmployeee = self.employees?[indexPath.row]
        cell.backgroundColor = UIColor.blue
        cell.setEmployee(employee: currentEmployeee!)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath)
    {
        if let isDelegate = self.delegate {
            isDelegate.didSelectEmployee(employee: (self.employees?[indexPath.row])!)
        }
        print("User tapped on item \(indexPath.row)")
    }

    
}
