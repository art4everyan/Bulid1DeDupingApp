//
//  Helper.swift
//  Photo De-Duping
//
//  Created by Lydia Zhang on 3/3/20.
//  Copyright © 2020 Lydia Zhang. All rights reserved.
//
import UIKit
import Foundation
class PhotoController {
    var images1: [Photo] = []
    var images2: [Photo] = []
    var percent: [String] = []
    
    func resize(image: UIImage, targetSize: CGSize) -> UIImage {
        
        let size = image.size
        
        let widthRatio  = targetSize.width  / image.size.width
        let heightRatio = targetSize.height / image.size.height
        
        var newSize: CGSize
        if(widthRatio > heightRatio) {
            newSize = CGSize(width: size.width * heightRatio, height: size.height * heightRatio)
        } else {
            newSize = CGSize(width: size.width * widthRatio,  height: size.height * widthRatio)
        }

        // This is the rect that we've calculated out and this is what is actually used below
        let rect = CGRect(x: 0, y: 0, width: newSize.width, height: newSize.height)

        // Actually do the resizing to the rect using the ImageContext stuff
        UIGraphicsBeginImageContextWithOptions(newSize, false, 1.0)
        image.draw(in: rect)
        let newImage = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()

        return newImage
    }
    
    func convert(image1: Data, image2: Data) -> [String] {
        let newImage1 = resize(image: UIImage(data:image1)!, targetSize: CGSize(width: 300,height: 300))
        //let newImage1 = UIImage(data:image1)!
        let newImage2 = resize(image: UIImage(data:image2)!, targetSize: CGSize(width: 300,height: 300))
        //let newImage2 = UIImage(data:image2)!
        let image_1 = newImage1.pngData()
        let image_2 = newImage2.pngData()
        let image1Data = image_1?.base64EncodedString()
        let image2Data = image_2?.base64EncodedString()
        

        return [image1Data!, image2Data!]
    }
    func hamming (image1: Data, image2: Data) -> Double? {
        let compare = convert(image1: image1, image2: image2)
        
        let compare_1 = compare[0]
        let compare_2 = compare[1]
        
        guard !compare_1.isEmpty, !compare_2.isEmpty else {
            return nil
        }
        let count1 = compare_1.count
        let count2 = compare_2.count
        
        
        var w1Iterator = compare_1.makeIterator()
        var w2Iterator = compare_2.makeIterator()
        var distance = 0
        let totalCount = Double(count1 + count2)

        var result: Double?
        
        while let w1Char = w1Iterator.next(), let w2Char = w2Iterator.next()  {
            distance += (w1Char != w2Char) ? 1 : 0
            let percentDigit: Double = (totalCount - Double(distance)) / totalCount
            let percent: Double = percentDigit * 100
            result = percent
            }
        
        return result
        
    }
    
    func addImage(_ image1: Data, _ image2: Data) -> Int{
        let image_1 = Photo(imageData: image1)
        let image_2 = Photo(imageData: image2)
        var returnNumber = 0
        if let percentNum = hamming(image1: image1, image2: image2) {
        
            images1.append(image_1)
            images2.append(image_2)
            percent.append("\(percentNum)% alike.")
            returnNumber = Int(percentNum)
        }
        return returnNumber
    }
    
}
