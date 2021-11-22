//
//  MiniMusicBar.swift
//  AlanWalker
//
//  Created by Hady Helal on 12/11/2021.
//  Copyright © 2021 HadyOrg. All rights reserved.
//

import UIKit

class MiniMusicBar: UIView {
    let musicImage = UIImageView()
    let musicName  = UILabel()
    let play       = UIButton()
    let padding: CGFloat    = 20
    var isMusicPlaying = false
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init( musicImage: UIImage , musicName: String, isMusicPlaying: Bool) {
        super.init(frame: .zero)
        self.musicImage.image = musicImage
        self.musicName.text   = musicName
        self.isMusicPlaying   = isMusicPlaying
        configure()
    }
    
    private func configure() {
       let subViews = [musicImage,musicName,play]
        for subView in subViews {
            subView.translatesAutoresizingMaskIntoConstraints = false
            addSubview(subView)
        }
        configureImage()
        configurePlayButton()
        configureMusicName()
    }
    
    private func configureImage() {
        musicName.contentMode = .scaleAspectFill
        musicImage.layer.cornerRadius = 10
        musicImage.clipsToBounds      = true
        NSLayoutConstraint.activate([
            musicImage.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: padding),
            musicImage.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            musicImage.heightAnchor.constraint(equalToConstant: 45),
            musicImage.widthAnchor.constraint(equalToConstant: 45)
        ])
    }
    
    private func configurePlayButton() {
        play.setImage(UIImage(named: "pause"), for: .normal)
        NSLayoutConstraint.activate([
            play.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            play.heightAnchor.constraint(equalToConstant: 45),
            play.widthAnchor.constraint(equalToConstant: 45),
            play.centerYAnchor.constraint(equalTo: self.centerYAnchor),

        ])
    }
    
    private func configureMusicName() {
        musicName.textAlignment = .left
        musicName.textColor = .white
        musicName.font      = UIFont.preferredFont(forTextStyle: .body)
        musicName.adjustsFontSizeToFitWidth = true
        musicName.minimumScaleFactor = 0.75
        musicName.lineBreakMode      = .byWordWrapping
        
        NSLayoutConstraint.activate([
            musicName.leadingAnchor.constraint(equalTo: musicImage.trailingAnchor, constant: 8),
            musicName.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            musicName.heightAnchor.constraint(equalToConstant: 45),
            musicName.trailingAnchor.constraint(equalTo: play.leadingAnchor, constant: -8)
        ])
    }
    

}
