//
//  ResultsViewModels.swift
//  FastAsignment
//
//  Created by Alejandro Rodríguez on 27/02/21.
//

import Foundation

enum ResultsViewModels {

    struct MovieViewModel {
        var title: String
        var year: String
        var genre: String
        var actors: String
        var plot: String
        var poster: String
        var isFavorite = false

        init(with movie: Movie) {
            title = movie.title
            year = movie.year
            genre = movie.genre
            actors = movie.actors
            plot = movie.plot
            poster = movie.poster
        }
    }
}
