//
//  ResultsContract.swift
//  FastAsignment
//
//  Created by Alejandro Rodríguez on 27/02/21.
//

import Foundation

protocol ResultsBusinessLogic: class {
    func fetchMovie(with title: String)
    func toggleMovieFavoriteStatus(with movieId: String, flag: Bool)
}

protocol ResultsPresentationLogic: class {
    func present(_ movie: Movie)

}

protocol ResultsDisplayLogic: class {
    func display(_ movies: [MovieViewModel])
}

protocol ResultsWireframeLogic: class {}

protocol ResultsDataStore {}
