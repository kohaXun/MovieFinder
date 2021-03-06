//
//  MovieSearchResultViewCell.swift
//  MovieFinder
//
//  Created by Sten Anderßen on 03.07.18.
//  Copyright © 2018 Sten Anderßen. All rights reserved.
//

import UIKit

/// View cell that displays a movie in a table view.
class MovieSearchResultViewCell: BaseTableComponentViewCell {
    
    @IBOutlet private weak var posterImageView: UIImageView!
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var releaseLabel: UILabel!
    @IBOutlet private weak var descriptionLabel: UILabel!
    
    // MARK: - BaseTableComponentProtocol
    override func updateUI() {
        guard let model = data as? MovieSearchResultCellModel else {
            return
        }
        
        titleLabel.text = model.title
        descriptionLabel.text = model.overview
        
        if model.releaseDateString.isEmpty {
            releaseLabel.text = "Unknown release date"
        } else {
            releaseLabel.text = model.releaseDateString
        }
        
        if let posterPath = model.posterPath {
            posterImageView.af_setImage(withURLRequest: TMDBRouter.moviePoster(size: .medium, path: posterPath), placeholderImage: UIImage(named: "PosterPlaceholderImage"))
        }
    }
}
