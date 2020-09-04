//
//  VC_CategoryScreen.swift
//  LunchPicking
//
//  Created by Nguyen Truong Duy Khang on 8/18/20.
//  Copyright © 2020 Luu Lucas. All rights reserved.
//

import UIKit
import SnapKit

class VC_CategoryScreen: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    let titleLabel      =    UILabel()
    let items           = ["Food","Beverage","Extra"]
    
    let foodTableView   = UITableView()
    let extraTableView  = UITableView()
    
    lazy var segmentedControl: UISegmentedControl =  {
        let control = UISegmentedControl(items: self.items)
        control.selectedSegmentIndex = 0
        control.layer.cornerRadius = 9
        return control
    }()
    
    //MARK:- Life Circle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
//        let pickButton = UIBarButtonItem.init(title: "PickTest",
//                                              style: .done,
//                                              target: self,
//                                              action: #selector(pickButtonTapped))
//        navigationItem.rightBarButtonItem = pickButton
        
        
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.init(named: "2c767e") ?? UIColor.black, NSAttributedString.Key.font: UIFont.init(name: "AvenirNext-DemiBold", size: 17.0) ?? UIFont.systemFontSize]
        
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
        
        segmentedControl.addTarget(self, action: #selector(segmentDidChangeValue), for: .valueChanged)
        view.addSubview(segmentedControl)
        segmentedControl.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview().offset(-250)
            make.height.equalTo(32)
            make.width.equalTo(343)
        }
                
        foodTableView.dataSource = self
        foodTableView.delegate = self
        foodTableView.register(TC_CategoryViewCell.self, forCellReuseIdentifier: "cellIndentifier")
        foodTableView.backgroundColor = .red
        self.view.addSubview(foodTableView)
        foodTableView.snp.makeConstraints { (make) in
            make.top.equalTo(segmentedControl.snp.bottom).offset(30)
            make.left.right.bottom.equalToSuperview()
        }
        
        extraTableView.dataSource = self
        extraTableView.delegate = self
        extraTableView.register(TC_CategoryViewCell.self, forCellReuseIdentifier: "cellIndentifier")
        extraTableView.backgroundColor = .yellow
        self.view.addSubview(extraTableView)
        extraTableView.snp.makeConstraints { (make) in
            make.top.equalTo(segmentedControl.snp.bottom).offset(30)
            make.left.right.bottom.equalToSuperview()
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
        
    //MARK:- UI Actions
    @objc func pickButtonTapped() {
        let details = VC_MainPagePickDetails()
        self.navigationController?.pushViewController(details, animated: true)
    }
    
    @objc func segmentDidChangeValue() {
        if self.segmentedControl.selectedSegmentIndex == 0 {
            foodTableView.isHidden = false
            extraTableView.isHidden = true
        } else if self.segmentedControl.selectedSegmentIndex == 2 {
            foodTableView.isHidden = true
            extraTableView.isHidden = false
        }
    }
    
    //MARK:- UITableViewDataSource
    func numberOfSections(in tableView: UITableView) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellIndentifier", for: indexPath) as! TC_CategoryViewCell
        
        return cell
    }

}
