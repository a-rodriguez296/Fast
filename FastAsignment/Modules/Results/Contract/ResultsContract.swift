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
    func present(_ result: Movie)
    func present(_ error: Error?)
}

protocol ResultsDisplayLogic: class {
    func display(_ movies: [MovieViewModel])
    func displayError(with viewModel: MovieSearchErrorViewModel)
}

protocol ResultsWireframeLogic: class {}

protocol ResultsDataStore {}
