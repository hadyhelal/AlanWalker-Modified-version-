//
//  SongsList.swift
//  AlanWalker
//
//  Created by Hady on 5/22/20.
//  Copyright © 2020 HadyOrg. All rights reserved.
//

import UIKit
import AVFoundation

class SongsList : ParentController , AVAudioPlayerDelegate  {
    var audio : AVAudioPlayer!
    var musicName = ["Faded","Not Afraid ft Faded","PLAY","Sing Me To Sleep","The Spectre"]
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.separatorColor = .white
        tableView.rowHeight = 71.0
        tableView.tableFooterView = UIView()
        
            
    }

    // MARK: - Table view data source
    
    

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return musicName.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       
        let cell = super.tableView(tableView, cellForRowAt: indexPath)
        cell.textLabel?.text = musicName[indexPath.row]
        let cellLabel = cell.textLabel
      
       cellLabel?.textColor = .white
   
       cell.backgroundColor = .none
       cellLabel?.font = UIFont(name: "Futura", size: 20.0)

        return cell
    }
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        playMusic(musicName: musicName[indexPath.row])
    }
    

    // MARK: - playingMusic
    
    func playMusic (musicName : String) {
        let url = Bundle.main.url(forResource: musicName, withExtension: "mp3")!
        do {
            audio = try AVAudioPlayer(contentsOf: url)
        } catch {
            print("error while playing audio :: \(error)")
        }
        audio.play()
    }

 
}
