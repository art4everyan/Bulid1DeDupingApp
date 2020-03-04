//
//  DeDupingDetailViewController.swift
//  Photo De-Duping
//
//  Created by Lydia Zhang on 3/2/20.
//  Copyright © 2020 Lydia Zhang. All rights reserved.
//

import UIKit

class DeDupingDetailViewController: UIViewController {
    @IBOutlet weak var firstImage: UIImageView!
    @IBOutlet weak var secondImage: UIImageView!
    @IBOutlet weak var alike: UILabel!
    
    var percentNumber = PhotoController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateView()
        // Do any additional setup after loading the view.
    }
    var image1: Photo?
    var image2: Photo?
    var percentNum: String?
    
    func updateView() {
        guard let first_Image = image1 else {return}
            firstImage.image = UIImage(data:first_Image.imageData)
        
        guard let second_Image = image2 else {return}
            secondImage.image = UIImage(data: second_Image.imageData)
        
        let returnNumber = percentNumber.hamming(image1: first_Image.imageData, image2: second_Image.imageData)
        let resultNumber = Int(returnNumber!)
        if resultNumber > 90 {
            alike.text = "\(resultNumber)% identitcal, likely to be duplicated images."
        } else {
            alike.text = "\(resultNumber)% alike."
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
