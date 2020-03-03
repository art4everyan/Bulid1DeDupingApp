//
//  DePupingViewController.swift
//  Photo De-Duping
//
//  Created by Lydia Zhang on 3/2/20.
//  Copyright © 2020 Lydia Zhang. All rights reserved.
//

import UIKit

class DePupingViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.dataSource = self
        tableView.delegate = self
        
    }
    
    let photoController = PhotoController()
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidAppear(_ animated: Bool) {
        tableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return photoController.images1.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "PercentOfAlike", for: indexPath) as? DeDupingTableViewCell else {return UITableViewCell()}
        let image1 = photoController.images1[indexPath.row]
        let image2 = photoController.images2[indexPath.row]
        
        
        cell.photo1 = image1
        cell.photo2 = image2
        
        return cell
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        if segue.identifier == "CompareDetailSegue" {
            if let detailVC = segue.destination as? DeDupingDetailViewController, let indexPath = tableView.indexPathForSelectedRow {
                detailVC.image1 = photoController.images1[indexPath.row]
                detailVC.image2 = photoController.images2[indexPath.row]
            }
        } else if segue.identifier == "AddCompareSegue" {
            if let addVC = segue.destination as? AddViewController {
                addVC.photoController = self.photoController
            }
        }
    }
    
}
