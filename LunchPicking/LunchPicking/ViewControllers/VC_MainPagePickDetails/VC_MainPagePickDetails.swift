//
//  VC_MainPagePickDetails.swift
//  LunchPicking
//
//  Created by Luu Lucas on 8/23/20.
//  Copyright © 2020 Luu Lucas. All rights reserved.
//

import UIKit

class VC_MainPagePickDetails: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white

        // Do any additional setup after loading the view.
        
        let backBtn = UIButton()
        backBtn.setTitle("Back", for: .normal)
        backBtn.addTarget(self, action: #selector(backButtonTapped), for: .touchDown)
        self.view.addSubview(backBtn)
        backBtn.snp.makeConstraints { (make) in
            make.center.size.equalToSuperview()
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    @objc func backButtonTapped() {
        self.navigationController?.popViewController(animated: true)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
