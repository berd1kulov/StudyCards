//
//  LanguagesCoordinator.swift
//  StudyCards
//
//  Created by Bakdaulet Berdikul on 15.06.2022.
//

import UIKit

class LanguagesCoordinator: NSObject, Coordinator{
    var finishDelegate: CoordinatorFinishDelegate?
    var childCoordinators: [Coordinator] = [Coordinator]()
    var navigationController: UINavigationController
    
    var type: CoordinatorType { .tab }
    
    func start() {
        pushLanguages()
    }
    
    required init(_ navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    deinit {
        print("LanguagesCoordinator deinit")
    }
    
    fileprivate func pushLanguages() {
        let languagesVC = LanguagesViewController()
        languagesVC.coordinator = self
        navigationController.pushViewController(languagesVC, animated: true)
    }
    
    func finish() {
        navigationController.popViewController(animated: true)
    }
}
