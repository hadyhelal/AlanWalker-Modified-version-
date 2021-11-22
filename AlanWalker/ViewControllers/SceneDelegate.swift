//
//  SceneDelegate.swift
//  AlanWalker
//
//  Created by Hady on 5/21/20.
//  Copyright © 2020 HadyOrg. All rights reserved.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {

        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(frame: windowScene.coordinateSpace.bounds)
        window?.windowScene        = windowScene
        window?.rootViewController = TabBarController()
        window?.makeKeyAndVisible()
        configureNavBAr()
        
    }


    
    func configureNavBAr(){
        UINavigationBar.appearance().tintColor = .blue
    }
    
    func sceneDidDisconnect(_ scene: UIScene) {

    }

    func sceneDidBecomeActive(_ scene: UIScene) {
    }

    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        
    }

    func sceneDidEnterBackground(_ scene: UIScene) {

    }


}

