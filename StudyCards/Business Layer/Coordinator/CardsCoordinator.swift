//
//  CardsCoordinator.swift
//  StudyCards
//
//  Created by Bakdaulet Berdikul on 13.06.2022.
//

import UIKit

class CardsCoordinator: NSObject, Coordinator{
    var finishDelegate: CoordinatorFinishDelegate?
    var childCoordinators: [Coordinator] = [Coordinator]()
    var navigationController: UINavigationController
    
    var type: CoordinatorType { .tab }
    
    func start() {
        pushCards()
    }
    
    required init(_ navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    fileprivate func pushCards() {
        let cardsVC = CardsViewController()
        cardsVC.coordinator = self
        navigationController.pushViewController(cardsVC, animated: false)
    }
    
//    func finish() {
//        navigationController.popViewController(animated: true)
//    }
}
