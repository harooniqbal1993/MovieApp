//
//  MovieCell.swift
//  MovieApp
//
//  Created by Muhammad Haroon Iqbal on 04/01/2025.
//

import UIKit
import SDWebImage
import UIView_Shimmer

class MovieCell: UICollectionViewCell, ShimmeringViewProtocol {

    @IBOutlet weak var posterImage: UIImageView!
    @IBOutlet weak var movieTitleLabel: UILabel!
    
    var shimmeringAnimatedItems: [UIView] {
        [
            posterImage,
            movieTitleLabel
        ]
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configure(movieViewModel: MovieViewModel) {
        if let photo = movieViewModel.photo {
            posterImage.image = UIImage(data: photo)
        } else {
            posterImage.sd_setImage(with: URL(string: movieViewModel.poster), placeholderImage: UIImage(named: "movie-placeholder"))
        }
        
        movieTitleLabel.text = movieViewModel.title
    }

}


class MovieViewModel {
    let movie: MovieModel
    
    init(movie: MovieModel) {
        self.movie = movie
    }
    
    var poster: String {
        return "\(imageURL)\(movie.poster_path ?? "")"
    }
    
    var title: String? {
        return movie.title
    }
    
    var photo: Data? {
        return movie.image
    }
}
