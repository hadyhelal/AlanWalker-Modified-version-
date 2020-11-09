//
//  TableViewCell1.swift
//  AlanWalker
//
//  Created by Hady on 9/12/20.
//  Copyright © 2020 HadyOrg. All rights reserved.
//

import UIKit

class TableViewCell1: UITableViewCell {

    @IBOutlet var musicImage: UIImageView!
    @IBOutlet var musicLabel: UILabel!
    
    @IBOutlet weak var musicTotalTimeLabel: UILabel!
    @IBOutlet weak var albumLabel: UILabel!
    
    
    override func awakeFromNib() {
         musicTotalTimeLabel.textColor = .white
         musicTotalTimeLabel.font = UIFont(name: "Futura", size: 17.0)
    }
}
