//
//  HomeViewController.swift
//  StudyCards
//
//  Created by Bakdaulet Berdikul on 05.06.2022.
//

import UIKit
import SnapKit

class HomeViewController: BaseVC {
    
    weak var coordinator: HomeCoordinator?
    
    private var factory = HomeFactory()
    private var viewModel = HomeViewModel()
    
    private lazy var tableView = factory.tableView
    
    private lazy var tableDirector: HomeTVManager = {
        let tableDirector = HomeTVManager(tableView: tableView, items: viewModel.wordsFields)
        return tableDirector
    }()

    private lazy var topNavBarView = factory.topNavBarView
    private lazy var actionButton = factory.actionButton
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        
        self.navigationController?.navigationBar.isHidden = true
        
        topNavBarView.delegate = self
        
        viewModel.fetchAllDatas()
        tableDirector.notifier = self
        
        configureNavBar()
        configureTableView()
        configureActionButton()
    }
    
//    override func viewDidLayoutSubviews() {
//        super.viewDidLayoutSubviews()
//        self.navigationController?.navigationBar.isHidden = true
//    }
    
    private func configureNavBar(){
        view.addSubview(topNavBarView)
        topNavBarView.snp.makeConstraints{
            $0.top.equalTo(view.snp.top).inset(16)
            $0.width.equalTo(view.snp.width)
            $0.centerX.equalTo(view.snp.centerX)
            $0.height.equalTo(46)
        }
    }
    
    private func configureTableView(){
        view.addSubview(tableView)
        tableView.snp.makeConstraints{
            $0.top.equalTo(topNavBarView.snp.bottom)
            $0.width.equalTo(view.snp.width)
            $0.centerX.equalTo(view.snp.centerX)
            $0.bottom.equalTo(view.snp.bottom)
        }
    }
    
    fileprivate func configureActionButton() {
        
        let wordFAB = actionButton.addItem().then{
            $0.titleLabel.text = L10n.word
            $0.titleLabel.font = UIFont(name: "HelveticaNeue-Bold", size: 16)
            $0.imageView.image = Asset.wordFab.image
            $0.buttonColor = Asset.primaryBlue.color
            $0.buttonImageColor = .white
        }
        wordFAB.action = { item in
            // Do something
        }
        
        let folderFAB = actionButton.addItem().then{
            $0.titleLabel.text = L10n.folder
            $0.titleLabel.font = UIFont(name: "HelveticaNeue-Bold", size: 16)
            $0.imageView.image = Asset.folderFab.image
            $0.buttonColor = Asset.primaryBlue.color
            $0.buttonImageColor = .white
        }
        folderFAB.action = { item in
            // Do something
        }
        
        actionButton.display(inViewController: self)
    }
}

extension HomeViewController: HomeNavBarViewDelegate, HomeTVManagerNotifier {
    func selectPlayItem(_ folder: WordFolder?) {
        print(folder?.folder ?? "")
    }
    
    func didFirstLanguageTapped() {
        coordinator?.openLanguages()
    }
    
    func didSecondLanguageTapped() {
        coordinator?.openLanguages()
    }
    
    func didSwapLanguageTapped() {
        print("Swap")
    }
}
