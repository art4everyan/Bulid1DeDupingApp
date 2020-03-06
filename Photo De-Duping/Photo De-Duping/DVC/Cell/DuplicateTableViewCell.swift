//
//  DuplicateTableViewCell.swift
//  Photo De-Duping
//
//  Created by Lydia Zhang on 3/2/20.
//  Copyright © 2020 Lydia Zhang. All rights reserved.
//

import UIKit

class DuplicateTableViewCell: UITableViewCell {
    @IBOutlet weak var number: UILabel!
    @IBOutlet weak var duplicateNumber: UILabel!
    
    var tracker: TrackHistory? {
        didSet {
            updateViews()
        }
    }
    
    func updateViews() {
        guard let tracker = tracker else {return}
        number.text = "\(tracker.order)"
        duplicateNumber.text = "\(tracker.numberOfDuplicateCase)"
    }
    
    
}

