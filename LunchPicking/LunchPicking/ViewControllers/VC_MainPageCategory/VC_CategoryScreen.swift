//
//  VC_CategoryScreen.swift
//  LunchPicking
//
//  Created by Nguyen Truong Duy Khang on 8/18/20.
//  Copyright © 2020 Luu Lucas. All rights reserved.
//

import UIKit
import SnapKit

enum TableViewType : Int {
    case food = 0
    case beverage = 1
    case extra = 2
}

class VC_CategoryScreen: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    let titleLabel          =       UILabel()
    let tableView           =       UITableView()
    
    let items               =       ["Food","Beverage","Extra"]
    let images              =       ["chicken", "coffee", "yogurt"]
    var tableType           : TableViewType = .food
    
    lazy var segmentedControl: UISegmentedControl =  {
        let control = UISegmentedControl(items: self.items)
        control.selectedSegmentIndex = 0
        control.layer.cornerRadius = 9
        control.addTarget(self, action: #selector(segmentDidChangeValue), for: .valueChanged)
        return control
    }()
    

    //MARK:- Life Circle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white//UIColor(displayP3Red: 249, green: 249, blue: 249, alpha: 0.94)
        
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
        
        ///MARK: UISegmentedControl
        
        let segmentView = UIView()
        segmentView.backgroundColor = .white
        self.view.addSubview(segmentView)
        segmentView.snp.makeConstraints { (make) in
            make.centerX.width.equalToSuperview()
            make.top.equalTo(titleLabel.snp.bottom).offset(30)
            make.height.equalTo(44)
        }
        
        segmentedControl.addTarget(self, action: #selector(segmentDidChangeValue), for: .valueChanged)
        segmentedControl.backgroundColor = UIColor.white
        segmentView.addSubview(segmentedControl)
        segmentedControl.snp.makeConstraints { (make) in
            make.width.equalToSuperview().offset(-32)
            make.height.equalToSuperview().offset(-12)
            make.center.equalToSuperview()
        }
        
        ///MARK:- FoodTableView
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(TC_CategoryViewCell.self, forCellReuseIdentifier: "cellIdentifier")
        tableView.separatorStyle = .none
        self.view.addSubview(tableView)
        tableView.backgroundColor = UIColor.init(hexString: "f0f9f9f9")
        tableView.snp.makeConstraints { (make) in
            make.top.equalTo(segmentedControl.snp.bottom).offset(30)
            make.left.right.bottom.equalToSuperview()
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
        
    //MARK:- UI Actions
    @objc func pickButtonTapped() {
        let details = VC_MainPagePickDetails()
        self.navigationController?.pushViewController(details, animated: true)
    }

    @objc func segmentDidChangeValue(){
        tableType = TableViewType.init(rawValue: segmentedControl.selectedSegmentIndex) ?? .food
        tableView.reloadData()
    }
    
    //MARK:- UITableViewDataSource
    func numberOfSections(in tableView: UITableView) -> Int {
        1
    }
    

    //MARK:- TableView Methods
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 123
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        print("")
    }
    
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .insert
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellIdentifier", for: indexPath) as! TC_CategoryViewCell
        cell.accessoryType = .detailButton
        cell.editingAccessoryType = .checkmark
        
        switch self.tableType {
        case .food:
            cell.productImage.image = UIImage.init(named: "chicken")
            break
        case .beverage:
            cell.productImage.image = UIImage.init(named: "coffee")
            break
        default:
            cell.productImage.image = UIImage.init(named: "yogurt")
        }
        return cell
    }
    
    //MARK: - UITableViewDelegate
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
