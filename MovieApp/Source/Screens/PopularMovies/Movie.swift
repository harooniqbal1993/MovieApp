//
//  Movie.swift
//  MovieApp
//
//  Created by Muhammad Haroon Iqbal on 04/01/2025.
//

import Foundation

struct PopularMoviesResponse: Decodable {
    var page: Int?
    var results: [MovieModel]?
}

struct MovieModel: Decodable {
    var adult: Bool?
    var id: Double?
    var original_language: String?
    var original_title: String?
    var overview: String?
    var popularity: Float?
    var poster_path: String?
    var release_date: String?
    var title: String?
    var video: Bool?
    var vote_average: Float?
    var vote_count: Int?
    var image: Data?
    
//    enum CodingKeys: String, CodingKey {
//        case adult
//        case id
//        case original_language
//        case original_title
//        case overview
//        case popularity
//        case poster_path
//        case release_date
//        case title
//        case video
//        case vote_average
//        case vote_count
//        case image
//    }
    
//    private static let dateFormatter: DateFormatter = {
//        let formatter = DateFormatter()
//        formatter.dateFormat = "yyyy-MM-dd" // Adjust the date format based on your JSON date format
//        return formatter
//    }()
//    
//    init(from decoder: Decoder) throws {
//        let container = try decoder.container(keyedBy: CodingKeys.self)
//        
//        do {
//            adult = try container.decodeIfPresent(Bool.self, forKey: .adult)
//            id = try container.decodeIfPresent(Double.self, forKey: .id)
//            original_language = try container.decodeIfPresent(String.self, forKey: .original_language)
//            original_title = try container.decodeIfPresent(String.self, forKey: .original_title)
//            overview = try container.decodeIfPresent(String.self, forKey: .overview)
//            popularity = try container.decodeIfPresent(Float.self, forKey: .popularity)
//            poster_path = try container.decodeIfPresent(String.self, forKey: .poster_path)
//            
//            title = try container.decodeIfPresent(String.self, forKey: .title)
//            video = try container.decodeIfPresent(Bool.self, forKey: .video)
//            vote_average = try container.decodeIfPresent(Float.self, forKey: .vote_average)
//            vote_count = try container.decodeIfPresent(Int.self, forKey: .vote_count)
//            image = try container.decodeIfPresent(Data.self, forKey: .image)
//            
//            // Decode the createdWhen property using the date formatter
//            if let releaseDateString = try container.decodeIfPresent(String.self, forKey: .release_date) {
//                release_date = MovieModel.dateFormatter.date(from: releaseDateString)
//            } else {
//                release_date = nil
//            }
//        } catch {
//            print("Notification parsing")
//            print(error)
//        }
//        
//    }
}

// Detail
//{
//  "adult": false,
//  "backdrop_path": "/euYIwmwkmz95mnXvufEmbL6ovhZ.jpg",
//  "belongs_to_collection": {
//    "id": 1069584,
//    "name": "Gladiator Collection",
//    "poster_path": "/r7uyUOB6fmmPumWwHiV7Hn2kUbL.jpg",
//    "backdrop_path": "/1VdLvSIeHuwqCT13H9EafxCacGB.jpg"
//  },
//  "budget": 310000000,
//  "genres": [
//    {
//      "id": 28,
//      "name": "Action"
//    },
//    {
//      "id": 12,
//      "name": "Adventure"
//    },
//    {
//      "id": 18,
//      "name": "Drama"
//    }
//  ],
//  "homepage": "https://www.gladiator.movie",
//  "id": 558449,
//  "imdb_id": "tt9218128",
//  "origin_country": [
//    "US"
//  ],
//  "original_language": "en",
//  "original_title": "Gladiator II",
//  "overview": "Years after witnessing the death of the revered hero Maximus at the hands of his uncle, Lucius is forced to enter the Colosseum after his home is conquered by the tyrannical Emperors who now lead Rome with an iron fist. With rage in his heart and the future of the Empire at stake, Lucius must look to his past to find strength and honor to return the glory of Rome to its people.",
//  "popularity": 4873.155,
//  "poster_path": "/2cxhvwyEwRlysAmRH4iodkvo0z5.jpg",
//  "production_companies": [
//    {
//      "id": 4,
//      "logo_path": "/gz66EfNoYPqHTYI4q9UEN4CbHRc.png",
//      "name": "Paramount Pictures",
//      "origin_country": "US"
//    },
//    {
//      "id": 221347,
//      "logo_path": "/6Ry6uNBaa0IbbSs1XYIgX5DkA9r.png",
//      "name": "Scott Free Productions",
//      "origin_country": "US"
//    },
//    {
//      "id": 246486,
//      "logo_path": null,
//      "name": "Lucy Fisher/Douglas Wick Productions",
//      "origin_country": "US"
//    }
//  ],
//  "production_countries": [
//    {
//      "iso_3166_1": "US",
//      "name": "United States of America"
//    }
//  ],
//  "release_date": "2024-11-05",
//  "revenue": 438292182,
//  "runtime": 148,
//  "spoken_languages": [
//    {
//      "english_name": "English",
//      "iso_639_1": "en",
//      "name": "English"
//    }
//  ],
//  "status": "Released",
//  "tagline": "Prepare to be entertained.",
//  "title": "Gladiator II",
//  "video": false,
//  "vote_average": 6.8,
//  "vote_count": 1940
//}
