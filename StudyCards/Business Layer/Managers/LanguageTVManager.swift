//
//  LanguageTVManager.swift
//  StudyCards
//
//  Created by Bakdaulet Berdikul on 08.06.2022.
//

import UIKit

class LanguageTVManager: NSObject {
    
    var lastSelectedRow: IndexPath?
    var currentlySelectedRow: IndexPath?
    
    let tableView: UITableView
    var items = [CellConfigurator]() {
        didSet {
            self.tableView.reloadData()
        }
    }
    
    let actionProxy = CellActionProxy()
    
    init(tableView: UITableView, items: [CellConfigurator]) {
        self.tableView = tableView
        super.init()
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.items = items
        
        NotificationCenter.default.addObserver(self, selector: #selector(onActionEvent(notification:)), name: CellAction.notificationName, object: nil)
    }
    
    @objc fileprivate func onActionEvent(notification: Notification) {
        if let eventData = notification.userInfo?["data"] as? CellActionEventData, let cell = eventData.cell as? UITableViewCell, let indexPath = self.tableView.indexPath(for: cell) {
            actionProxy.invoke(action: eventData.action, cell: cell, configurator: self.items[indexPath.row])
        }
    }
}

extension LanguageTVManager: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat { 44 }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        lastSelectedRow = currentlySelectedRow
        currentlySelectedRow = indexPath
        
        let cellConfig = self.items[indexPath.row]
        tableView.deselectRow(at: indexPath, animated: false)
        guard let cell = tableView.cellForRow(at: indexPath) else {
            return
        }
        
        if let lastIndexPath = lastSelectedRow{
            (tableView.cellForRow(at: lastIndexPath) as? LanguageTVCell)?.isChecked = false
        }
        
        self.actionProxy.invoke(action: .didSelect, cell: cell, configurator: cellConfig)
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        let cellConfig = self.items[indexPath.row]
        self.actionProxy.invoke(action: .willDisplay, cell: cell, configurator: cellConfig)
    }
}

extension LanguageTVManager: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item = self.items[indexPath.row]
        tableView.register(type(of: item).cellClass, forCellReuseIdentifier: type(of: item).reuseId)
        let cell = tableView.dequeueReusableCell(withIdentifier: type(of: item).reuseId, for: indexPath)
        item.configure(cell: cell)
        return cell
    }
    
    
}

