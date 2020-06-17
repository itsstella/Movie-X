//
//  MovieReviewTableViewCell.swift
//  MovieX
//
//  Created by Stella Patricia (ID) on 17/06/20.
//  Copyright © 2020 Stella. All rights reserved.
//

import Foundation
import UIKit

class MovieReviewTableViewCell: UITableViewCell {
    
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblComment: UILabel!
    
    override func prepareForReuse() {
        super.prepareForReuse()
    }
}
