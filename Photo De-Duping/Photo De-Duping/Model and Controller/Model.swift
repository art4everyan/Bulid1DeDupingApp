//
//  Model.swift
//  Photo De-Duping
//
//  Created by Lydia Zhang on 3/5/20.
//  Copyright © 2020 Lydia Zhang. All rights reserved.
//

import Foundation
import Photos

struct Photo: Codable {
    var imageData : Data
}
extension Photo: Equatable {
    static func == (lhs: Photo,rhs: Photo) -> Bool {
        return lhs.imageData == rhs.imageData
    }
}
class AlbumModel {
  let name:String
  let count:Int
  let collection:PHAssetCollection
  init(name:String, count:Int, collection:PHAssetCollection) {
    self.name = name
    self.count = count
    self.collection = collection
  }
}
struct TrackHistory {
    var order: Int
    var numberOfDuplicateCase: Int
}
struct Case {
    var duplicateOne: Data
    var duplicateTwo: Data
    var duplicateOneTitle: String
    var duplicateTwoTitle: String
}
