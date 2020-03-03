//
//  Helper.swift
//  Photo De-Duping
//
//  Created by Lydia Zhang on 3/3/20.
//  Copyright © 2020 Lydia Zhang. All rights reserved.
//

import Foundation
class PhotoController {
    var images1: [Photo] = []
    var images2: [Photo] = []
    
    func addImage(_ image1: Data, _ image2: Data) {
        let image1 = Photo(imageData: image1)
        let image2 = Photo(imageData: image2)
        
        images1.append(image1)
        images2.append(image2)
    }
    
    func editImage1(photo: Photo, _ image1: Data) {
        guard let index1 = images1.firstIndex(of: photo) else {return}
        images1[index1] = Photo(imageData: image1)
    }
    func editImage2(photo: Photo, _ image2: Data) {
        guard let index2 = images2.firstIndex(of: photo) else {return}
        images2[index2] = Photo(imageData: image2)
    }
}
