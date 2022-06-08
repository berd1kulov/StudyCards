//
//  ProfileImageCell.swift
//  StudyCards
//
//  Created by Bakdaulet Berdikul on 06.06.2022.
//

import UIKit
import SnapKit

typealias ProfileImageCellConfigurator = TableCellConfigurator<ProfileImageCell, User>
class ProfileImageCell: UITableViewCell, ConfigurableCell {
    
    typealias DataType = User
    
    private lazy var userImage = UIImageView().then{
        $0.layer.borderColor = Asset.primaryBlue.color.cgColor
        $0.layer.borderWidth = 1
        $0.layer.cornerRadius = 50
        $0.clipsToBounds = true
        $0.contentMode = .scaleAspectFill
    }
    
    private lazy var userName = UILabel().then{
        $0.font = UIFont(name: "HelveticaNeue-Regular", size: 16)
        $0.text = "Bakdaulet Berdikul"
    }
    
    private lazy var email = UILabel().then{
        $0.font = UIFont(name: "HelveticaNeue-Regular", size: 16)
        $0.text = "bakdaulet.berdikul@mail.ru"
    }

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        isUserInteractionEnabled = false
        configureUI()
    }
    
    private func configureUI(){
        addSubview(userImage)
        addSubview(userName)
        addSubview(email)
        
        userImage.snp.makeConstraints{
            $0.centerX.equalToSuperview()
            $0.size.equalTo(100)
            $0.top.equalTo(contentView.snp.top).inset(35)
        }
        
        userName.snp.makeConstraints{
            $0.centerX.equalToSuperview()
            $0.top.equalTo(userImage.snp.bottom).offset(18)
        }
        
        email.snp.makeConstraints{
            $0.centerX.equalToSuperview()
            $0.top.equalTo(userName.snp.bottom).offset(12)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(data: User) {
        userImage.image = UIImage(named: data.userImage)
        userName.text = data.userName + " " + data.userSurname
        email.text = data.userEmail
    }
}
