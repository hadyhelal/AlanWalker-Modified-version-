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
    
    func configureMusicAndAlbum(songName: String, albumName: String) {
        musicLabel.text      = songName //localMusicData.musicName
        musicLabel.textColor = .white
        musicLabel.font      = UIFont(name: "Futura", size: 18.0)
        
        albumLabel.text      = albumName//localMusicData.musicAlbum
        albumLabel.font      = UIFont(name: "Futura", size: 16.0)
    }
    
    func configureImageAndTime(color: UIColor,image: String, totalTime: String){
        musicImage.image = UIImage(named: image) //localMusicData.musicImage)
        musicImage.layer.cornerRadius = 8
        
        musicTotalTimeLabel.text = totalTime //prepareTimeString(localMusicData.musicTime)
        backgroundColor          = color //view.backgroundColor
    }
}
