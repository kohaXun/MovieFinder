//
//  Movie.swift
//  MovieFinder
//
//  Created by Sten Anderßen on 02.07.18.
//  Copyright © 2018 Sten Anderßen. All rights reserved.
//

import Foundation

/// Model class that holds data for a movie.
struct Movie {
    let id: Int
    let title: String
    let releaseDate: Date?
    let overview: String
    let posterPath: String?
}

extension Movie: Decodable {
    enum MovieCodingKeys: String, CodingKey {
        case id = "id"
        case title = "title"
        case releaseDate = "release_date"
        case overview = "overview"
        case posterPath = "poster_path"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: MovieCodingKeys.self)
        let id: Int = try container.decode(Int.self, forKey: .id)
        let title: String = try container.decode(String.self, forKey: .title)
        let releaseDate: Date? = try? container.decode(Date.self, forKey: .releaseDate)
        let overview: String = try container.decode(String.self, forKey: .overview)
        let posterPath: String? = try? container.decode(String.self, forKey: .posterPath)

        self.init(id: id, title: title, releaseDate: releaseDate, overview: overview, posterPath: posterPath)
    }
}

struct MovieResult: Decodable {
    let movies: [Movie]
    
    enum CodingKeys : String, CodingKey {
        case movies = "results"
    }
}
