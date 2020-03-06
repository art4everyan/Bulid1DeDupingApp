//
//  AlbumCollectionViewCell.swift
//  Photo De-Duping
//
//  Created by Lydia Zhang on 3/5/20.
//  Copyright © 2020 Lydia Zhang. All rights reserved.
//

import UIKit
import Photos
class AlbumCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var albumName: UILabel!
    var albumController: AlbumController?
    
    var name: String? {
        didSet {
            updateViews()
        }
    }
    
    func updateViews() {
        guard let albumController = albumController else {return}
        let album = albumController.listAlbums()
        for i in album {
            albumName.text = i.name
        }
    }
    @IBAction func choose(_ sender: Any) {
    }
    
    var photo: UIImage?
    var photos: [UIImage] = []
    
    
    func fetchCustomAlbumPhotos() {
        
        var assetCollection = PHAssetCollection()
        var photoAssets = PHFetchResult<AnyObject>()
        let fetchOptions = PHFetchOptions()
        let albumName = "Album Name Here"
        var albumFound = Bool()

        fetchOptions.predicate = NSPredicate(format: "title = %@", albumName)
        let collection:PHFetchResult = PHAssetCollection.fetchAssetCollections(with: .album, subtype: .any, options: fetchOptions)

        if let firstObject = collection.firstObject{
            //found the album
            assetCollection = firstObject
            albumFound = true
        }
        else { albumFound = false }
        _ = collection.count
        photoAssets = PHAsset.fetchAssets(in: assetCollection, options: nil) as! PHFetchResult<AnyObject>
        let imageManager = PHCachingImageManager()
        photoAssets.enumerateObjects{(object: AnyObject!,
            count: Int,
            stop: UnsafeMutablePointer<ObjCBool>) in

            if object is PHAsset{
                let asset = object as! PHAsset
                print("Inside  If object is PHAsset, This is number 1")

                let imageSize = CGSize(width: asset.pixelWidth,
                                       height: asset.pixelHeight)

                /* For faster performance, and maybe degraded image */
                let options = PHImageRequestOptions()
                options.deliveryMode = .fastFormat
                options.isSynchronous = true

                imageManager.requestImage(for: asset,
                                                  targetSize: imageSize,
                                                  contentMode: .aspectFill,
                                                  options: options,
                                                  resultHandler: {
                                                    (image, info) -> Void in
                                                    self.photo = image!
                                                    /* The image is now available to us */
                                                    self.addImgToArray(uploadImage: self.photo!)
                                                    print("enum for image, This is number 2")

                })

            }
        }
    }

    func addImgToArray(uploadImage:UIImage)
    {
        self.photos.append(uploadImage)

    }
    
}
