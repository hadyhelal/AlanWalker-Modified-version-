//
//  SongsListVC.swift
//  AlanWalker
//
//  Created by Hady Helal on 05/11/2021.
//  Copyright © 2021 HadyOrg. All rights reserved.
//

import UIKit
import AVFoundation

class SongsListVC: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    lazy var musicData     = MusicData()
    var selectedMusicArray = [MusicDataModel] ()
    var filterdMusicArray  = [MusicDataModel] ()
    var originalMusicArray = [MusicDataModel] ()
    
    static var audioIsPlaying: AVAudioPlayer?
    var albumSelected: String? {
        didSet{
            loadData(album: (self.albumSelected)!)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Play your favorite!"
        configureTableView()
        configureSearchController()
        let image         = UIImage(named: selectedMusicArray[1].musicImage)!
        let musicName     = selectedMusicArray[0].musicName
        let miniMusicView = MiniMusicBar(musicImage: image , musicName: musicName, isMusicPlaying: true)
        //tableView.tableFooterView = miniMusicView
        view.addSubview(miniMusicView)
        miniMusicView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            miniMusicView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor),
            miniMusicView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor),
            miniMusicView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor),
            miniMusicView.heightAnchor.constraint(equalToConstant: 80)
        ])
        
    }
    
    private func configureTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorColor  = .white
        tableView.rowHeight       = 76.0
        tableView.tableFooterView = UIView()
        tableView.register(UINib(nibName: "TableViewCell1", bundle: nil), forCellReuseIdentifier: "MusicDataCell")
    }
    
    func configureSearchController(){
        let searchController = UISearchController()
        searchController.searchResultsUpdater  = self
        searchController.searchBar.delegate    = self
        searchController.searchBar.placeholder = "Search for walker music!"
        searchController.obscuresBackgroundDuringPresentation = false
        navigationItem.searchController = searchController
    }
    
     func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let musicUIVC               = MusicUIVC()
        musicUIVC.musicArray        = selectedMusicArray
        musicUIVC.currentMusicIndex = indexPath.row
        present(musicUIVC, animated: true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "musicUISeague"{
            let destination = segue.destination as! MusicUIVC
            if let index    = tableView.indexPathForSelectedRow {
                destination.musicArray = selectedMusicArray
                destination.currentMusicIndex = index.row
                
            }
        }
        
//        else if segue.identifier == "webViewSegue" {
//            
//            let destination = segue.destination as! YoutYoubLoading
//            if let index    = tableView.indexPathForSelectedRow {
//                
//                destination.urlString = selectedMusicArray[index.row].musicURL
//                
//            }
//        }
    }
    
    //MARK: - Load the music Data
    
    func loadData(album albumNameFetched : String) {
        musicData.list.forEach{
            if $0.musicAlbum == albumSelected {
                originalMusicArray.append($0)
            }
        }
        selectedMusicArray = originalMusicArray
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    func prepareTimeString(_ time : String) -> String{
        let reblace = String(time).replacingOccurrences(of: ".", with: ":")
        return reblace
        
        //Another way to do the same thing!
        
        //        let reblace = String(timeString.map {
        //            $0 == "." ? ":" : $0
        //        })
        //        print(reblace)
        //        return reblace
        
        
    }
}


//MARK: - UISearchBar Functionalities
extension SongsListVC: UISearchBarDelegate, UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        guard let filter = searchController.searchBar.text else {
            return
        }
        guard !filter.isEmpty else {
            selectedMusicArray  = originalMusicArray
            tableView.reloadData()
            return
        }
        selectedMusicArray = originalMusicArray.filter{
            $0.musicName.contains(filter)
        }
        tableView.reloadData()
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        selectedMusicArray = originalMusicArray
        tableView.reloadData()
    }
}

extension SongsListVC: UITableViewDelegate, UITableViewDataSource {
     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return selectedMusicArray.count
    }
    
     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "MusicDataCell", for: indexPath) as! TableViewCell1
        let localMusicData = selectedMusicArray[indexPath.row]
        
        cell.configureMusicAndAlbum(songName: localMusicData.musicName, albumName: localMusicData.musicAlbum)
        cell.configureImageAndTime(color: view.backgroundColor!,
                                   image: localMusicData.musicImage,
                                   totalTime: prepareTimeString(localMusicData.musicTime))
        return cell
    }
    
}
