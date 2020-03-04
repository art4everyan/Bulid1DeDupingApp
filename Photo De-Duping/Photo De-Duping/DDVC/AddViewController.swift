//
//  AddViewController.swift
//  Photo De-Duping
//
//  Created by Lydia Zhang on 3/2/20.
//  Copyright © 2020 Lydia Zhang. All rights reserved.
//

import UIKit

class AddViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @IBOutlet weak var firstImage: UIImageView!
    @IBOutlet weak var secondImage: UIImageView!
    
    var image1: Photo?
    var image2: Photo?
    var photoController: PhotoController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateViews()
        // Do any additional setup after loading the view.
    }
    
    var didSetImage1: Bool = false
    var didSetImage2: Bool = false
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any] ) {
        if didSetImage1 == true {
            if let pickedImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
                firstImage.contentMode = .scaleAspectFit
                firstImage.image = pickedImage
                didSetImage1 = false
            }
        }
        if didSetImage2 == true {
            if let pickedImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
                secondImage.contentMode = .scaleAspectFit
                secondImage.image = pickedImage
                didSetImage2 = false
            }
        }
        dismiss(animated: true, completion: nil)
    }
    @IBAction func addFirstImage(_ sender: Any) {
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) {
            let imagePicker = UIImagePickerController()
            imagePicker.delegate = self
            imagePicker.sourceType = .photoLibrary
            imagePicker.allowsEditing = true
            didSetImage1 = true
            self.present(imagePicker, animated: true, completion: nil)
        }
    }
    @IBAction func addSecondImage(_ sender: Any) {
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) {
            let imagePicker = UIImagePickerController()
            imagePicker.delegate = self
            imagePicker.sourceType = .photoLibrary
            imagePicker.allowsEditing = true
            didSetImage2 = true
            self.present(imagePicker, animated: true, completion: nil)
        }
    }
        
    
    func updateViews() {
        guard let image1 = image1 else {return}
        guard let image2 = image2 else {return}
        firstImage.image = UIImage(data: image1.imageData)
        secondImage.image = UIImage(data: image2.imageData)
        
    }
    
    @IBAction func add(_ sender: Any) {
        guard let photoController = photoController,
            let firstImage = firstImage.image?.pngData(),
            let secondImage = secondImage.image?.pngData() else {return}
        
        _ = photoController.addImage(firstImage, secondImage)
        navigationController?.popViewController(animated: true)
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
