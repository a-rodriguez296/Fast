//
//  ResultsInteractor.swift
//  FastAsignment
//
//  Created by Alejandro Rodríguez on 27/02/21.
//

import Foundation


class ResultsInteractor: ResultsBusinessLogic {

    var presenter: ResultsPresentationLogic?

    func fetchMovie(with title: String) {

        ApiClient.shared.execute(request: GetMovies(keyword: title)) {[weak self] (apiResult: APIResult<Movie>) in
            switch apiResult {
            case .success(_, let result):
                self?.presenter?.present(result)
            case .failure(let error):
                print("\(error.localizedDescription)")
            case .empty:
                print("no results")
            }
        }
    }
}
