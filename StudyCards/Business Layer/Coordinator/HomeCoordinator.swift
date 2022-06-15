//
//  HomeCoordinator.swift
//  StudyCards
//
//  Created by Bakdaulet Berdikul on 08.06.2022.
//
import UIKit

class HomeCoordinator: NSObject, Coordinator, UINavigationControllerDelegate{
    var finishDelegate: CoordinatorFinishDelegate?
    var childCoordinators: [Coordinator] = [Coordinator]()
    var navigationController: UINavigationController
    
    var type: CoordinatorType { .tab }
    
    func start() {
        navigationController.delegate = self
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
    
    func openLanguages(){
        let languagesCoordinator = LanguagesCoordinator(navigationController)
        languagesCoordinator.finishDelegate = finishDelegate
        childCoordinators.append(languagesCoordinator)
        languagesCoordinator.start()
    }
    
    func navigationController(_ navigationController: UINavigationController,
                              didShow viewController: UIViewController,
                              animated: Bool) {
        guard let fromVC = navigationController
                .transitionCoordinator?
                .viewController(forKey: .from) else { return }
        if navigationController.viewControllers.contains(fromVC) { return }
        if let languagesVC = fromVC as? LanguagesViewController {
            removeSVChildCoordinator(languagesVC.coordinator)
        }
    }
    
    func removeSVChildCoordinator(_ child: Coordinator?) {
        childCoordinators.removeAll(where: { $0 === child })
    }
    
}
