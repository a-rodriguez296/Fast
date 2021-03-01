//
//  ResultsPresenter.swift
//  FastAsignment
//
//  Created by Alejandro Rodríguez on 27/02/21.
//

import Foundation

class ResultsPresenter: ResultsPresentationLogic {

    weak var viewController: ResultsDisplayLogic?

    func present(_ movie: Movie) {
        let viewModel = MovieViewModel(with: movie)
        //I never understood/figured out why the API doesnt reply a list of movies instead of a single one.
        viewController?.display([viewModel])
    }

    func present(_ error: Error?) {
        if let _ = error {
            let viewModel = MovieSearchErrorViewModel(title: "Currently we are having issues connecting to the server. Try again later", imageName: "wifi.exclamationmark")
            viewController?.displayError(with: viewModel)
        } else {
            let viewModel = MovieSearchErrorViewModel(title: "We couldn't find any movies with the title you searched. Try again with another title", imageName: "exclamationmark.triangle.fill")
            viewController?.displayError(with: viewModel)
        }
    }
}
