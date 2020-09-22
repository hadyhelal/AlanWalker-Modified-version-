//
//  MusicDataModel.swift
//  AlanWalker
//
//  Created by Hady on 9/12/20.
//  Copyright © 2020 HadyOrg. All rights reserved.
//

import Foundation

struct MusicDataModel{
    
    var musicName : String
    var musicAlbum : String
    var musicImage : String
    var musicTime : Float
    
}


struct MusicData {
    
    var list = [MusicDataModel]()
    
    init() {
        
        list.append(MusicDataModel(musicName: "Memories", musicAlbum: "Single & ESP", musicImage: "galaxy", musicTime: 6.2))
        
        list.append(MusicDataModel(musicName: "Avem", musicAlbum: "Single & ESP", musicImage: "galaxy", musicTime: 3.22))
        
        list.append(MusicDataModel(musicName: "Hope", musicAlbum: "Single & ESP", musicImage: "galaxy", musicTime: 3.26))
        
        list.append(MusicDataModel(musicName: "Return", musicAlbum: "Single & ESP", musicImage: "galaxy", musicTime: 3.27))
    
    }
    
}
