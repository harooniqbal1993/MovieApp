//
//  MovieDetailViewModel.swift
//  MovieApp
//
//  Created by Muhammad Haroon Iqbal on 04/01/2025.
//

import Foundation
import CoreData

class MovieDetailViewModel {
    let movieService: MovieService = MovieService()
    var movieID: String?
    var movie: MovieModel?
    var onSuccess: (() -> Void)?
    var onError: ((String?) -> Void)?
    
    var posterURL: String {
        return "\(imageURL)\(movie?.poster_path ?? "")"
    }
    
    var title: String {
        return movie?.title ?? "N/A"
    }
    
    var description: String {
        return movie?.overview ?? "N/A"
    }
    
    var photo: Data? {
        return movie?.image
    }
    
    var year: String? {
        let inputFormatter = DateFormatter()
        inputFormatter.dateFormat = "yyyy-MM-dd"
        
        if let release_date = movie?.release_date {
            let showDate = inputFormatter.date(from: release_date)
            inputFormatter.dateFormat = "yyyy"
            let resultString = inputFormatter.string(from: showDate!)
            return resultString
        }
        return nil
    }
    
    init(movieID: String?) {
        self.movieID = movieID
//        getMovieDetail()
        fetchData()
    }
    
    private func fetchData() {
        if NetworkMonitor.shared.isConnected {
            getMovieDetail()
        } else {
            if let id = self.movieID {
                self.movie = fetchMovie(id: id)
                onSuccess?()
            }
        }
    }
    
    private func getMovieDetail() {
        movieService.getMovieDetail(id: movieID) { movie, error in
            if let error = error {
                self.onError?(error)
                return
            }
            self.movie = movie
            self.onSuccess?()
        }
    }
    
    private func fetchMovie(id: String) -> MovieModel? {
        let request = NSFetchRequest<Movie>(entityName: "Movie")
        request.predicate = NSPredicate(format: "id==%@", id as CVarArg)
        do {
            let result = try PersistantStorage.shared.context.fetch(request).first
            return MovieModel(adult: false, id: result?.id, original_language: nil, original_title: result?.title, overview: result?.overview, popularity: nil, poster_path: nil, release_date: nil, title: result?.title, video: false, vote_average: nil, vote_count: nil, image: result?.photo)
        } catch let error {
            print(error.localizedDescription)
        }
        return nil
    }
}
