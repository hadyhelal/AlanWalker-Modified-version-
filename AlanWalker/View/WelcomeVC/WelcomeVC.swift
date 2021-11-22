//
//  WelcomeVC.swift
//  AlanWalker
//
//  Created by Hady Helal on 03/11/2021.
//  Copyright © 2021 HadyOrg. All rights reserved.
//

import UIKit

class WelcomeVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.isNavigationBarHidden = false
        navigationController?.navigationBar.prefersLargeTitles = true

        loginButton.layer.cornerRadius = 20
        registerButton.layer.cornerRadius = 20
    }
    
    
    @IBOutlet weak var loginButton: UIButton!
    @IBAction func logInButton(_ sender: Any) {
        let loginVC = LogInVC()
        loginVC.title = "Login"
        navigationController?.pushViewController(loginVC, animated: true)
    }
    
    @IBOutlet weak var registerButton: UIButton!
    @IBAction func registerButton(_ sender: Any) {
        let registerVC = RegisterVC()
        registerVC.title = "Register"
        navigationController?.pushViewController(registerVC, animated: true)
        
        
    }
}
