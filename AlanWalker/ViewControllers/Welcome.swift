//
//  ViewController.swift
//  AlanWalker
//
//  Created by Hady on 5/21/20.
//  Copyright © 2020 HadyOrg. All rights reserved.
//

import UIKit

class Welcome: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        loginButton.layer.cornerRadius = 20
        registerButton.layer.cornerRadius = 20
    }
    
    
    @IBOutlet weak var loginButton: UIButton!
    @IBAction func logInButton(_ sender: Any) {

    }
    
    @IBOutlet weak var registerButton: UIButton!
    @IBAction func registerButton(_ sender: Any) {
 
    }
    
}

