//
//  PopularMovieViewModel.swift
//  MovieApp
//
//  Created by Muhammad Haroon Iqbal on 04/01/2025.
//

import Foundation
import UIKit

class PopularMovieViewModel {
    let movieService: MovieService = MovieService()
    var movies: [MovieModel] = []
    var onSuccess: (() -> Void)? = nil
    var onError: ((String?) -> Void)? = nil
    var isLoading: Bool = true
    
    init() {
        fetchData()
    }
    
    private func fetchData() {
        if NetworkMonitor.shared.isConnected {
            getPopularMovies()
        } else {
            self.movies = fetchMovies()
            onSuccess?()
        }
    }
    
    private func getPopularMovies() {
        movieService.getPopularMovies { [weak self] (movies, error) in
            if let error = error {
                self?.onError?(error)
                return
            }
            self?.movies = movies ?? []
            self?.saveMovies()
            self?.isLoading = false
            self?.onSuccess?()
        }
    }
    
    private func saveMovies() {
        
        for movie in movies {
            let movieEntity = Movie(context: PersistantStorage.shared.context)
            movieEntity.id = movie.id ?? 0
            movieEntity.title = movie.title
//            movieEntity.posterPath = movie.posterPath
            movieEntity.date = Date() // movie.release_date
            movieEntity.overview = movie.overview
            
            // Download and save the image data
            if let posterURL = movie.poster_path {
                let url = "\(imageURL)\(movie.poster_path ?? "")"
                if let imageData = try? Data(contentsOf: URL(string: url) ?? URL(fileURLWithPath: url)) { // Avoid using this in production
                    movieEntity.photo = imageData
                }
            }
            
            PersistantStorage.shared.saveContext()
        }
    }
    
    private func fetchMovies() -> [MovieModel] {
        do {
            guard let result = try PersistantStorage.shared.context.fetch(Movie.fetchRequest()) as? [Movie] else { return [] }
            var savedMovies: [MovieModel] = []
            result.forEach { movie in
                let movieModel = MovieModel(adult: false, backdrop_path: nil, genre_ids: nil, id: movie.id, original_language: nil, original_title: movie.title, overview: movie.overview, popularity: nil, poster_path: nil, release_date: nil, title: movie.title, video: nil, vote_average: nil, vote_count: nil, image: movie.photo)
                savedMovies.append(movieModel)
            }
            self.isLoading = false
            return savedMovies
            
//            if let image = result[0].photo {
//                let renderedphoto = UIImage(data: image)
//                print(renderedphoto)
//            }
            
        } catch let error {
            self.isLoading = false
            print(error.localizedDescription)
        }
        self.isLoading = false
        return []
    }
}
