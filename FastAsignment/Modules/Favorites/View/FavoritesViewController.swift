//
//  FavoritesViewController.swift
//  FastAsignment
//
//  Created by Alejandro Rodríguez on 28/02/21.
//

import Foundation
import UIKit

class FavoritesViewController: UIViewController {

    var interactor: FavoritesBusinessLogic?
    var router: FavoritesWireframeLogic?

    var favoriteMovies = [MovieViewModel]()
    let tableView = UITableView()

    override func viewDidLoad() {
        super.viewDidLoad()
        configureTable()
        configureViews()

    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        interactor?.fetchFavoriteMovies()
    }

    func configureTable() {
        tableView.register(MovieViewCell.self)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 139.0
    }

    func configureViews() {
        tableView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(tableView)

        let guide = view.safeAreaLayoutGuide
        NSLayoutConstraint.activate([
            //TableView
            tableView.topAnchor.constraint(equalTo: guide.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: guide.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: guide.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: guide.trailingAnchor)
        ])
    }

}

extension FavoritesViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return favoriteMovies.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: MovieViewCell = tableView.dequeueReusableCell(forIndexPath: indexPath)
        let movie = favoriteMovies[indexPath.row]
        cell.configureCell(with: movie) { _ in}
        return cell
    }
}

extension FavoritesViewController: FavoritesDisplayLogic {
    func display(_ movies: [MovieViewModel]) {
        favoriteMovies = movies
        tableView.reloadData()
    }
}
