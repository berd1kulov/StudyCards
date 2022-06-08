//
//  UITableView + Ext.swift
//  StudyCards
//
//  Created by Bakdaulet Berdikul on 08.06.2022.
//

import UIKit

extension UITableView {
    func registerTVCellInCollection<T: UITableViewCell>(_ cellType: T.Type) {
        register(cellType, forCellReuseIdentifier: String(describing: cellType) + "ID")
    }

    func dequeueTVCellFromCollection<T: UITableViewCell>(_ cellType: T.Type,
                                                 indexPath: IndexPath) -> T {
        dequeueReusableCell(withIdentifier: String(describing: cellType) + "ID", for: indexPath) as! T
    }
}

extension UICollectionView {
    func registerCVCellInCollection<T: UICollectionViewCell>(_ cellType: T.Type) {
        register(cellType, forCellWithReuseIdentifier: String(describing: cellType) + "ID")
    }
    
    func dequeueCVCellFromCollection<T: UICollectionViewCell>(_ cellType: T.Type,
                                                      _ indexPath: IndexPath) -> T {
        dequeueReusableCell(withReuseIdentifier: String(describing: cellType) + "ID", for: indexPath) as! T
    }
}

