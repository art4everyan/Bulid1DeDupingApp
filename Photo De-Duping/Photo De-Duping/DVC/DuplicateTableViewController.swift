//
//  DuplicateTableViewController.swift
//  Photo De-Duping
//
//  Created by Lydia Zhang on 3/2/20.
//  Copyright © 2020 Lydia Zhang. All rights reserved.
//

import UIKit
import Photos


let albumName = "My App"
class DuplicateTableViewController: UITableViewController {
    
    var trackers: [TrackHistory] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    override func viewDidAppear(_ animated: Bool) {
        tableView.reloadData()
    }
    
    
    
    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return trackers.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "NumberOfDuplicates", for: indexPath) as? DuplicateTableViewCell else {return UITableViewCell()}
        let tracker = trackers[indexPath.row]
        cell.tracker = tracker
        

        // Configure the cell...

        return cell
    }


}
