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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateView()
        // Do any additional setup after loading the view.
    }
    var image1: Photo?
    var image2: Photo?
    
    func updateView() {
        if let first_Image = image1 {
            firstImage.image = UIImage(data:first_Image.imageData)
        }
        if let second_Image = image2 {
            secondImage.image = UIImage(data: second_Image.imageData)
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
