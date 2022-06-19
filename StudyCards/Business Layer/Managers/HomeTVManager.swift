//
//  HomeTVManager.swift
//  StudyCards
//
//  Created by Bakdaulet Berdikul on 15.06.2022.
//

import UIKit

protocol HomeTVManagerNotifier : AnyObject {
    func selectPlayItem(_ folder: WordFolder?)
}

class HomeTVManager: NSObject, HomeWordsCellDelegate {
    
    func didWordsPlayTapped(_ folder: WordFolder?) {
        notifier?.selectPlayItem(folder)
    }
    
    weak var notifier : HomeTVManagerNotifier?
    
    let tableView: UITableView
    var items = [WordFolder]() {
        didSet {
            self.tableView.reloadData()
        }
    }
    
    init(tableView: UITableView, items: [WordFolder]) {
        self.tableView = tableView
        super.init()
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.items = items

    }
}

extension HomeTVManager: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat { 68 }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
    }
}

extension HomeTVManager: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int { items.count }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       
        let cell = tableView.dequeueTVCellFromCollection(HomeWordsCell.self, indexPath: indexPath)
        cell.notifier = self
        cell.configureCell(cell: items[indexPath.row])
        return cell
       
    }
}
