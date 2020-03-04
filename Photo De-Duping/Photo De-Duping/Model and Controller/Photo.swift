//
//  Photo.swift
//  Photo De-Duping
//
//  Created by Lydia Zhang on 3/2/20.
//  Copyright © 2020 Lydia Zhang. All rights reserved.
//

import Foundation
struct Photo: Codable {
    var imageData : Data
}
extension Photo: Equatable {
    static func == (lhs: Photo,rhs: Photo) -> Bool {
        return lhs.imageData == rhs.imageData 
    }
}
