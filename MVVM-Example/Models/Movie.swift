//
//  Movie.swift
//  MVVM-Example
//
//  Created by Furkan Türkyaşar on 30.12.2023.
//

import Foundation

struct Movie: Decodable {
    let page: Int?
    let results: [MovieResult]?
    let totalPages: Int?
    let totalResults: Int?
    
    enum CodingKeys: String, CodingKey {
        case page, results
        case totalPages = "total_pages"
        case totalResults = "total_results"
    }
}

struct MovieResult: Decodable {
    let id: Int?
    let posterPath: String?
    let overview: String?
    let releaseDate: String?
    let title: String?
    
    enum CodingKeys: String, CodingKey {
        case id
        case posterPath = "poster_path"
        case overview
        case releaseDate = "release_date"
        case title
    }
    
    var _id: Int {
        id ?? Int.min
    }
    
    var _posterPath: String {
        posterPath ?? ""
    }
}
