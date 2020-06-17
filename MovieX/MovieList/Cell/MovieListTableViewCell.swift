//
//  MovieListTableViewCekk.swift
//  MovieX
//
//  Created by Stella Patricia (ID) on 17/06/20.
//  Copyright © 2020 Stella. All rights reserved.
//

import Foundation
import UIKit

class MovieListTableViewCell: UITableViewCell {
    
    @IBOutlet weak var ivPoster: UIImageView!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblReleaseDate: UILabel!
    @IBOutlet weak var lblDescription: UILabel!
    
    override func prepareForReuse() {
        super.prepareForReuse()

    }
}
