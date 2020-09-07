//
//  TC_CategoryViewCell.swift
//  LunchPicking
//
//  Created by Nguyen Truong Duy Khang on 8/18/20.
//  Copyright © 2020 Luu Lucas. All rights reserved.
//

import UIKit
import SnapKit
class TC_CategoryViewCell: UITableViewCell {
    
    let containterView  = UIView()
    let productImage    = UIImageView()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.backgroundColor = .clear
        
        containterView.backgroundColor = .white
        self.addSubview(containterView)
        containterView.snp.makeConstraints { (make) in
            make.center.width.equalToSuperview()
            make.height.equalToSuperview().offset(-20)
        }
        
        productImage.layer.cornerRadius = 10
        productImage.layer.masksToBounds = true
        productImage.contentMode = .scaleAspectFill
        containterView.addSubview(productImage)
        productImage.snp.makeConstraints { (make) in
            make.centerY.equalToSuperview()
            make.height.equalToSuperview().offset(-22)
            make.left.equalToSuperview().offset(10)
            make.width.equalTo(123)
        }
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
