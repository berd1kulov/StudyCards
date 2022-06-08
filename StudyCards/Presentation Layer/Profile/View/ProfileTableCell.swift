//
//  ProfileTableCell.swift
//  StudyCards
//
//  Created by Bakdaulet Berdikul on 06.06.2022.
//

import UIKit
import SnapKit

typealias ProfileTableCellConfigurator = TableCellConfigurator<ProfileTableCell, ProfileTVBtn>
class ProfileTableCell: UITableViewCell, ConfigurableCell {
    
    typealias DataType = ProfileTVBtn
    
    var buttonType: ProfileTVBtnType?
    
    private lazy var arrowRightIV = UIImageView().then{
        $0.image = Asset.icChevronRight.image
        $0.tintColor = Asset.darkLight.color
        $0.contentMode = .scaleAspectFit
    }
    
    private lazy var label = UILabel().then{
        $0.font = UIFont(name: "HelveticaNeue-Regular", size: 16)
        $0.text = L10n.signOut
    }

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        configureUI()
    }
    
    private func configureUI(){
        addSubview(arrowRightIV)
        addSubview(label)
        
        arrowRightIV.snp.makeConstraints{
            $0.centerY.equalToSuperview()
            $0.size.equalTo(32)
            $0.trailing.equalTo(contentView.snp.trailing).inset(16)
        }
        
        label.snp.makeConstraints{
            $0.centerY.equalToSuperview()
            $0.leading.equalTo(contentView.snp.leading).inset(16)
        }
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(data: ProfileTVBtn) {
        if data.type == .buyWords{
            label.textColor = Asset.primaryBlue.color
        }
        
        label.text = data.type.titleValue
        
        if data.icon != nil{
            arrowRightIV.image = data.icon
        }else{
            arrowRightIV.isHidden = true
        }
        
        buttonType = data.type
    }

}
