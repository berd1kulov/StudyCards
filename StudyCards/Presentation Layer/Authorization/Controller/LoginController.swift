//
//  LoginController.swift
//  StudyCards
//
//  Created by Bakdaulet Berdikul on 06.06.2022.
//

import UIKit
import SnapKit

class LoginController: BaseVC {
    
    var didSendEventClosure: ((LoginController.Event) -> Void)?
    
    private var factory = AuthFactory()
    
    private lazy var scrollView = factory.scrollView
    private lazy var emailField = factory.emailField
    private lazy var passwordField = factory.passwordField
    private lazy var forgotLabel = factory.forgotLabel
    private lazy var signInButton = factory.signInButton

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        signInButton.addTarget(self, action: #selector(signInTapped), for: .touchUpInside)
        
        configureUI()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        scrollView.contentSize = CGSize(width: UIScreen.main.bounds.width, height: 400)
    }
    
    @objc private func signInTapped(){
        signInButton.transformScale()
        let vc = TabBarViewController()
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true)
    }
    
    private func configureUI(){
        
        view.addSubview(scrollView)
        scrollView.addSubview(emailField)
        scrollView.addSubview(passwordField)
        scrollView.addSubview(forgotLabel)
        scrollView.addSubview(signInButton)
        
        scrollView.snp.makeConstraints{
            $0.width.equalTo(view.snp.width)
            $0.height.equalTo(view.snp.height)
            $0.center.equalToSuperview()
        }
        
        emailField.snp.makeConstraints{
            $0.top.equalToSuperview().inset(40)
            $0.width.equalTo(scrollView.snp.width).multipliedBy(0.9)
            $0.height.equalTo(58)
            $0.centerX.equalToSuperview()
        }
        
        passwordField.snp.makeConstraints{
            $0.top.equalTo(emailField.snp.bottom).offset(13)
            $0.width.equalTo(scrollView.snp.width).multipliedBy(0.9)
            $0.height.equalTo(58)
            $0.centerX.equalToSuperview()
        }
        
        forgotLabel.snp.makeConstraints{
            $0.top.equalTo(passwordField.snp.bottom).offset(16)
            $0.centerX.equalToSuperview()
            $0.height.equalTo(20)
        }
        
        signInButton.snp.makeConstraints{
            $0.top.equalTo(forgotLabel.snp.bottom).offset(16)
            $0.width.equalTo(scrollView.snp.width).multipliedBy(0.9)
            $0.height.equalTo(58)
            $0.centerX.equalToSuperview()
        }
    }
}

extension LoginController {
    enum Event {
        case login
    }
}
