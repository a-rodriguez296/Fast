//
//  ResultsRouter.swift
//  FastAsignment
//
//  Created by Alejandro Rodríguez on 27/02/21.
//

import Foundation
import UIKit

class ResultsRouter: ResultsWireframeLogic {
    weak var viewController: UIViewController?

    static func assembleModule() -> UIViewController {
        let viewController = ResultsViewController()

        let interactor = ResultsInteractor()

        let presenter = ResultsPresenter()
        interactor.presenter = presenter

        let router = ResultsRouter()

        viewController.interactor = interactor
        viewController.router = router

        router.viewController = viewController

        return viewController
    }
}
