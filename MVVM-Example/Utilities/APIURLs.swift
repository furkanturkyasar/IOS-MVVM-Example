//
//  APIURLs.swift
//  MVVM-Example
//
//  Created by Furkan Türkyaşar on 30.12.2023.
//

import Foundation


enum APIURLs {
    static func movies(page: Int) -> String {
        "https://api.themoviedb.org/3/movie/popular?api_key=77c14308a4e029b81c2da37c49c19cf0&language=tr-TR&page=\(page)"
    }
    static func imageUrl(posterPath: String) -> String {
        "https://image.tmdb.org/t/p/w500\(posterPath)"
    }
    static func movieDetail(id: Int) -> String {
        "https://api.themoviedb.org/3/movie/\(id)?api_key=77c14308a4e029b81c2da37c49c19cf0&language=tr-TR"
    }
}
