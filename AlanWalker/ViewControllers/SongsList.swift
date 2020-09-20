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
    
    var audio : AVAudioPlayer!
    //var musicName = [Songs] ()
    var musicVar = MusicData()
    var currentMusicArray = [MusicDataModel] ()
    var albumSelected : Albums? {
        didSet{
            if self.albumSelected?.albumName == musicVar.list[/*IndexPath.row*/0].musicAlbum {
            //print("===================== \(self.albumSelected!)  =======")
                loadData(album: (self.albumSelected?.albumName)!)
            }
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        //
        //        let musica = Songs(context: context)
        //        musica.songsName = "Memories"
        //        musica.parentCategory = self.albumSelected
        //        let musica1 = Songs(context: context)
        //        musica1.songsName = "Avem"
        //        musica1.parentCategory = self.albumSelected
        //
        //        let musica2 = Songs(context: context)
        //        musica2.songsName = "Hope"
        //        musica2.parentCategory = self.albumSelected
        //
        //        let musica3 = Songs(context: context)
        //        musica3.songsName = "Return"
        //        musica3.parentCategory = self.albumSelected
        //
        //
        //        saveData()
        // navigationController?.setNavigationBarHidden(false, animated: true)
        tableView.separatorColor = .white
        tableView.rowHeight = 71.0
        tableView.tableFooterView = UIView()
        
        // Registeration is to use it current class Bundle in register is to specify the location of the custom cell!
        tableView.register(UINib(nibName: "TableViewCell1", bundle: nil), forCellReuseIdentifier: "MusicDataCell")
        print(FileManager.default.urls(for: .documentDirectory, in: .userDomainMask))
        //
        //        context.delete(musicName[1])
        //        context.delete(musicName[2])
        //        context.delete(musicName[3])
        //        context.delete(musicName[4])
        
        //    tableView.reloadData()
        // loadData()
        
    }
    
    // MARK: - Table view data source
    
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3 //musicName.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "MusicDataCell", for: indexPath) as! TableViewCell1
        
        
        cell.musicLabel.text = musicVar.list[indexPath.row].musicName //musicName[indexPath.row].songsName!
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
        playMusic(musicName: musicVar.list[indexPath.row].musicName)//musicName[indexPath.row].songsName!)
    }
    
    
    //MARK: - Segue preparation
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destination = segue.destination as! musicUI
        if let ss = albumSelected?.albumName {
            print("------------- \(ss) ----------")
            destination.albumNameLabelText =  ss
            
            if let index = tableView.indexPathForSelectedRow {
                destination.musicNameText = musicVar.list[index.row].musicName//musicName[index.row].songsName!
            }
        }
    }
    
    
    // MARK: - playingMusic
    
    func playMusic (musicName : String) {
        let url = Bundle.main.url(forResource: musicName, withExtension: ".mp3")!
        do {
            audio = try AVAudioPlayer(contentsOf: url)
        } catch {
            print("error while playing audio :: \(error)")
        }
        audio.play()
    }
    
    
    
    //MARK: -Core Data Methods

    func loadData(album albumNameFetched : String, predicate: NSPredicate? = nil) {
        
        let pp = musicVar.list.filter { ( music ) -> Bool in
            return music.musicAlbum == albumSelected?.albumName
        }
        print(pp.count)
        }
            
//        let categoryPredicate = NSPredicate(format: "parentCategory.albumName MATCHES %@", albumSelected!.albumName!)
//        if let additionalPredicate = predicate {
//            request.predicate = NSCompoundPredicate(andPredicateWithSubpredicates: [categoryPredicate , additionalPredicate])
//        } else
//        {
//            request.predicate = categoryPredicate
//        }
//        do {
//            musicVar.list /*musicName*/ = try context.fetch(request)
//        }catch{
//            print("Error while fetching data \(error)")
//        }
//        tableView.reloadData()
    
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

