//
//  FavoritesPresenter.swift
//  FastAsignment
//
//  Created by Alejandro Rodríguez on 28/02/21.
//

import Foundation

class FavoritesPresenter: FavoritesPresentationLogic {

    weak var viewController: FavoritesDisplayLogic?

    func present(_ movies: [Movie]) {
        let movies: [MovieViewModel] = movies.map {
            return MovieViewModel(with: $0)
        }
        viewController?.display(movies)
    }
}
