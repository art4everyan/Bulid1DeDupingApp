//
//  DuplicateDetailTableViewCell.swift
//  Photo De-Duping
//
//  Created by Lydia Zhang on 3/2/20.
//  Copyright © 2020 Lydia Zhang. All rights reserved.
//

import UIKit

class DuplicateDetailTableViewCell: UITableViewCell {

    @IBOutlet weak var image1: UIImageView!
    @IBOutlet weak var image2: UIImageView!
    @IBOutlet weak var image1NameLabel: UILabel!
    @IBOutlet weak var image2NameLabel: UILabel!
    var photo1: Photo? {
        didSet {
            updateViews()
        }
    }
    var photo2: Photo? {
        didSet {
            updateViews()
        }
    }
    func updateViews() {
        guard let photo1 = photo1 else {return}
        guard let photo2 = photo2 else {return}
        
        image1.image = UIImage(data: photo1.imageData)
        image2.image = UIImage(data: photo2.imageData)
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func image1Delete(_ sender: Any) {
    }
    @IBAction func image2Delete(_ sender: Any) {
    }
    @IBAction func Done(_ sender: Any) {
    }
    
}
