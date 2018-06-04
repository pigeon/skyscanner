//
//  SearchImageCell.swift
//  Movies
//
//  Created by Dmytro Golub on 09/04/2018.
//  Copyright © 2018 Paysafe. All rights reserved.
//

import UIKit


class FlightsSearchCell: UICollectionViewCell {
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var movieTitle: UILabel!
    @IBOutlet weak var moviesDescription: UILabel!
    @IBOutlet weak var releaseDate: UILabel!
    @IBOutlet weak var rating: UILabel!
    
    func configure(_ model:Movie) {
        //self.image.kf.indicatorType = .activity
        //self.image.kf.setImage(with: URL(string: model.imageURL)!)
        self.movieTitle.text = model.movieTitle
        self.moviesDescription.text = model.movieDescription
        self.releaseDate.text = model.releaseDate
        self.rating.attributedText = model.rating
    }
}
