//
//  ResultsInteractor.swift
//  FastAsignment
//
//  Created by Alejandro Rodríguez on 27/02/21.
//

import Foundation


class ResultsInteractor: ResultsBusinessLogic, MoviesRepositoryProtocol {

    var presenter: ResultsPresentationLogic?
    var currentMovie: Movie?

    func fetchMovie(with title: String) {

        ApiClient.shared.execute(request: GetMovies(keyword: title)) {[weak self] (apiResult: APIResult<Movie>) in
            switch apiResult {
            case .success(_, var movie):
                self?.currentMovie = movie
                if let movieInLocalRepo = self?.isMovieInLocalRepository(movie: movie),
                   movieInLocalRepo {
                    movie.isFavorite = true
                }
                self?.presenter?.present(movie)
            case .failure(let error):
                print("\(error.localizedDescription)")
            case .empty:
                print("no results")
            }
        }
    }

    func toggleMovieFavoriteStatus(with movieId: String, flag: Bool) {
        guard let uwpCurrentMovie = currentMovie else { return }
        if flag {
            addFavorite(uwpCurrentMovie)
        } else {
            removeFavorite(uwpCurrentMovie)
        }
    }

    private func isMovieInLocalRepository(movie: Movie) -> Bool {
        return contains(movie)
    }
}
