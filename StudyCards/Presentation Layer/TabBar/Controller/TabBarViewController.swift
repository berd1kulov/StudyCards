//
//  TabBarViewController.swift
//  StudyCards
//
//  Created by Bakdaulet Berdikul on 05.06.2022.
//

import UIKit

class TabBarViewController: UITabBarController {

    fileprivate func configureTabBarVC() {
        
        let homeVC = HomeViewController()
        homeVC.tabBarItem = UITabBarItem(title: nil,
                                         image: Asset.icHomeDeselected.image,
                                         selectedImage: Asset.icHomeSelected.image)
        let homeNavVC = UINavigationController(rootViewController: homeVC)
        
        let cardsVC = CardsViewController()
        cardsVC.tabBarItem = UITabBarItem(title: nil,
                                          image: Asset.icCardsDeselected.image,
                                          selectedImage: Asset.icCardsSelected.image)
        let cardsNavVC = UINavigationController(rootViewController: cardsVC)
        
        let exploreVC = ExploreViewController()
        exploreVC.tabBarItem = UITabBarItem(title: nil,
                                            image: Asset.icExploreDeselected.image,
                                            selectedImage: Asset.icExploreSelected.image)
        let exploreNavVC = UINavigationController(rootViewController: exploreVC)
        
        let profileVC = ProfileViewController()
        profileVC.tabBarItem = UITabBarItem(title: nil,
                                            image: Asset.icProfileDeselected.image,
                                            selectedImage: Asset.icProfileSelected.image)
        let profileNavVC = UINavigationController(rootViewController: profileVC)
        
        viewControllers = [homeNavVC, cardsNavVC, exploreNavVC, profileNavVC]
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tabBar.backgroundColor = .systemBackground
        self.tabBar.layer.shadowOffset = CGSize(width: 0, height: 0)
        self.tabBar.layer.shadowRadius = 2
        self.tabBar.layer.shadowColor = Asset.mainLightGray.color.cgColor
        self.tabBar.layer.shadowOpacity = 0.3
        
        navigationController?.navigationBar.prefersLargeTitles = false
        view.backgroundColor = .systemBackground
        
        configureTabBarVC()
    }
    

    

}
