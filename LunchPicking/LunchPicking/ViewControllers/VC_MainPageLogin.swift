//
//  VC_MainPageLogin.swift
//  LunchPicking
//
//  Created by Luu Lucas on 8/17/20.
//  Copyright © 2020 Luu Lucas. All rights reserved.
//

import UIKit
import SnapKit
class VC_MainPageLogin: UIViewController {
    
    let loginLabel          =   UILabel()
    let emailTextField      =   UITextField()
    let passwordTextField   =   UITextField()
    let copyrightLabel      =   UILabel()
    let stackView           =   UIStackView()
    let signInButton        =   UIButton()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        
        //MARK:- loginLabel
        loginLabel.text = "Login"
        loginLabel.textColor = .black
        loginLabel.font = UIFont.boldSystemFont(ofSize: 34.0)
        
        self.view.addSubview(loginLabel)
        loginLabel.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(91)
            make.leading.equalToSuperview().offset(14)
            
            make.height.equalTo(81)
            make.width.equalTo(86)
            
        }
        
        //MARK:- emailTextField
        emailTextField.placeholder = "Email"
        emailTextField.borderStyle = .roundedRect
        emailTextField.layer.borderWidth = 0.5
        emailTextField.layer.cornerRadius = 5
        emailTextField.layer.masksToBounds = true
        emailTextField.layer.borderColor = UIColor.lightGray.cgColor
        
        emailTextField.snp.makeConstraints { (make) in
            make.height.equalTo(34)
            make.width.equalTo(240)
        }
        
        //MARK:- passwordTextField
        passwordTextField.placeholder = "Password"
        passwordTextField.borderStyle = .roundedRect
        passwordTextField.layer.borderWidth = 0.5
        passwordTextField.layer.cornerRadius = 5
        passwordTextField.layer.masksToBounds = true
        passwordTextField.layer.borderColor = UIColor.lightGray.cgColor
        passwordTextField.snp.makeConstraints { (make) in
            make.height.equalTo(34)
            make.width.equalTo(240)
        }
        
        //MARK:- signInButton
        signInButton.setTitle("Sign in with CBI account", for: .normal)
        signInButton.titleLabel?.font = .systemFont(ofSize: 20)
        signInButton.setTitleColor(.black, for: .normal)
        signInButton.layer.borderWidth = 0.5
        signInButton.layer.cornerRadius = 5
        signInButton.layer.borderColor = UIColor.lightGray.cgColor
        signInButton.layer.masksToBounds = true
        signInButton.addTarget(self, action: #selector(buttonAction(sender:)), for: .touchUpInside)
        
        signInButton.snp.makeConstraints { (make) in
            make.height.equalTo(44)
            make.width.equalTo(300)
        }
        
        //MARK:- Stack View
        stackView.addArrangedSubview(emailTextField)
        stackView.addArrangedSubview(passwordTextField)
        stackView.addArrangedSubview(signInButton)
        stackView.axis  = NSLayoutConstraint.Axis.vertical
        stackView.distribution  = UIStackView.Distribution.fill
        stackView.alignment = UIStackView.Alignment.center
        stackView.setCustomSpacing(18, after: stackView.subviews[0])
        stackView.setCustomSpacing(50, after: stackView.subviews[1])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(stackView)
        
        stackView.snp.makeConstraints { (make) in
            make.height.equalTo(180)
            make.width.equalTo(300)
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview().offset(-50)
        }
        
        
        //MARK:- copyrightLabel
        copyrightLabel.text = "Copy right @2020 CB/I"
        copyrightLabel.textColor = .black
        copyrightLabel.font = copyrightLabel.font.withSize(20)
        
        view.addSubview(copyrightLabel)
        copyrightLabel.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.bottom.equalToSuperview().offset(-40)
            make.height.equalTo(24)
            make.width.equalTo(204)
        }
        
    }
    //MARK:- UI Actions
    @objc func buttonAction(sender: UIButton!) {
        let CategoryScreen = VC_CategoryScreen()
        self.navigationController?.pushViewController(CategoryScreen, animated: true)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
}
