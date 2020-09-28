//
//  mm.swift
//  AlanWalker
//
//  Created by Hady on 9/23/20.
//  Copyright © 2020 HadyOrg. All rights reserved.
//

import Foundation

struct MusicData {
    
    var list = [MusicDataModel]()
    
    init() {
        
        list.append(MusicDataModel(musicName: "Memories", musicAlbum: "Single & ESP", musicImage: "galaxy", musicTime: 3.12))
        
        list.append(MusicDataModel(musicName: "Avem", musicAlbum: "Single & ESP", musicImage: "galaxy", musicTime: 3.46))
        
        list.append(MusicDataModel(musicName: "Hope", musicAlbum: "Single & ESP", musicImage: "galaxy", musicTime: 3.26))
        
        list.append(MusicDataModel(musicName: "Return", musicAlbum: "Single & ESP", musicImage: "galaxy", musicTime: 3.24))
        
        list.append(MusicDataModel(musicName: "Faded", musicAlbum: "Different World(2017)", musicImage: "Walker Wallpapers", musicTime: 3.32))
    
    }
    
}
