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
    
    let tableView           =       UITableView()
    let images              =       ["chicken","coffee","yogurt"]
    
    var index               =       0
    
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
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(TC_CategoryViewCell.self, forCellReuseIdentifier: "cellIdentifier")
        self.view.addSubview(tableView)
        tableView.snp.makeConstraints { (make) in
            make.top.equalTo(segmentedControl.snp.bottom).offset(30)
            make.left.right.bottom.equalToSuperview()
        }
    }
    
    @objc func segmentDidChangeValue(){
        index = segmentedControl.selectedSegmentIndex
        tableView.reloadData()
    }
    
    
    //MARK:- TableView Methods
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellIdentifier", for: indexPath) as! TC_CategoryViewCell
        cell.imageView?.image = UIImage(named: images[index])
        return cell
    }
    
    
    
    
    
    
}
