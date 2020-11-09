//
//  CategoryTableViewController.swift
//  AlanWalker
//
//  Created by Hady on 5/24/20.
//  Copyright © 2020 HadyOrg. All rights reserved.
//

import UIKit

class AlbumList: UITableViewController {
    //check napster Website

    var albumList :[String] = ["Single & ESP","Non-Single","Different World(2017)", "Recreated Music", "Faded(Remixes)" ,"Tired(Remixes)"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configureBegin()
        
    }
    
    
    func configureBegin(){
        navigationController?.isNavigationBarHidden = false

        tableView.separatorColor  = .white
        tableView.rowHeight       = 71.0
        tableView.tableFooterView = UIView()
    }
    
    // MARK: - TableView Data source
    
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return albumList.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)

        cell.backgroundColor = .none
        cell.textLabel?.font = UIFont(name: "Futura", size: 20.0)
        cell.textLabel?.text = albumList[indexPath.row]
        
        cell.textLabel?.textColor = .white
        return cell
    }

    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destinationVC = segue.destination as! SongsList
        
        if let indexpath = tableView.indexPathForSelectedRow {
            destinationVC.albumSelected = albumList[indexpath.row]
            
        }
    }
}
