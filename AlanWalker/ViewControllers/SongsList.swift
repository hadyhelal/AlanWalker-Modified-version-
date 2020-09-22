//
//  SongsList.swift
//  AlanWalker
//
//  Created by Hady on 5/22/20.
//  Copyright © 2020 HadyOrg. All rights reserved.
//

import UIKit
import AVFoundation

class SongsList : UITableViewController , AVAudioPlayerDelegate {
    
    var musicVar = MusicData()
    var currentMusicArray = [MusicDataModel] ()
    var albumSelected : String? {
        didSet{
            if self.albumSelected == musicVar.list[/*IndexPath.row*/0].musicAlbum {
                loadData(album: (self.albumSelected)!)
            }
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
      
        
        // navigationController?.setNavigationBarHidden(false, animated: true)
        tableView.separatorColor = .white
        tableView.rowHeight = 71.0
        tableView.tableFooterView = UIView()
        
        // Registeration is to use it current class Bundle in register is to specify the location of the custom cell!
        tableView.register(UINib(nibName: "TableViewCell1", bundle: nil), forCellReuseIdentifier: "MusicDataCell")
        print(FileManager.default.urls(for: .documentDirectory, in: .userDomainMask))
        
    }
    
    // MARK: - Table view data source
    
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3 //musicName.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "MusicDataCell", for: indexPath) as! TableViewCell1
        
        print("THISssss isss \(musicVar.list.count) and index is \(indexPath.row)")
        cell.musicLabel.text = musicVar.list[indexPath.row].musicName
        cell.musicLabel.textColor = .white
        cell.musicLabel.font = UIFont(name: "Futura", size: 20.0)
        
        cell.musicImage.image = UIImage(named: musicVar.list[indexPath.row].musicImage)
        cell.playImage = UIImageView(image: UIImage(named: "play"))
        cell.backgroundColor = .none
        
        return cell
    }
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "musicUISeague", sender: self)
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    
    //MARK: - Segue preparation
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destination = segue.destination as! musicUI
        if let ss = albumSelected {
            print("------------- \(ss) ----------")
            if let index = tableView.indexPathForSelectedRow {
                destination.musicData = musicVar.list[index.row]
            }
        }
    }
    
    

    
    
    
    //MARK: -Core Data Methods

    func loadData(album albumNameFetched : String, predicate: NSPredicate? = nil) {
        
        let pp = musicVar.list.filter { ( music ) -> Bool in
            return music.musicAlbum == albumSelected
        }
        print(pp.count)
        }
}


//MARK: - UISearchBar Functionality
extension SongsList : UISearchBarDelegate {
    
    
//    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
//        //let request : NSFetchRequest<Songs> = Songs.fetchRequest()
//
//        let predicate = NSPredicate(format: "songsName CONTAINS [cd] %@", searchBar.text!)
//
//        request.sortDescriptors = [NSSortDescriptor(key: "songsName", ascending: true)]
//
//        loadData(with: request , predicate: predicate)
//    }
    
//    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
//        if searchBar.text?.count == 0 {
//            loadData()
//
//            DispatchQueue.main.async {
//                searchBar.resignFirstResponder()
//            }
//        }
//    }
}

