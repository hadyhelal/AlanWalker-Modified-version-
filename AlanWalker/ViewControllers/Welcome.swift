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
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func logInButton(_ sender: Any) {
        performSegue(withIdentifier: "loginSegue", sender: self)
    }
    
    @IBAction func registerButton(_ sender: Any) {
        performSegue(withIdentifier: "RegisterSegue", sender: self)
    }
    
}

