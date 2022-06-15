//
//  LanguagesViewController.swift
//  StudyCards
//
//  Created by Bakdaulet Berdikul on 08.06.2022.
//

import UIKit
import SnapKit

class LanguagesViewController: BaseVC {
    
    weak var coordinator: LanguagesCoordinator?

    private var factory = LanguagesFactory()
    
    private var viewModel = LanguageViewModel()
    
    private lazy var tableView = factory.tableView
    
    private lazy var tableDirector: LanguageTVManager = {
        let tableDirector = LanguageTVManager(tableView: tableView, items: viewModel.languageFields)
        return tableDirector
    }()
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.navigationBar.isHidden = true
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.isHidden = false
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground

        navigationItem.title = "Languages"
        
        viewModel.fetchAllDatas()
        configureUI()
        cellActionHandlers()
        tableDirector.tableView.reloadData()
    }
    
    private func configureUI(){
        view.addSubview(tableView)
        tableView.snp.makeConstraints{
            $0.width.equalToSuperview()
            $0.height.equalToSuperview()
            $0.center.equalToSuperview()
        }
    }

}

// MARK: - Table view delegate
extension LanguagesViewController {

    private func cellActionHandlers() {
        self.tableDirector.actionProxy
            .on(action: .didSelect) { [weak self] (config: LanguageTVCellConfigurator, cell) in
                guard let self = self else {return}
                
                cell.isChecked.toggle()
            }
    }
}
