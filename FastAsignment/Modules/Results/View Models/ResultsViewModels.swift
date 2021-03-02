//
//  ResultsViewModels.swift
//  FastAsignment
//
//  Created by Alejandro Rodríguez on 27/02/21.
//

import Foundation

struct MovieViewModel {
    var title: String
    var genre: String
    var actors: String
    var plot: String
    var poster: String
    var imdbID: String
    var isFavorite: Bool

    init(with movie: Movie) {
        title = movie.title
        genre = movie.genre
        actors = movie.actors
        plot = movie.plot
        poster = movie.poster
        imdbID = movie.imdbID
        isFavorite = movie.isFavorite
    }
}

struct MovieSearchErrorViewModel {
    var title: String
    var imageName: String
}
