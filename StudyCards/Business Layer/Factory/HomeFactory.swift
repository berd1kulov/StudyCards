//
//  HomeFactory.swift
//  StudyCards
//
//  Created by Bakdaulet Berdikul on 07.06.2022.
//

import UIKit
import JJFloatingActionButton

class HomeFactory {
    
    let actionButton = JJFloatingActionButton().then{
        $0.buttonColor = Asset.primaryBlue.color
    }
    
    let topNavBarView = HomeNavBarView().then{
        $0.layer.masksToBounds = false
        $0.layer.shadowRadius = 1
        $0.layer.shadowOpacity = 0.3
        $0.layer.shadowColor = Asset.mainLightGray.color.cgColor
        $0.layer.shadowOffset = CGSize(width: 0 , height: 2)
    }
    
    let tableView = UITableView().then{
        $0.isUserInteractionEnabled = true
        $0.backgroundColor = .systemBackground
        $0.separatorStyle = .none
        $0.showsVerticalScrollIndicator = false
        
        $0.registerTVCellInCollection(HomeWordsCell.self)
    }
    
}
