//
//  HomeNavBarView.swift
//  StudyCards
//
//  Created by Bakdaulet Berdikul on 07.06.2022.
//

import UIKit
import SnapKit

protocol HomeNavBarViewDelegate: AnyObject {
    func didFirstLanguageTapped()
    func didSecondLanguageTapped()
    func didSwapLanguageTapped()
}

class HomeNavBarView: UIView {
    
    weak var delegate: HomeNavBarViewDelegate?
    
    private lazy var firstLng = UIButton().then{
        $0.semanticContentAttribute = .forceRightToLeft
        $0.setTitle("Rus", for: .normal)
        $0.titleLabel?.font = UIFont(name: "HelveticaNeue-Medium", size: 19)
        $0.setTitleColor(.label, for: .normal)
        $0.tintColor = Asset.darkLight.color
        $0.setImage(Asset.icChevronDown.image, for: .normal)
    }
    
    private lazy var secondLng = UIButton().then{
        $0.semanticContentAttribute = .forceRightToLeft
        $0.setTitle("Eng", for: .normal)
        $0.titleLabel?.font = UIFont(name: "HelveticaNeue-Medium", size: 19)
        $0.setTitleColor(.label, for: .normal)
        $0.tintColor = Asset.darkLight.color
        $0.setImage(Asset.icChevronDown.image, for: .normal)
    }
    
    private lazy var firstLngIV = UIImageView().then{
        $0.image = Asset.rus.image
        $0.layer.cornerRadius = 10
        $0.layer.borderColor = Asset.mainLightGray.color.cgColor
        $0.layer.borderWidth = 1
        $0.clipsToBounds = true
        $0.contentMode = .scaleAspectFill
    }
    
    private lazy var secondLngIV = UIImageView().then{
        $0.image = Asset.eng.image
        $0.layer.cornerRadius = 10
        $0.layer.borderColor = Asset.mainLightGray.color.cgColor
        $0.layer.borderWidth = 1
        $0.clipsToBounds = true
        $0.contentMode = .scaleAspectFill
    }
    
    private lazy var swapBtn = UIButton().then{
        $0.setImage(Asset.icSwap.image, for: .normal)
        $0.tintColor = Asset.darkLight.color
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        isUserInteractionEnabled = true
        backgroundColor = .systemBackground
        
        firstLng.addTarget(self, action: #selector(didFirstLangTapped), for: .touchUpInside)
        secondLng.addTarget(self, action: #selector(didSecondLangTapped), for: .touchUpInside)
        swapBtn.addTarget(self, action: #selector(didSwapLangTapped), for: .touchUpInside)
        configureUI()
    }
    
    private func configureUI(){
        addSubview(swapBtn)
        addSubview(firstLngIV)
        addSubview(firstLng)
        addSubview(secondLngIV)
        addSubview(secondLng)
        
        swapBtn.snp.makeConstraints{
            $0.center.equalToSuperview()
            $0.size.equalTo(24)
        }
        
        firstLng.snp.makeConstraints{
            $0.centerY.equalTo(swapBtn.snp.centerY)
            $0.trailing.equalTo(swapBtn.snp.leading).offset(-18)
            $0.height.equalTo(24)
            $0.width.equalTo(55)
        }
        
        firstLngIV.snp.makeConstraints{
            $0.centerY.equalTo(swapBtn.snp.centerY)
            $0.trailing.equalTo(firstLng.snp.leading).offset(-8)
            $0.size.equalTo(20)
        }
        
        secondLngIV.snp.makeConstraints{
            $0.centerY.equalTo(swapBtn.snp.centerY)
            $0.leading.equalTo(swapBtn.snp.trailing).offset(18)
            $0.size.equalTo(20)
        }
        
        secondLng.snp.makeConstraints{
            $0.centerY.equalTo(swapBtn.snp.centerY)
            $0.leading.equalTo(secondLngIV.snp.trailing).offset(8)
            $0.height.equalTo(24)
            $0.width.equalTo(55)
        }
    }
    
    @objc private func didFirstLangTapped(){
        delegate?.didFirstLanguageTapped()
    }
    
    @objc private func didSecondLangTapped(){
        delegate?.didSecondLanguageTapped()
    }
    
    @objc private func didSwapLangTapped(){
        swapBtn.transformScale()
        delegate?.didSwapLanguageTapped()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
