//
//  TapBarController.swift
//  AlanWalker
//
//  Created by Hady Helal on 03/11/2021.
//  Copyright © 2021 HadyOrg. All rights reserved.
//

import UIKit

class TabBarController: UITabBarController {
   
    override func viewDidLoad() {
        UITabBar.appearance().tintColor = .systemIndigo
        viewControllers = [createSearchNC() /*, createFavoriteVC()*/]
    }
    
    func createSearchNC() -> UINavigationController {
        let searchVC   = HomeVC()
        searchVC.title = "Home"
        searchVC.tabBarItem = UITabBarItem(title: "Home", image: UIImage(systemName: "house"), tag: 0)
        
        return UINavigationController(rootViewController: searchVC)
    }
    
}
