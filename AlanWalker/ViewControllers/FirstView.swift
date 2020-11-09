//
//  FirstView.swift
//  AlanWalker
//
//  Created by Hady on 5/22/20.
//  Copyright © 2020 HadyOrg. All rights reserved.
//

import UIKit

class FirstView : UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.isNavigationBarHidden = true

        
    }
    
    @IBAction func onlineMode(_ sender: Any) {
    }
    
  
    @IBAction func offlineMode(_ sender: Any) {
    }
    
}
