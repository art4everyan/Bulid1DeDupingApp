//
//  DuplicateTableViewController.swift
//  Photo De-Duping
//
//  Created by Lydia Zhang on 3/2/20.
//  Copyright © 2020 Lydia Zhang. All rights reserved.
//

import UIKit
import Photos

class DuplicateTableViewController: UITableViewController {
    
    @IBAction func browse(_ sender: Any) {
    }
    
    
    var trackers: [TrackHistory] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

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


    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "DetailDuplicateSegue" {
            
        }
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    

}
