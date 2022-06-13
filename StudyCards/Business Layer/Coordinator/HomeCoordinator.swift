//
//  HomeCoordinator.swift
//  StudyCards
//
//  Created by Bakdaulet Berdikul on 08.06.2022.
//
import UIKit

class HomeCoordinator: NSObject, Coordinator{
    var finishDelegate: CoordinatorFinishDelegate?
    var childCoordinators: [Coordinator] = [Coordinator]()
    var navigationController: UINavigationController
    
    var type: CoordinatorType { .tab }
    
    func start() {
        pushHome()
    }
    
    required init(_ navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    fileprivate func pushHome() {
        let homeVC = HomeViewController()
        homeVC.coordinator = self
        navigationController.pushViewController(homeVC, animated: false)
    }
    
    func finish() {
        navigationController.popViewController(animated: true)
    }
}



//extension HomeCoordinator {
//    func navigationController(_ navigationController: UINavigationController,
//                              didShow viewController: UIViewController,
//                              animated: Bool) {
//        guard let fromVC = navigationController
//                .transitionCoordinator?
//                .viewController(forKey: .from) else { return }
//        if navigationController.viewControllers.contains(fromVC) { return }
//        if let menuVC = fromVC as? SVWithMenuVC {
//            removeSVChildCoordinator(menuVC.coordinator)
//        } else if let searchVC = fromVC as? SVWithSearchVC {
//            removeSVChildCoordinator(searchVC.coordinator)
//        } else if let directionVC = fromVC as? SVWithDirectionVC {
//            removeSVChildCoordinator(directionVC.coordinator)
//        }
//    }
//
//    func removeSVChildCoordinator(_ child: Coordinator?) {
//        childCoordinators.removeAll(where: { $0 === child })
//    }
//}
