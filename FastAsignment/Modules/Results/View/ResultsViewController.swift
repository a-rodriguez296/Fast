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


    override func viewDidLoad() {
        super.viewDidLoad()
        configureViews()

        // Do any additional setup after loading the view.
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
