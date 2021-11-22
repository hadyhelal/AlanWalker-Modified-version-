//
//  AlbumListVC.swift
//  AlanWalker
//
//  Created by Hady Helal on 03/11/2021.
//  Copyright © 2021 HadyOrg. All rights reserved.
//

import UIKit

class AlbumListVC: UITableViewController {
    var albumList :[String] = ["Single & ESP","Non-Single","Different World(2017)", "Recreated Music", "Faded(Remixes)" ,"Tired(Remixes)"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        configureBegin()
    }
    
    
    func configureBegin(){
        navigationController?.isNavigationBarHidden = false
        navigationController?.navigationBar.prefersLargeTitles = true

        tableView.separatorColor  = .none
        tableView.rowHeight       = 71.0
        tableView.tableFooterView = UIView()
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return albumList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.backgroundColor = view.backgroundColor
        cell.textLabel?.font = UIFont(name: "Futura", size: 20.0)
        cell.textLabel?.text = albumList[indexPath.row]
        cell.textLabel?.textColor = .white
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let songsListVC = SongsListVC()
        songsListVC.albumSelected = albumList[indexPath.row]
        navigationController?.pushViewController(songsListVC, animated: true)
    }
    
}
