//
//  collectionsCell.swift
//  Lab 4 Movie Search
//
//  Created by Zoe Wang on 10/21/19.
//  Copyright © 2019 Zoe Wang. All rights reserved.
//

import UIKit

class CollectionsCell: UICollectionViewCell {
    
    let movieTitle = UILabel(frame: CGRect(x: 0, y: 80, width: 80, height: 40))
    let moviePoster = UIImageView(frame: CGRect(x: 0, y: 0, width: 80, height: 120))
    
    override func prepareForReuse() {
        super.prepareForReuse()
        movieTitle.removeFromSuperview()
        moviePoster.removeFromSuperview()
    }
}
