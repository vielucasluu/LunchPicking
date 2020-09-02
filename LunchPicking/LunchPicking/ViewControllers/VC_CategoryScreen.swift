//
//  VC_CategoryScreen.swift
//  LunchPicking
//
//  Created by Nguyen Truong Duy Khang on 8/18/20.
//  Copyright © 2020 Luu Lucas. All rights reserved.
//

import UIKit
import SnapKit
class VC_CategoryScreen: UIViewController, UITableViewDelegate, UITableViewDataSource {

    let titleLabel          =       UILabel()
    let items               =       ["Food","Beverage","Extra"]
    
    let FoodTableView       =       UITableView()
    let BeverageTableView   =       UITableView()
    let ExtraTableView      =       UITableView()
    
    
    lazy var segmentedControl: UISegmentedControl =  {
        let control = UISegmentedControl(items: self.items)
        control.selectedSegmentIndex = 0
        control.layer.cornerRadius = 9
        control.addTarget(self, action: #selector(segmentDidChangeValue), for: .valueChanged)
        return control
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        ///MARK: Title screen
        titleLabel.text = "What’s pick?"
        titleLabel.textColor = .black
        titleLabel.font = UIFont.boldSystemFont(ofSize: 34.0)
        
        view.addSubview(titleLabel)
        titleLabel.snp.makeConstraints { (make) in
            make.width.equalTo(200)
            make.height.equalTo(40)
            make.top.equalToSuperview().offset(91)
            make.leading.equalToSuperview().offset(14)
        }
        
        ///MARK: UISegmentedControl
        view.addSubview(segmentedControl)
        segmentedControl.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.top.equalTo(titleLabel.snp.bottom).offset(30)
            make.height.equalTo(32)
            make.width.equalTo(343)
        }
        
        ///MARK:- FoodTableView
        FoodTableView.dataSource = self
        FoodTableView.delegate = self
        FoodTableView.register(TC_CategoryViewCell.self, forCellReuseIdentifier: "cellIndentifier")
        FoodTableView.largeContentImage = UIImage(contentsOfFile: "chicken")
        self.view.addSubview(FoodTableView)
        FoodTableView.snp.makeConstraints { (make) in
            make.top.equalTo(segmentedControl.snp.bottom).offset(30)
            make.left.right.bottom.equalToSuperview()
        }
        
        ///MARK:- BerverageTableView
        BeverageTableView.dataSource = self
        BeverageTableView.delegate = self
        BeverageTableView.register(TC_CategoryViewCell.self, forCellReuseIdentifier: "cellIndentifier")
        BeverageTableView.largeContentImage = UIImage(contentsOfFile: "coffee")
        self.view.addSubview(BeverageTableView)
        BeverageTableView.snp.makeConstraints { (make) in
            make.top.equalTo(segmentedControl.snp.bottom).offset(30)
            make.left.right.bottom.equalToSuperview()
        }
        ///MARK:- ExtraTableView
        ExtraTableView.dataSource = self
        ExtraTableView.delegate = self
        ExtraTableView.register(TC_CategoryViewCell.self, forCellReuseIdentifier: "cellIndentifier")
        
        ExtraTableView.largeContentImage = UIImage(contentsOfFile: "yogurt")
        self.view.addSubview(ExtraTableView)
        ExtraTableView.snp.makeConstraints { (make) in
            make.top.equalTo(segmentedControl.snp.bottom).offset(30)
            make.left.right.bottom.equalToSuperview()
        }
        
        
        
    }
    
   @objc func segmentDidChangeValue(){
        switch segmentedControl.selectedSegmentIndex {
        case 1:
            FoodTableView.isHidden = true
            ExtraTableView.isHidden = true
        case 2:
            FoodTableView.isHidden = true
            BeverageTableView.isHidden = true
        default:
            BeverageTableView.isHidden = true
            ExtraTableView.isHidden = true
        }
    }
    
    
    //MARK:- TableView Methods
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
           return 100
       }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellIndentifier", for: indexPath) as! TC_CategoryViewCell
        return cell
    }

    
    
    
    
}
