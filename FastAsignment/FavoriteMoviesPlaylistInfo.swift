//
//  FavoriteMoviesPlaylistInfo.swift
//  FastAsignment
//
//  Created by Alejandro Rodríguez on 27/02/21.
//

import Foundation

private var favoriteMovies = [Movie]()

protocol MoviesRepositoryProtocol {
    func addFavorite(_ movie: Movie)
    func removeFavorite(_ movie: Movie)
    func contains(_ movie: Movie) -> Bool
}

extension MoviesRepositoryProtocol {

    func addFavorite(_ movie: Movie) {
        //We need to be sure not to add the same movie twice
        let containsFlag = contains(movie)
        if !containsFlag {
            favoriteMovies.append(movie)
        }
    }

    func removeFavorite(_ movie: Movie) {
        let movieIndex = favoriteMovies.firstIndex {
            return $0.imdbID == movie.imdbID
        }
        if let index = movieIndex {
            favoriteMovies.remove(at: index)
        }
    }

    func contains(_ movie: Movie) -> Bool {
        return favoriteMovies.contains {
            return $0.imdbID == movie.imdbID
        }
    }
}
