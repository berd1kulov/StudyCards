//
//  AuthFactory.swift
//  StudyCards
//
//  Created by Bakdaulet Berdikul on 06.06.2022.
//

import UIKit

class AuthFactory {
    
    let scrollView = UIScrollView().then{
        $0.isScrollEnabled = true
        $0.showsVerticalScrollIndicator = false
    }
    
    let emailField = CustomTextField().then{
        $0.placeholder = L10n.email
        $0.keyboardType = .emailAddress
        $0.sizeToFit()
        $0.layer.borderWidth = 1
        $0.layer.borderColor = UIColor.gray.cgColor
        $0.layer.cornerRadius = 5
        $0.clipsToBounds = true
        $0.setLeftPaddingPoints(16)
    }
    
    let passwordField = CustomTextField().then{
        $0.placeholder = L10n.password
        $0.sizeToFit()
        $0.layer.borderWidth = 1
        $0.layer.borderColor = UIColor.gray.cgColor
        $0.layer.cornerRadius = 5
        $0.clipsToBounds = true
        $0.isSecureTextEntry = true
        $0.enablePasswordToggle()
        $0.setLeftPaddingPoints(16)
    }
    
    let forgotLabel = UILabel().then{
        $0.text = L10n.forgotPassword
        $0.font = UIFont(name: "HelveticaNeue-Regular", size: 16)
        $0.textColor = Asset.mainLightGray.color
    }
    
    let signInButton = UIButton().then{
        $0.setTitle(L10n.signIn, for: .normal)
        $0.titleLabel?.font = UIFont(name: "HelveticaNeue-Bold", size: 19)
        $0.setTitleColor(.white, for: .normal)
        $0.backgroundColor = Asset.primaryBlue.color
        $0.layer.cornerRadius = 5
        $0.clipsToBounds = true
    }
    
}
