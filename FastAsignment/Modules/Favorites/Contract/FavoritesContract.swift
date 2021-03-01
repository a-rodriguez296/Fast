//
//  FavoritesContract.swift
//  FastAsignment
//
//  Created by Alejandro Rodríguez on 28/02/21.
//

import Foundation

protocol FavoritesBusinessLogic: class {
    func fetchFavoriteMovies()
}

protocol FavoritesPresentationLogic: class {
    func present(_ movies: [Movie])
}

protocol FavoritesDisplayLogic: class {
    func display(_ movies: [MovieViewModel])
}

protocol FavoritesWireframeLogic: class {}

