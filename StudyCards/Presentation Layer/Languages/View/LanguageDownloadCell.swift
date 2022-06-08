//
//  LanguageDownloadCell.swift
//  StudyCards
//
//  Created by Bakdaulet Berdikul on 08.06.2022.
//

import UIKit
import SnapKit

typealias LanguageDownloadCellConfigurator = TableCellConfigurator<LanguageDownloadCell, Language>
class LanguageDownloadCell: UITableViewCell, ConfigurableCell {

    typealias DataType = Language
    
    private lazy var backView = UIView().then{
        $0.layer.cornerRadius = 22
        $0.clipsToBounds = true
    }
    
    private lazy var langIV = UIImageView().then{
        $0.layer.cornerRadius = 15
        $0.clipsToBounds = true
        $0.layer.borderWidth = 1
        $0.layer.borderColor = Asset.mainLightGray.color.cgColor
        $0.contentMode = .scaleAspectFill
    }
    
    private lazy var langLabel = UILabel().then{
        $0.font = UIFont(name: "HelveticaNeue-Regular", size: 16)
    }
    
    private lazy var checkSelectBtn = UIButton().then{
        $0.contentMode = .scaleAspectFit
    }

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureUI(){
        addSubview(backView)
        backView.addSubview(langIV)
        backView.addSubview(langLabel)
        backView.addSubview(checkSelectBtn)
        
        backView.snp.makeConstraints{
            $0.leading.equalTo(snp.leading).inset(16)
            $0.centerY.equalTo(snp.centerY)
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
        
        checkSelectBtn.snp.makeConstraints{
            $0.trailing.equalTo(snp.trailing).inset(8)
            $0.centerY.equalTo(snp.centerY)
            $0.size.equalTo(24)
        }
    }
    
    func configure(data: Language) {
        langIV.image = UIImage(named: data.key)
        langLabel.text = data.language
    }

}
