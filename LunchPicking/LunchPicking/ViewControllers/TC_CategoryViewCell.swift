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

    let productImage    =       UIImageView()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.addSubview(productImage)
        productImage.snp.makeConstraints { (make) in
            make.centerY.equalToSuperview()
            make.left.equalToSuperview().offset(10)
            make.height.equalToSuperview().offset(-40)
            make.height.equalTo(productImage.snp.width)
        }
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
