//
//  YoutYoubVideos.swift
//  AlanWalker
//
//  Created by Hady on 9/28/20.
//  Copyright © 2020 HadyOrg. All rights reserved.
//

import UIKit

class NewComers: UIViewController {
    
 
    @IBAction func buttonPressed(_ sender: Any) {
        
    }
    @IBOutlet weak var welcomeLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        welcomeLabel.text = "Welcome Mr: \("")"
    }
    
    
}
