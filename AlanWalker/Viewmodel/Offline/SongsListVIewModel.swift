//
//  SongsListVIewModel.swift
//  AlanWalker
//
//  Created by Hady Helal on 30/11/2021.
//  Copyright © 2021 HadyOrg. All rights reserved.
//

import Foundation
import AVFoundation

class SongsListVIewModel {
    var selectedMusicArray: Box<[MusicDataModel]> = Box([])
    var filterdMusicArray: Box<[MusicDataModel]>  = Box([])
    var originalMusicArray: Box<[MusicDataModel]> = Box([])
    
    lazy var musicData  = MusicData()
    var reloadTableView = Box(false)
    
    func loadData(album albumNameFetched : String) {
        musicData.list.forEach{
            if $0.musicAlbum == albumNameFetched {
                originalMusicArray.value.append($0)
            }
        }
        
        selectedMusicArray.value = originalMusicArray.value
        DispatchQueue.main.async {
            self.reloadTableView.value = true
        }
    }
    
    func prepareTimeString(_ time : String) -> String{
        let reblace = String(time).replacingOccurrences(of: ".", with: ":")
        return reblace
        
        //Another way to do the same thing!
//                let reblace = String(time.map {
//                    $0 == "." ? ":" : $0
//                })
//                print(reblace)
//                return reblace
    }
    
    func filterImplementation(searchBarText: String?){
        guard let filter = searchBarText else {
            return
        }
        
        guard !filter.isEmpty else {
            selectedMusicArray.value    = originalMusicArray.value
            reloadTableView.value = true
            return
        }
        
        selectedMusicArray.value = originalMusicArray.value.filter{
            $0.musicName.contains(filter)
        }
    }
}

