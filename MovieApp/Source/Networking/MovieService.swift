//
//  MovieService.swift
//  MovieApp
//
//  Created by Muhammad Haroon Iqbal on 04/01/2025.
//

import Foundation

class MovieService {
    
    private var httpUtility: HttpUtility = HttpUtility()
    
    private func getHeaderFields() -> [String : String] {
        let httpHeaderFields: [String : String] = [
            "Authorization": "Bearer \(token)",
            "Content-Type": "application/json",
        ]
        return httpHeaderFields
    }
    
    private func getURLRequest(url: String, httpMethod: String = "GET", httpBody: Data? = nil) -> URLRequest {
        if let url = URL(string: url) {
            var request: URLRequest = URLRequest(url: url)
            request.allHTTPHeaderFields = getHeaderFields()
            request.httpMethod = httpMethod
            request.httpBody = httpBody
            return request
        }
        return URLRequest(url: URL(string: url) ?? URL(fileURLWithPath: url))
    }
    
    func getPopularMovies(completion: @escaping ([MovieModel]?, String?) -> Void) {
        let url = "\(baseURL)\(MovieEndPoints.POPULAR_MOVIES.rawValue)?page=1"
        httpUtility.get(urlRequest: getURLRequest(url: url), resultType: PopularMoviesResponse.self) { httpURLResponse, result, error in
            completion(result?.results, error)
        }
    }
    
    func getMovieDetail(id: String?, completion: @escaping (MovieModel?, String?) -> Void) {
        let url = "\(baseURL)\(id ?? "")"
        httpUtility.get(urlRequest: getURLRequest(url: url), resultType: MovieModel.self) { httpURLResponse, result, error in
            completion(result, error)
        }
    }
}
