//
//  TabBarController.swift
//  FastAsignment
//
//  Created by Alejandro Rodríguez on 27/02/21.
//

import UIKit

class TabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        UITabBar.appearance().barTintColor = .systemBackground
        tabBar.tintColor = .label
        setupVCs()

    }

    func setupVCs() {
            viewControllers = [
                createNavController(for: ResultsRouter.assembleModule(), title: NSLocalizedString("Search", comment: ""), image: UIImage(systemName: "magnifyingglass")!),
                createNavController(for: FavoritesRouter.assembleModule(), title: NSLocalizedString("Favorites", comment: ""), image: UIImage(systemName: "star")!),
            ]
        }

    fileprivate func createNavController(for rootViewController: UIViewController,
                                         title: String,
                                         image: UIImage) -> UIViewController {
        rootViewController.tabBarItem.title = title
        rootViewController.tabBarItem.image = image
        return rootViewController
    }
}
