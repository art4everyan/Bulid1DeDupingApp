//
//  DeDupingTableViewCell.swift
//  Photo De-Duping
//
//  Created by Lydia Zhang on 3/2/20.
//  Copyright © 2020 Lydia Zhang. All rights reserved.
//

import UIKit

class DeDupingTableViewCell: UITableViewCell {
    @IBOutlet weak var image1: UIImageView!
    @IBOutlet weak var image2: UIImageView!
    @IBOutlet weak var percent: UILabel!
    var percentNumber = PhotoController()
    
    var photo1: Photo? {
        didSet {
            updateView1()
        }
    }
    var photo2: Photo? {
        didSet {
            updateView2()
        }
    }
    
    func updateView1() {
        guard let photo1 = photo1 else {
            return
        }
        image1.image = UIImage(data: photo1.imageData)
    }
    func updateView2() {
        guard let photo2 = photo2 else {return}
        image2.image = UIImage(data: photo2.imageData)
    }
    var percentNum: String? {
        didSet {
            updateNum()
        }
    }
    func updateNum() {
        guard let percent = percent else {return}
        guard let photo1 = photo1 else {return}
        guard let photo2 = photo2 else {return}
        guard let returnNumber = percentNumber.hamming(image1: photo1.imageData, image2: photo2.imageData) else {return}
        let resultNumber = Int(returnNumber)
        percent.text = "\(resultNumber)% alike."
    }
}
