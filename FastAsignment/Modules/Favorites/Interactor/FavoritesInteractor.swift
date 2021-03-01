//
//  FavoritesInteractor.swift
//  FastAsignment
//
//  Created by Alejandro Rodríguez on 28/02/21.
//

import Foundation

class FavoritesInteractor: FavoritesBusinessLogic, MoviesRepositoryProtocol {

    var presenter: FavoritesPresentationLogic?

    func fetchFavoriteMovies() {
        presenter?.present(getFavoriteMovies())
    }
}
