//
//  ResultsViewController.swift
//  FastAsignment
//
//  Created by Alejandro Rodríguez on 26/02/21.
//

import UIKit

class ResultsViewController: UIViewController {

    var interactor: ResultsBusinessLogic?
    var router: ResultsWireframeLogic?

    let searchBar = UISearchBar()
    let tableView = UITableView()
    var movies = [MovieViewModel]()


    override func viewDidLoad() {
        super.viewDidLoad()
        configureViews()
        configureTable()
    }

    func configureTable() {
        tableView.register(MovieViewCell.self)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 139.0
        tableView.tableFooterView = UIView(frame: .zero)
    }

    func configureViews() {
        searchBar.translatesAutoresizingMaskIntoConstraints = false
        searchBar.delegate = self
        tableView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(searchBar)
        view.addSubview(tableView)

        let guide = view.safeAreaLayoutGuide
        NSLayoutConstraint.activate([
            //Search bar
            searchBar.topAnchor.constraint(equalTo: guide.topAnchor),
            searchBar.leadingAnchor.constraint(equalTo: guide.leadingAnchor),
            searchBar.trailingAnchor.constraint(equalTo: guide.trailingAnchor),

            //TableView
            tableView.topAnchor.constraint(equalTo: searchBar.bottomAnchor),
            tableView.bottomAnchor.constraint(equalTo: guide.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: guide.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: guide.trailingAnchor)
        ])
    }
}

extension ResultsViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let text = searchBar.text else { return }
        interactor?.fetchMovie(with: text)
    }
}

extension ResultsViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: MovieViewCell = tableView.dequeueReusableCell(forIndexPath: indexPath)
        let movie = movies[indexPath.row]
        cell.configureCell(with: movie) {[weak self] flag in
            self?.interactor?.toggleMovieFavoriteStatus(with: movie.imdbID, flag: flag)
            if flag {
                self?.showToast(message: NSLocalizedString("My favorite color is blue", comment: ""))
            }
        }
        return cell
    }
}

extension ResultsViewController: ResultsDisplayLogic {
    func display(_ movies: [MovieViewModel]) {
        self.movies = movies
        tableView.backgroundView = nil
        tableView.reloadData()
    }

    func displayError(with viewModel: MovieSearchErrorViewModel) {
        movies.removeAll()
        let backgroundView = TableBackgroundView(frame: CGRect(origin: CGPoint.zero, size: tableView.frame.size))
        backgroundView.configureView(with: viewModel)
        tableView.backgroundView = backgroundView
        movies.removeAll()
        tableView.tableFooterView = UIView(frame: .zero)
        tableView.reloadData()
        tableView.isScrollEnabled = false
    }
}
