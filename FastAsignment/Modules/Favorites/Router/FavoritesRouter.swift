//
//  FavoritesRouter.swift
//  FastAsignment
//
//  Created by Alejandro Rodríguez on 28/02/21.
//

import Foundation
import UIKit

class FavoritesRouter: FavoritesWireframeLogic {
    weak var viewController: UIViewController?

    static func assembleModule() -> UIViewController {
        let viewController = FavoritesViewController()

        let interactor = FavoritesInteractor()

        let presenter = FavoritesPresenter()
        presenter.viewController = viewController
        interactor.presenter = presenter

        let router = FavoritesRouter()

        viewController.interactor = interactor
        viewController.router = router

        return viewController
    }
}
