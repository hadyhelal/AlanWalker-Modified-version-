//
//  HomeVC.swift
//  AlanWalker
//
//  Created by Hady Helal on 03/11/2021.
//  Copyright © 2021 HadyOrg. All rights reserved.
//

import UIKit

class HomeVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.isNavigationBarHidden = true
    }
    
    @IBAction func online(_ sender: Any) {
        let welcomeVC = WelcomeVC()
        welcomeVC.title = "Welcome"
        navigationController?.pushViewController(welcomeVC, animated: true)
    }
    
    @IBAction func offline(_ sender: Any) {
        let registerVC = AlbumListVC()
        registerVC.title = "Albums"
        navigationController?.pushViewController(registerVC, animated: true)
        print("offline")
    }

}
