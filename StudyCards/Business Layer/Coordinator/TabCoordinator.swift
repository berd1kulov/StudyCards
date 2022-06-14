//
//  TabCoordinator.swift
//  StudyCards
//
//  Created by Bakdaulet Berdikul on 09.06.2022.
//

import UIKit

protocol TabCoordinatorProtocol: Coordinator {
    var tabBarController: UITabBarController { get set }
    
    func selectPage(_ page: TabBarPage)
    
    func setSelectedIndex(_ index: Int)
    
    func currentPage() -> TabBarPage?
}

class TabCoordinator: NSObject, Coordinator {
    weak var finishDelegate: CoordinatorFinishDelegate?
        
    var childCoordinators: [Coordinator] = []

    var navigationController: UINavigationController
    
    var tabBarController: UITabBarController

    var type: CoordinatorType { .tab }
    
    required init(_ navigationController: UINavigationController) {
        self.navigationController = navigationController
        self.tabBarController = .init()
    }

    func start() {
        // Let's define which pages do we want to add into tab bar
        let pages: [TabBarPage] = [.profile, .explore, .cards, .home]
            .sorted(by: { $0.pageOrderNumber() < $1.pageOrderNumber() })
        
        // Initialization of ViewControllers or these pages
        let controllers: [UINavigationController] = pages.map({ getTabController($0) })
        
        prepareTabBarController(withTabControllers: controllers)
    }
    
    
    deinit {
        print("Deinit \(String(describing: self))")
    }
    
    private func prepareTabBarController(withTabControllers tabControllers: [UIViewController]) {
        /// Set delegate for UITabBarController
        tabBarController.delegate = self
        /// Assign page's controllers
        tabBarController.setViewControllers(tabControllers, animated: false)
        /// Let set index
        tabBarController.selectedIndex = TabBarPage.home.pageOrderNumber()
        /// Styling
        tabBarController.tabBar.isTranslucent = false
        tabBarController.tabBar.backgroundColor = .systemBackground
        tabBarController.tabBar.layer.shadowOffset = CGSize(width: 0, height: 0)
        tabBarController.tabBar.layer.shadowRadius = 4
        tabBarController.tabBar.layer.shadowColor = Asset.mainLightGray.color.cgColor
        tabBarController.tabBar.layer.shadowOpacity = 0.3
        
        /// In this step, we attach tabBarController to navigation controller associated with this coordanator
        navigationController.viewControllers = [tabBarController]
    }
      
    private func getTabController(_ page: TabBarPage) -> UINavigationController {
        let navController = UINavigationController()
        navController.setNavigationBarHidden(false, animated: false)

        navController.tabBarItem = UITabBarItem.init(title: nil,
                                                     image: page.pageIconValue(),
                                                     selectedImage: page.pageSelectedIconValue())

        switch page {
        case .home:
            let homeCoordinator = HomeCoordinator(navController)
            homeCoordinator.finishDelegate = finishDelegate
            childCoordinators.append(homeCoordinator)
            homeCoordinator.start()
            
        case .cards:
            let cardsCoordinator = CardsCoordinator(navController)
            cardsCoordinator.finishDelegate = finishDelegate
            childCoordinators.append(cardsCoordinator)
            cardsCoordinator.start()
            
        case .explore:
            let exploreCoordinator = ExploreCoordinator(navController)
            exploreCoordinator.finishDelegate = finishDelegate
            childCoordinators.append(exploreCoordinator)
            exploreCoordinator.start()

        case .profile:
            let profileCoordinator = ProfileCoordinator(navController)
            profileCoordinator.finishDelegate = finishDelegate
            childCoordinators.append(profileCoordinator)
            profileCoordinator.start()

        }
        
        return navController
    }
    
    func currentPage() -> TabBarPage? { TabBarPage.init(index: tabBarController.selectedIndex) }

    func selectPage(_ page: TabBarPage) {
        tabBarController.selectedIndex = page.pageOrderNumber()
    }
    
    func setSelectedIndex(_ index: Int) {
        guard let page = TabBarPage.init(index: index) else { return }
        
        tabBarController.selectedIndex = page.pageOrderNumber()
    }
}

// MARK: - UITabBarControllerDelegate
extension TabCoordinator: UITabBarControllerDelegate {
    func tabBarController(_ tabBarController: UITabBarController,
                          didSelect viewController: UIViewController) {
        // Some implementation
    }
}
