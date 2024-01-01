//
//  MovieService.swift
//  MVVM-Example
//
//  Created by Furkan Türkyaşar on 30.12.2023.
//

import Foundation


class MovieService {
    
    func downloadMovies(page: Int, completion: @escaping ([MovieResult]?) -> ()) {
        guard let url = URL(string: APIURLs.movies(page: page))
        else {
            return
        }
        
        
        NetworkManager.shared.download(url: url) { [weak self] result in
            
            switch result {
                case .success(let data):
                    completion(self?.handleWithData(data))
                    break
                case .failure(let error):
                    self?.handleWithError(error)
                    break
            }
        }
    }
    
    func downloadMovieDetail(id: Int, completion: @escaping (MovieResult?) -> ()) {
        guard let url = URL(string: APIURLs.movieDetail(id: id)) else { return }
        
        NetworkManager.shared.download(url: url) { [weak self] result in
            
            switch result {
                case .success(let data):
                completion(self?.handleWithData(data))
                    break
                case .failure(let error):
                    self?.handleWithError(error)
                    break
            }
            
        }
        
    }
    
    private func handleWithError(_ error: Error) {
        print(error.localizedDescription)
    }
    
    private func handleWithData(_ data: Data) -> [MovieResult]? {
       
        do {
            let movie = try JSONDecoder().decode(Movie.self, from: data)
            
            return movie.results
        } catch {
            print(error)
            return nil
        }
    }
    
    private func handleWithData(_ data: Data) -> MovieResult? {
        do {
            let movideDetail = try JSONDecoder().decode(MovieResult.self, from: data)
            return movideDetail
        } catch {
            print(error)
            return nil
        }
    }
}
            
