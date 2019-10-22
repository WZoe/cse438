//
//  PosterCell.swift
//  Lab 4 Movie Search
//
//  Created by Zoe Wang on 10/20/19.
//  Copyright © 2019 Zoe Wang. All rights reserved.
//

import UIKit

class PosterCell: UICollectionViewCell {
    
    let movieTitle = UILabel(frame: CGRect(x: 0, y: 140, width: 120, height: 40))
    let moviePoster = UIImageView(frame: CGRect(x: 0, y: 0, width: 120, height: 180))
    
    override func prepareForReuse() {
        super.prepareForReuse()
        movieTitle.removeFromSuperview()
        moviePoster.removeFromSuperview()
    }
}
