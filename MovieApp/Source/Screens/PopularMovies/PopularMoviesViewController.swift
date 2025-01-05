//
//  PopularMoviesViewController.swift
//  MovieApp
//
//  Created by Muhammad Haroon Iqbal on 04/01/2025.
//

import UIKit

class PopularMoviesViewController: UIViewController {
    
    @IBOutlet weak var moviesList: UICollectionView!
    
    var popularMovieViewModel: PopularMovieViewModel?

    override func viewDidLoad() {
        super.viewDidLoad()

        configure()
    }
    
    private func configure() {
        popularMovieViewModel = PopularMovieViewModel()
        
        moviesList.delegate = self
        moviesList.dataSource = self
        moviesList.collectionViewLayout = UICollectionViewFlowLayout()
        moviesList.register(UINib(nibName: "MovieCell", bundle: nil), forCellWithReuseIdentifier: "MovieCell")
        
        bindData()
    }
    
    private func bindData() {
        popularMovieViewModel?.onSuccess = {
            DispatchQueue.main.async {
                self.moviesList.reloadData()
            }
        }
        
        popularMovieViewModel?.onError = { [weak self] error in
            DispatchQueue.main.async {
                self?.showAlert(title: "Popular movies", message: error ?? "")
            }
        }
    }
}

extension PopularMoviesViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if popularMovieViewModel?.movies.count == 0 {
            self.moviesList.setEmptyMessage()
        } else {
            self.moviesList.restore()
        }
        return (popularMovieViewModel?.isLoading ?? false) ? 10 : popularMovieViewModel?.movies.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MovieCell", for: indexPath) as! MovieCell
        cell.setTemplateWithSubviews(popularMovieViewModel?.isLoading ?? false, viewBackgroundColor: .systemBackground)
        if popularMovieViewModel?.isLoading ?? false == false {
            guard let movie = popularMovieViewModel?.movies[indexPath.item] else { return UICollectionViewCell() }
            cell.configure(movieViewModel: MovieViewModel(movie: movie))
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let movieDetailViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "MovieDetailViewController") as! MovieDetailViewController
        movieDetailViewController.movieID = "\(popularMovieViewModel?.movies[indexPath.item].id ?? 0)"
        navigationController?.pushViewController(movieDetailViewController, animated: true)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (collectionView.frame.size.width - 20)/3, height: 200)
    }
}
