//
//  DetailViewModel.swift
//  MVVM-Example
//
//  Created by Furkan Türkyaşar on 1.01.2024.
//

import Foundation

protocol DetailViewModelInterface {
    var view: DetailScreenInterface? {get set}
    func viewDidLoad()
}

final class DetailViewModel {
    weak  var view: DetailScreenInterface?
}

extension DetailViewModel: DetailViewModelInterface {
    func viewDidLoad() {
        view?.configureVC()
        view?.configurePosterImageView()
        view?.downloadPosterImage()
        view?.configureTitleLabel()
        view?.configureDateLabel()
        view?.configureOverviewLabel()
    }
}
