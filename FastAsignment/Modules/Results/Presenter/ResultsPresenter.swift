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
        print(movie)
    }
}
