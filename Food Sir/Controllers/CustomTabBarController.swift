//
//  CustomTabBarController.swift
//  Food Sir
//
//  Created by Arvids Gargurnis on 27/04/2018.
//  Copyright © 2018 Arvids Gargurnis. All rights reserved.
//

import UIKit

class CustomTabBarController: UITabBarController {
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.isNavigationBarHidden = true
        //navigationController?.hidesBarsOnSwipe = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Sign Out", style: .plain, target: self, action: #selector(handleSignOut))
        UITabBar.appearance().tintColor = .appOrange
        
        let inspirationController = InspirationController(collectionViewLayout: UICollectionViewFlowLayout())
        let inspirationNavigationController = UINavigationController(rootViewController: inspirationController)
        inspirationNavigationController.title = "Inspire"
        inspirationNavigationController.tabBarItem.image = UIImage(named: "inspireIcon")
        
        let sharePostController = SharePostController(collectionViewLayout: UICollectionViewFlowLayout())
        let shareNavigationController = UINavigationController(rootViewController: sharePostController)
        shareNavigationController.title = "Share"
        shareNavigationController.tabBarItem.image = UIImage(named: "shareIcon")
        
        let recommendationController = RecommendationController()
        let recommendationNavigationController = UINavigationController(rootViewController: recommendationController)
        recommendationNavigationController.title = "Recommend"
        recommendationNavigationController.tabBarItem.image = UIImage(named: "recommendIcon")
        
        let profileController = ProfileController()
        let profileNavigationController = UINavigationController(rootViewController: profileController)
        profileNavigationController.title = "Profile"
        profileNavigationController.tabBarItem.image = UIImage(named: "profileIcon")
        
        viewControllers = [shareNavigationController, inspirationNavigationController, recommendationNavigationController, profileNavigationController]
        
        tabBar.isTranslucent = false
        self.selectedIndex = 1
        
        let topBorder = CALayer()
        topBorder.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: 0.5)
        topBorder.backgroundColor = UIColor.rgb(red: 229, green: 231, blue: 235).cgColor
        
        tabBar.layer.addSublayer(topBorder)
        tabBar.clipsToBounds = true
    }
    
    @objc func handleSignOut() {
        UserDefaults.standard.setIsLoggedIn(value: false)
        
        let loginController = LoginController()
        present(loginController, animated: true, completion: nil)
    }
}
