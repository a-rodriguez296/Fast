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
        let viewModel = ResultsViewModels.MovieViewModel(with: movie)
        //I never understood/figured out why the API doesnt reply a list of movies instead of a single one.
        viewController?.display([viewModel])
    }
}
