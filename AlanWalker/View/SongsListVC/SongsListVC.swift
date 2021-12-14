//
//  SongsListVC.swift
//  AlanWalker
//
//  Created by Hady Helal on 05/11/2021.
//  Copyright © 2021 HadyOrg. All rights reserved.
//

import UIKit

class SongsListVC: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    lazy var musicData     = MusicData()
    
    lazy var viewModel: SongsListVIewModel = {
        return SongsListVIewModel()
    }()
    
    var selectedMusicArray = [MusicDataModel] ()
    var filterdMusicArray  = [MusicDataModel] ()
    var originalMusicArray = [MusicDataModel] ()
    
    var albumSelected: String? {
        didSet{
            guard self.albumSelected != nil else { dismiss(animated: true) ; return }
            viewModel.loadData(album: self.albumSelected!)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bindValues()
        title = "Play your favorite!"
        configureTableView()
        configureSearchController()
//        let image         = UIImage(named: selectedMusicArray[1].musicImage)!
//        let musicName     = selectedMusicArray[0].musicName
//        let miniMusicView = MiniMusicBar(musicImage: image , musicName: musicName, isMusicPlaying: true)
//        //tableView.tableFooterView = miniMusicView
//        view.addSubview(miniMusicView)
//        miniMusicView.translatesAutoresizingMaskIntoConstraints = false
//
//        NSLayoutConstraint.activate([
//            miniMusicView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor),
//            miniMusicView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor),
//            miniMusicView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor),
//            miniMusicView.heightAnchor.constraint(equalToConstant: 80)
//        ])
        
    }
    
    private func bindValues(){
        viewModel.selectedMusicArray.bind { [weak self] selectedArray in
            self?.selectedMusicArray = selectedArray
        }
        
        viewModel.filterdMusicArray.bind { [weak self] filteredArray in
            self?.filterdMusicArray  = filteredArray
        }
        
        viewModel.originalMusicArray.bind { [weak self] originalArray in
            self?.originalMusicArray = originalArray
        }
        
        viewModel.reloadTableView.bind { [weak self] _ in
            DispatchQueue.main.async {
                self?.tableView.reloadData()
            }
        }
        
    }
    private func configureTableView() {
        tableView.delegate   = self
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
    

    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "musicUISeague"{
            let destination = segue.destination as! MusicUIVC
            if let index    = tableView.indexPathForSelectedRow {
                destination.musicArray = selectedMusicArray
                destination.currentMusicIndex = index.row
            }
        }
    }

}


//MARK: - UISearchBar Functionalities
extension SongsListVC: UISearchBarDelegate, UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        viewModel.filterImplementation(searchBarText: searchController.searchBar.text)
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
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let musicUIVC               = MusicUIVC()
        musicUIVC.viewModel.musicArray.value        = selectedMusicArray
        musicUIVC.viewModel.currentMusicIndex.value = indexPath.row
        present(musicUIVC, animated: true)
   }
    
     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "MusicDataCell", for: indexPath) as! TableViewCell1
        let localMusicData = selectedMusicArray[indexPath.row]
        
        cell.configureMusicAndAlbum(songName: localMusicData.musicName, albumName: localMusicData.musicAlbum)
        cell.configureImageAndTime(color: view.backgroundColor!,
                                   image: localMusicData.musicImage,
                                   totalTime: viewModel.prepareTimeString(localMusicData.musicTime))
        return cell
    }
    
}
