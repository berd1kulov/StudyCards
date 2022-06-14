//
//  ExploreCoordinator.swift
//  StudyCards
//
//  Created by Bakdaulet Berdikul on 13.06.2022.
//

import UIKit

class ExploreCoordinator: NSObject, Coordinator{
    var finishDelegate: CoordinatorFinishDelegate?
    var childCoordinators: [Coordinator] = [Coordinator]()
    var navigationController: UINavigationController
    
    var type: CoordinatorType { .tab }
    
    func start() {
        pushExplore()
    }
    
    required init(_ navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    fileprivate func pushExplore() {
        let exploreVC = ExploreViewController()
        exploreVC.coordinator = self
        navigationController.pushViewController(exploreVC, animated: false)
    }
    
//    func finish() {
//        navigationController.popViewController(animated: true)
//    }
}
