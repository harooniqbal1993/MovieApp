//
//  MovieDetailViewController.swift
//  MovieApp
//
//  Created by Muhammad Haroon Iqbal on 04/01/2025.
//

import UIKit
import SDWebImage

class MovieDetailViewController: UIViewController {

    @IBOutlet weak var movieThumbnail: UIImageView!
    @IBOutlet weak var movieTitle: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    var movieID: String?
    var movieDetailViewModel: MovieDetailViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configure()
    }
    
    private func configure() {
        movieDetailViewModel = MovieDetailViewModel(movieID: movieID)
        bindData()
    }
    
    private func updateUI() {
        if let photo = movieDetailViewModel?.photo {
            movieThumbnail.image = UIImage(data: photo)
        } else {
            movieThumbnail.sd_setImage(with: URL(string: movieDetailViewModel?.posterURL ?? ""), placeholderImage: UIImage(named: "movie-placeholder"))
        }
        
        movieTitle.text = "\(movieDetailViewModel?.title ?? "N?A")(\(movieDetailViewModel?.year ?? "N/A"))"
        descriptionLabel.text = movieDetailViewModel?.description
    }
    
    private func bindData() {
        movieDetailViewModel?.onSuccess = { [weak self] in
            DispatchQueue.main.async {
                self?.updateUI()
            }
        }
        
        movieDetailViewModel?.onError = { [weak self] error in
            DispatchQueue.main.async {
                self?.showAlert(title: "Movie Detail", message: error ?? "")
            }
        }
    }
}
