//
//  musicUI.swift
//  AlanWalker
//
//  Created by Hady on 9/12/20.
//  Copyright © 2020 HadyOrg. All rights reserved.
//

import UIKit

class musicUI: UIViewController {

    @IBOutlet var musicNameLabel: UILabel!
    var musicNameText : String? {
        didSet{
            if  musicNameLabel.text != nil { musicNameLabel.text  = musicNameText}
        }
    }
    
    @IBOutlet var albumNameLabel: UILabel!
    var albumNameLabelText : String? {
        didSet{
            
            if albumNameLabel.text != nil { albumNameLabel.text = albumNameLabelText }
        }
    }
    
    @IBOutlet var songImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    @IBAction func fastForward(_ sender: Any) {
    }
    
    @IBAction func play(_ sender: Any) {
    }
    
    @IBAction func rewind(_ sender: Any) {
    }
}
