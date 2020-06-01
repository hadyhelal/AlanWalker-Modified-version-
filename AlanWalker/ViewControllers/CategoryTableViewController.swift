//
//  CategoryTableViewController.swift
//  AlanWalker
//
//  Created by Hady on 5/24/20.
//  Copyright © 2020 HadyOrg. All rights reserved.
//

import UIKit

class CategoryTableViewController: ParentController {
        //check napster Website
    var topTracks : [String] = ["faded","alone","the spectre","dark side"]
    var albums :[String] = ["Differnt World(2017)", "Something Up my Sleeve2018","Tired(Remix)", "Alone(Remix)", "Faded(Remix)" ,"Routine(Gamers Mix"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source



    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return albums.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        

        return cell
    }
    

}
