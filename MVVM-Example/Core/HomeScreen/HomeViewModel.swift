//
//  HomeViewModel.swift
//  MVVM-Example
//
//  Created by Furkan Türkyaşar on 30.12.2023.
//

import Foundation

protocol HomeViewModalInterface {
    var view: HomeScreenInterface? {get set}
    
    func viewDidLoad()
    func getMovies()
}

final class HomeViewModel {
    weak var view: HomeScreenInterface?
    private let service = MovieService()
    var movies: [MovieResult] = []
    private var page: Int = 1
//    var shouldDownloadMore: Bool = true
}

extension HomeViewModel: HomeViewModalInterface {
    func viewDidLoad() {
        view?.configureVC()
        view?.configureCollectionView()
        getMovies()
    }
    func getMovies() {
//        shouldDownloadMore = false
        service.downloadMovies(page: page) { [weak self] returnedMovies in
            guard let self = self else {return}
            guard let returnedMovies = returnedMovies else {return}
            self.movies.append(contentsOf: returnedMovies)
            self.page += 1
            self.view?.reloadCollectionView()
//            self.shouldDownloadMore = true
        }
    }
    
    func getDetail(id: Int) {
        service.downloadMovieDetail(id: id) { [weak self] returnedDetail in
            guard let self = self else { return }
            guard let returnedDetail = returnedDetail else { return }
    
            self.view?.navigateToDetailScreen(movieDetail: returnedDetail)
        }
    }
}

