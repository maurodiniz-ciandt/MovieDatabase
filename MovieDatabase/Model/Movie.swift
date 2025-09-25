//
//  Movie.swift
//  MovieDatabase
//
//  Created by Mauro Augusto Araujo Diniz on 24/09/25.
//

import Foundation

public struct Movie: Codable, Identifiable {
    public let id: Int
    let title: String
    let overview: String
    let posterPath: String
    let releaseDate: String
    
    private enum CodingKeys: String, CodingKey {
        case id
        case title
        case overview
        case posterPath = "poster_path"
        case releaseDate = "release_date"
    }
}

struct MovieListResponse: Codable {
    let results: [Movie]
}

struct MockData {
    static let sampleMovie = Movie(id: 1,
                                   title: "Test Movie Title",
                                   overview: "Test Movie Overview",
                                   posterPath: "",
                                   releaseDate: "2025-09-24")
}
