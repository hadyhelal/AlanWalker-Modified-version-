//
//  CategoryTableViewController.swift
//  AlanWalker
//
//  Created by Hady on 5/24/20.
//  Copyright © 2020 HadyOrg. All rights reserved.
//

import UIKit
import CoreData

class CategoryTableViewController: UITableViewController {
    //check napster Website
    //    var topTracks : [String] = ["faded","alone","the spectre","dark side"]
    //    var albums :[String] = ["Differnt World(2017)", "Something Up my Sleeve(2018)","Tired(Remix)", "Alone(Remix)", "Faded(Remix)" ,"Routine(Gamers Mix"]
    
    var albumList = [Albums]()
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.setNavigationBarHidden(false, animated: true)

        tableView.separatorColor = .white
        tableView.rowHeight = 71.0
        tableView.tableFooterView = UIView()
        
        //        let albuum0 = Albums(context: context)
        //        albuum0.albumName = "Single & ESP"
        //
        //        let albuum = Albums(context: context)
        //        albuum.albumName = "Differnt World(2017)"
        //
        //        let albuum1 = Albums(context: context)
        //        albuum1.albumName = "Something Up my Sleeve(2018)"
        //
        //        let albuum2 = Albums(context: context)
        //        albuum2.albumName = "Tired(Remix)"
        //
        //        let albuum3 = Albums(context: context)
        //        albuum3.albumName = "Walker Tracks"
        //
        //        saveAlbums()
        
        loadAlbums()
    }
    
    // MARK: - TableView Data source
    
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return albumList.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = albumList[indexPath.row].albumName
        cell.textLabel?.textColor = .white
        cell.textLabel?.font = UIFont(name: "Futura", size: 20.0)
        cell.backgroundColor = .none
        
        return cell
    }
    
    //    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    //        performSegue(withIdentifier: "songsSegues", sender: self)
    //
    //    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destinationVC = segue.destination as! SongsList
        
        if let indexpath = tableView.indexPathForSelectedRow {
            destinationVC.albumSelected = albumList[indexpath.row]
            
            for _ in 1...5 {
                print("===================")
            }
            
            print("Album name at index \(indexpath.row) is \(albumList[indexpath.row].albumName ?? "NOTHING BRO" )")
        }
    }
    
    //MARK: - Core Data Model
    
    func saveAlbums() {
        do {
            try self.context.save()
        }
        catch
        {
            print("Erro while saving Data")
        }
    }
    
    func loadAlbums() {
        let request : NSFetchRequest<Albums> = Albums.fetchRequest()
        do{
            albumList =  try context.fetch(request)
        }
        catch{
            print("Error while fetching albums data \(error)")
        }
    }
    
    deinit {
        navigationController?.setNavigationBarHidden(true, animated: true)
        
    }
    
}
