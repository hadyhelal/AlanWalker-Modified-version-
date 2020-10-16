//
//  SongsList.swift
//  AlanWalker
//
//  Created by Hady on 5/22/20.
//  Copyright © 2020 HadyOrg. All rights reserved.
//

import UIKit

class SongsList : UITableViewController, ObservableObject {
    
    var musicVar = MusicData()
    var currentMusicArray = [MusicDataModel] ()
    
    var albumSelected : String? {
        didSet{
            loadData(album: (self.albumSelected)!)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        // navigationController?.setNavigationBarHidden(false, animated: true)
        tableView.separatorColor = .white
        tableView.rowHeight = 91.0
        tableView.tableFooterView = UIView()
        
        // Registeration is to use it current class Bundle in register is to specify the location of the custom cell!
        tableView.register(UINib(nibName: "TableViewCell1", bundle: nil), forCellReuseIdentifier: "MusicDataCell")
        
//        let tapGesture = UITapGestureRecognizer(target: view, action: #selector(UIView.endEditing))
//            view.addGestureRecognizer(tapGesture)
        
    }
    
    // MARK: - Table view data source
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return currentMusicArray.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "MusicDataCell", for: indexPath) as! TableViewCell1
        
        cell.musicLabel.text = currentMusicArray[indexPath.row].musicName
        cell.musicLabel.textColor = .white
        cell.musicLabel.font = UIFont(name: "Futura", size: 20.0)
        
        cell.albumLabel.text = currentMusicArray[indexPath.row].musicAlbum
        cell.albumLabel.font = UIFont(name: "Futura", size: 20.0)
        
        cell.musicImage.image = UIImage(named: currentMusicArray[indexPath.row].musicImage)
        
        cell.musicTotalTimeLabel.text = prepareTimeString(currentMusicArray[indexPath.row].musicTime)
        cell.backgroundColor = .none
        return cell
    }
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        print("didSelcetedRow Clicked")
        if Constants.isOnline {
            performSegue(withIdentifier: "webViewSegue", sender: self)
            print("user Now Online--")
        }
        else {
            performSegue(withIdentifier: "musicUISeague", sender: self)
            print("user is OFFline--")
        }
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    
    func prepareTimeString(_ time : Float) -> String{
        
        let timeString = String(time)
        let reblace = String(timeString.map {
            $0 == "." ? ":" : $0
        })
        return reblace
    }
    
    //MARK: - Segue preparation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "musicUISeague"{
            
            
            let destination = segue.destination as! musicUI
            if let index = tableView.indexPathForSelectedRow {
                destination.musicArray = currentMusicArray
                destination.currentIndexPath = index.row
                
            }
        }
        else if segue.identifier == "webViewSegue" {
            let destination = segue.destination as! YoutYoubLoading
            if let index = tableView.indexPathForSelectedRow {
            
                destination.urlString = currentMusicArray[index.row].musicURL
                
            }
                
        }
    }
    
    //MARK: - Load the music Data
    
    func loadData(album albumNameFetched : String) {
        
        currentMusicArray = [MusicDataModel] ()
        
        musicVar.list.forEach{
            if $0.musicAlbum == albumSelected {
                currentMusicArray.append($0)
            }
        }
    }
}


//MARK: - UISearchBar Functionalities
extension SongsList : UISearchBarDelegate {
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        
        currentMusicArray  = currentMusicArray.filter{
            $0.musicName.localizedCaseInsensitiveContains(searchBar.text!)
        }
        tableView.reloadData()
    }
    
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchBar.text?.count == 0
        {
            loadData(album: self.albumSelected!)
            tableView.reloadData()
            DispatchQueue.main.async
                {
                    searchBar.resignFirstResponder()
                    
            }
        }
    }
}

