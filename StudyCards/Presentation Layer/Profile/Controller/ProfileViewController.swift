//
//  ProfileViewController.swift
//  StudyCards
//
//  Created by Bakdaulet Berdikul on 05.06.2022.
//

import UIKit
import SnapKit

class ProfileViewController: BaseVC {
    
    weak var coordinator: ProfileCoordinator?
    
    var didSendEventClosure: ((ProfileViewController.Event) -> Void)?
    
    private var factory = ProfileFactory()
    
    private var viewModel = ProfileViewModel()
    
    private lazy var tableView = factory.tableView
    
    private lazy var tableDirector: ProfileTVManager = {
        let tableDirector = ProfileTVManager(tableView: tableView, items: viewModel.profileFields)
        return tableDirector
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        navigationItem.title = L10n.profile
        
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
extension ProfileViewController {

    private func cellActionHandlers() {
        self.tableDirector.actionProxy
            .on(action: .didSelect) { [weak self] (config: ProfileTableCellConfigurator, cell) in
                guard let self = self else {return}
                switch cell.buttonType{
                case .buyWords: break
                case .resetPassword: break
                case .appLanguage: break
                case .signOut:
                    self.dismiss(animated: true)
//                    self.didSendEventClosure?(.logout)
                case .none:
                    break
                }
            }
    }
}

extension ProfileViewController {
    enum Event {
        case logout
    }
}

