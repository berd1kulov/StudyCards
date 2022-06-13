//
//  ProfileCoordinator.swift
//  StudyCards
//
//  Created by Bakdaulet Berdikul on 13.06.2022.
//

import UIKit

class ProfileCoordinator: NSObject, Coordinator{
    var finishDelegate: CoordinatorFinishDelegate?
    var childCoordinators: [Coordinator] = [Coordinator]()
    var navigationController: UINavigationController
    
    var type: CoordinatorType { .tab }
    
    func start() {
        pushProfile()
    }
    
    required init(_ navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    fileprivate func pushProfile() {
        let profileVC = ProfileViewController()
        profileVC.didSendEventClosure = { [weak self] event in
            switch event {
            case .logout:
                self?.finish()
            }
        }
        profileVC.coordinator = self
        navigationController.pushViewController(profileVC, animated: false)
    }
    
    func finish() {
        navigationController.popViewController(animated: true)
    }
}
