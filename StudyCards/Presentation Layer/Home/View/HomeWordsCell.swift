//
//  HomeWordsCell.swift
//  StudyCards
//
//  Created by Bakdaulet Berdikul on 15.06.2022.
//

import UIKit
import SnapKit

protocol HomeWordsCellDelegate: AnyObject {
    func didWordsPlayTapped(_ folder: WordFolder?)
}

class HomeWordsCell: UITableViewCell {
    
    private var wordsFolder: WordFolder? {
        didSet{
            folderNameLb.text = wordsFolder?.folder
            wordsCountLb.text = "\(wordsFolder?.words.count ?? 0) words"
        }
    }
    
    private lazy var folderNameLb = UILabel().then{
        $0.font = UIFont(name: "HelveticaNeue-Medium", size: 16)
    }
    
    private lazy var wordsCountLb = UILabel().then{
        $0.font = UIFont(name: "HelveticaNeue-Light", size: 16)
        $0.textColor = Asset.mainLightGray.color.withAlphaComponent(0.3)
    }
    
    private lazy var playBtn = UIButton().then{
        $0.setImage(Asset.icCirclePlay.image, for: .normal)
        $0.contentMode = .scaleAspectFit
        $0.layer.cornerRadius = 17
        $0.clipsToBounds = true
    }

    weak var notifier : HomeWordsCellDelegate?
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
//        selectionStyle = .none
        contentView.isUserInteractionEnabled = true
        
        playBtn.addTarget(self, action: #selector(didPlayTapped), for: .touchUpInside)
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc private func didPlayTapped(){
        playBtn.transformScale()
        notifier?.didWordsPlayTapped(wordsFolder)
    }
    
    private func configureUI(){
        contentView.addSubview(folderNameLb)
        contentView.addSubview(wordsCountLb)
        contentView.addSubview(playBtn)
        
        folderNameLb.snp.makeConstraints{
            $0.leading.equalTo(contentView.snp.leading).inset(16)
            $0.top.equalTo(contentView.snp.top).inset(12)
        }
        
        wordsCountLb.snp.makeConstraints{
            $0.leading.equalTo(contentView.snp.leading).inset(16)
            $0.top.equalTo(folderNameLb.snp.bottom).offset(3)
        }
        
        playBtn.snp.makeConstraints{
            $0.trailing.equalTo(contentView.snp.trailing).inset(16)
            $0.centerY.equalTo(contentView.snp.centerY)
            $0.size.equalTo(34)
        }
    }
    
    func configureCell(cell: WordFolder){
        wordsFolder = cell
    }

}
