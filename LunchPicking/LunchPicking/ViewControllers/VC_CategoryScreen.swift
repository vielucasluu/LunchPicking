//
//  VC_CategoryScreen.swift
//  LunchPicking
//
//  Created by Nguyen Truong Duy Khang on 8/18/20.
//  Copyright © 2020 Luu Lucas. All rights reserved.
//

import UIKit
import SnapKit
class VC_CategoryScreen: UIViewController {
    
    let titleLabel  =    UILabel()
    let items = ["Food","Beverage","Extra"]
    
    lazy var segmentedControl: UISegmentedControl =  {
        let control = UISegmentedControl(items: self.items)
        control.selectedSegmentIndex = 0
        control.layer.cornerRadius = 9
        return control
    }()
    
    //MARK:- Life Circle
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let backButtonItem = UIBarButtonItem(image: UIImage(named: "back_icon"),
                                             style: .plain, target: self,
                                             action: #selector(backButtonTapped))
        backButtonItem.tintColor = .black
        navigationItem.leftBarButtonItem = backButtonItem
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.init(named: "2c767e") ?? UIColor.black, NSAttributedString.Key.font: UIFont.init(name: "AvenirNext-DemiBold", size: 17.0) ?? UIFont.systemFontSize]
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        //MARK:- Title screen
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
        
        view.addSubview(segmentedControl)
        segmentedControl.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview().offset(-250)
            make.height.equalTo(32)
            make.width.equalTo(343)
        }
    }
    //MARK:- UI Actions
    @objc func backButtonTapped() {
        navigationController?.popViewController(animated: true)
    }
    
    
    //MARK:- TableView methods
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        <#code#>
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        <#code#>
    }

}
