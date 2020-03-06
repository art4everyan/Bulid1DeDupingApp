//
//  AlbumCollectionViewController.swift
//  Photo De-Duping
//
//  Created by Lydia Zhang on 3/5/20.
//  Copyright © 2020 Lydia Zhang. All rights reserved.
//

import UIKit


class AlbumCollectionViewController: UICollectionViewController {
    let albumController = AlbumController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        collectionView.reloadData()
    }

    // MARK: UICollectionViewDataSource
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return albumController.album.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "AlbumCell", for: indexPath) as? AlbumCollectionViewCell else {fatalError("Cell is not an AlbumCell")}
        let album = albumController.album[indexPath.row]
        cell.name = album.name
    
        return cell
    }

}
