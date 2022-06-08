//
//  LanguageTVCell.swift
//  StudyCards
//
//  Created by Bakdaulet Berdikul on 08.06.2022.
//

import UIKit
import SnapKit

typealias LanguageTVCellConfigurator = TableCellConfigurator<LanguageTVCell, Language>
class LanguageTVCell: UITableViewCell, ConfigurableCell {
    
    typealias DataType = Language
    
    private lazy var backView = UIView().then{
        $0.layer.cornerRadius = 22
        $0.clipsToBounds = true
    }
    
    var isChecked = false {
        didSet{
            if isChecked {
                backView.backgroundColor = Asset.primaryBlue.color.withAlphaComponent(0.3)
                checkSelectIV.image = Asset.icLangChecked.image
            }else{
                backView.backgroundColor = .clear
                checkSelectIV.image = Asset.icLangUnchecked.image
            }
        }
    }
    
    private lazy var langIV = UIImageView().then{
        $0.layer.cornerRadius = 15
        $0.clipsToBounds = true
        $0.layer.borderWidth = 1
        $0.layer.borderColor = Asset.mainLightGray.color.cgColor
        $0.image = Asset.rus.image
        $0.contentMode = .scaleAspectFill
    }
    
    private lazy var langLabel = UILabel().then{
        $0.font = UIFont(name: "HelveticaNeue-Regular", size: 16)
        $0.text = "Russian"
    }
    
    private lazy var checkSelectIV = UIImageView().then{
        $0.image = Asset.icLangUnchecked.image
        $0.layer.cornerRadius = 12
        $0.clipsToBounds = true
        $0.contentMode = .scaleAspectFit
    }

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureUI(){
        contentView.addSubview(backView)
        backView.addSubview(langIV)
        backView.addSubview(langLabel)
        backView.addSubview(checkSelectIV)
        
        backView.snp.makeConstraints{
            $0.leading.equalTo(contentView.snp.leading).inset(16)
            $0.trailing.equalTo(contentView.snp.trailing).inset(16)
            $0.centerY.equalTo(contentView.snp.centerY)
            $0.height.equalTo(44)
        }
        
        langIV.snp.makeConstraints{
            $0.leading.equalTo(backView.snp.leading).inset(6)
            $0.size.equalTo(30)
            $0.centerY.equalTo(backView.snp.centerY)
        }
        
        langLabel.snp.makeConstraints{
            $0.leading.equalTo(langIV.snp.trailing).offset(16)
            $0.centerY.equalTo(backView.snp.centerY)
        }
        
        checkSelectIV.snp.makeConstraints{
            $0.trailing.equalTo(backView.snp.trailing).inset(8)
            $0.centerY.equalTo(backView.snp.centerY)
            $0.size.equalTo(24)
        }
    }
    
    func configure(data: Language) {
        langIV.image = UIImage(named: data.icon)
        langLabel.text = data.language
    }

}
