//
//  FirstView.swift
//  AlanWalker
//
//  Created by Hady on 5/22/20.
//  Copyright © 2020 HadyOrg. All rights reserved.
//

import UIKit

class FirstView: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    @IBAction func onlineMode(_ sender: Any) {
        performSegue(withIdentifier: "online", sender: self)
    }
    
  
    @IBAction func offlineMode(_ sender: Any) {
       // performSegue(withIdentifier: "offline", sender: self)
    }
    
}
