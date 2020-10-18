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
        
        //Single & ESP
        
        list.append(MusicDataModel(musicName: "Memories", musicAlbum: "Single & ESP", musicImage: "Memories", musicTime: 3.55, musicURL: "https://www.youtube.com/embed/JB7oZ4JQNrk"))
        

        list.append(MusicDataModel(musicName: "Avem", musicAlbum: "Single & ESP", musicImage: "Avem", musicTime: 3.46, musicURL: "https://www.youtube.com/embed/TtMTGL2G-Ck"))
        
        list.append(MusicDataModel(musicName: "Hope", musicAlbum: "Single & ESP", musicImage: "Hope Re", musicTime: 4.38, musicURL: "https://www.youtube.com/embed/JhCEXRgbc_M"))
        

        
        list.append(MusicDataModel(musicName: "Return", musicAlbum: "Single & ESP", musicImage: "Return", musicTime: 3.27, musicURL: "https://www.youtube.com/embed/EHxzSVhMHVc"))
        
        list.append(MusicDataModel(musicName: "I Don't Wanna Go", musicAlbum: "Single & ESP", musicImage: "galaxy", musicTime: 2.41, musicURL: "https://www.youtube.com/embed/EHxzSVhMHVc")) // needs to be handeld
        
        //Non-Single
        
        list.append(MusicDataModel(musicName: "PLAY", musicAlbum: "Non-Single", musicImage: "PLAY", musicTime: 3.13, musicURL: "https://www.youtube.com/embed/YQRHrco73g4"))
        
        list.append(MusicDataModel(musicName: "On My Way", musicAlbum: "Non-Single", musicImage: "On my Way", musicTime: 3.36, musicURL: "https://www.youtube.com/embed/dhYOPzcsbGM"))
        
        list.append(MusicDataModel(musicName: "Sing Me To Sleep", musicAlbum: "Non-Single", musicImage: "Sing me to sleep", musicTime: 3.10, musicURL: "https://www.youtube.com/embed/2i2khp_npdE"))
        
        list.append(MusicDataModel(musicName: "Faded", musicAlbum: "Non-Single", musicImage: "Faded", musicTime: 3.23, musicURL: "https://www.youtube.com/embed/HhjHYkPQ8F0"))
        
        list.append(MusicDataModel(musicName: "Ignite", musicAlbum: "Non-Single", musicImage: "Ignite"/*-1*/, musicTime: 3.30, musicURL: "https://www.youtube.com/embed/Az-mGR-CehY"))
        
        list.append(MusicDataModel(musicName: "Unity", musicAlbum: "Non-Single", musicImage: "galaxy", musicTime: 3.23, musicURL: "https://www.youtube.com/embed/E3x_dLVTEuA"))
        
        list.append(MusicDataModel(musicName: "Alone", musicAlbum: "Non-Single", musicImage: "Alone", musicTime: 4.45, musicURL: "https://www.youtube.com/embed/HhjHYkPQ8F0"))
        
        
        
        
        //Differnet World
        
        list.append(MusicDataModel(musicName: "Do it all for you", musicAlbum: "Different World(2017)", musicImage: "Walker Wallpapers", musicTime: 2.53, musicURL: "https://www.youtube.com/embed/0IX090ajmI0A"))
        
          list.append(MusicDataModel(musicName: "All falls down", musicAlbum: "Different World(2017)", musicImage: "Walker Wallpapers", musicTime: 3.40, musicURL: "https://www.youtube.com/embed/6RLLOEzdxsM"))
        
        list.append(MusicDataModel(musicName: "The Spectre", musicAlbum: "Different World(2017)", musicImage: "The spectre", musicTime: 3.25, musicURL: "https://www.youtube.com/embed/60ItHLz5WEA"))
        
        list.append(MusicDataModel(musicName: "Lonely", musicAlbum: "Different World(2017)", musicImage: "Walker Wallpapers", musicTime: 3.35, musicURL: "https://www.youtube.com/embed/c8jtVbxqgnE"))
        
        
        list.append(MusicDataModel(musicName: "Lost control", musicAlbum: "Different World(2017)", musicImage: "Lost Control", musicTime: 3.41, musicURL: "https://www.youtube.com/embed/vi6v0MOWp2Q"))
        
        
        
        //Recreated
        
        list.append(MusicDataModel(musicName: "Memories(Re)", musicAlbum: "Recreated Music", musicImage: "Memories Re", musicTime: 3.12, musicURL: "https://www.youtube.com/embed/GqP0XNzykW0"))

        list.append(MusicDataModel(musicName: "Hope(Re)", musicAlbum: "Recreated Music", musicImage: "Hope Re", musicTime: 3.26, musicURL: "https://www.youtube.com/embed/RA5iiBp_J3E"))
        
        
        //Faded(Remixes)
        
        list.append(MusicDataModel(musicName: "Not Afraid ft Faded", musicAlbum: "Faded(Remixes)", musicImage: "galaxy", musicTime: 5.11, musicURL: "https://www.youtube.com/embed/eTiu541Uy0U"))
        
        list.append(MusicDataModel(musicName: "Smokers | halsey", musicAlbum: "Faded(Remixes)", musicImage: "NCS", musicTime: 4.51, musicURL: "https://www.youtube.com/embed/mlmpVkhV0X4"))
        
        list.append(MusicDataModel(musicName: "Faded(erelease)", musicAlbum: "Faded(Remixes)", musicImage: "galaxy", musicTime: 4.51, musicURL: "https://www.youtube.com/embed/bM7SZ5SBzyY"))
        
        list.append(MusicDataModel(musicName: "Faded (interlude)", musicAlbum: "Faded(Remixes)", musicImage: "galaxy", musicTime: 00.40, musicURL: "https://www.youtube.com/embed/nIPgx1b02gM"))
        
        
        //Tired(Remixes)
        
        list.append(MusicDataModel(musicName: "Tired", musicAlbum: "Tired(Remixes)", musicImage: "galaxy", musicTime: 3.36, musicURL: "https://www.youtube.com/embed/g4hGRvs6HHU"))
        
        
        list.append(MusicDataModel(musicName: "Tired by j-fla", musicAlbum: "Tired(Remixes)", musicImage: "galaxy", musicTime: 2.44, musicURL: "https://www.youtube.com/embed/zQ9Wtz6QVv4"))
        
        
        list.append(MusicDataModel(musicName: "Tired kygo", musicAlbum: "Tired(Remixes)", musicImage: "galaxy", musicTime: 4.00, musicURL: "https://www.youtube.com/embed/mITNFL1gzK4"))
        
        
        
    }
    
}
