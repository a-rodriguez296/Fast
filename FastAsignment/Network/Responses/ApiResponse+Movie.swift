//
//  ApiResponse+Movie.swift
//  FastAsignment
//
//  Created by Alejandro Rodríguez on 26/02/21.
//

import Foundation

struct Movie: Decodable {
    var title: String
    var genre: String
    var actors: String
    var plot: String
    var poster: String
    var imdbID: String
    var isFavorite: Bool = false

    enum CodingKeys: String, CodingKey {
        case title = "Title"
        case genre = "Genre"
        case actors = "Actors"
        case plot = "Plot"
        case poster = "Poster"
        case imdbID
    }
}
