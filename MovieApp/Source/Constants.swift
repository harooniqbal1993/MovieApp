//
//  Constants.swift
//  MovieApp
//
//  Created by Muhammad Haroon Iqbal on 04/01/2025.
//

import Foundation

var baseURL: String = "https://api.themoviedb.org/3/movie/"
var imageURL: String = "https://image.tmdb.org/t/p/w220_and_h330_face/"
var token: String = "eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJmNGE5Yzk2ZTYyNGY2MTgwMzcxZWRmZDc1M2ZlMWRlOSIsIm5iZiI6MTczNjAwMjIzNi4zODksInN1YiI6IjY3Nzk0YWJjODE2YjI4MTBkMTY2YjYzZCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.0U2zB3Fu9Ap0lCicYfu3gX7NYTXKuvYrsssPRl5NKFk"

enum MovieEndPoints: String {
    case POPULAR_MOVIES = "popular"
    case MOVIE_DETAIL = "558449"
}
