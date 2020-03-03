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
    
    func fetchPhotoFromAlbum() {
        let albumName = "Album Name"
        var assetCollection = PHAssetCollection()
        var albumFound = Bool()
        var photoAssets = PHFetchResult<AnyObject>()
        let fetchOptions = PHFetchOptions()
        
        fetchOptions.predicate = NSPredicate(format: "title = %@", albumName)
        let collection: PHFetchResult = PHAssetCollection.fetchAssetCollections(with: .album, subtype: .any, options: fetchOptions)
        if let firstObject = collection.firstObject {
            assetCollection = firstObject
            albumFound = true
        } else {
            albumFound = false
        }
        _ = collection.count
        photoAssets = PHAsset.fetchAssets(in: assetCollection, options: nil) as! PHFetchResult<AnyObject>
        let imageManager = PHCachingImageManager()
        photoAssets.enumerateObjects {(object: AnyObject!, count: Int, stop: UnsafeMutablePointer<ObjCBool>) in
            if object is PHAsset   {
               let asset = object as! PHAsset
                print("Inside  If object is PHAsset, This is number 1")

                let imageSize = CGSize(width: asset.pixelWidth,
                                       height: asset.pixelHeight)


                let options = PHImageRequestOptions()
                options.deliveryMode = .fastFormat
                options.isSynchronous = true

                imageManager.requestImage(for: asset,
                                                  targetSize: imageSize,
                                                  contentMode: .aspectFill,
                                                  options: options,
                                                  resultHandler: {
                                                    (image, info) -> Void in
                                                    //self.photo = image!
                                                    /* The image is now available to us */
                                                    //self.addImgToArray(uploadImage: self.photo)
                                                    print("enum for image, This is number 2")

                })
            }
        }
    }
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
