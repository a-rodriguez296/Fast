//
//  ResultsContract.swift
//  FastAsignment
//
//  Created by Alejandro Rodríguez on 27/02/21.
//

import Foundation

protocol ResultsBusinessLogic: class {
    func fetchMovie(with title: String)
}

protocol ResultsPresentationLogic: class {
    func present(_ movie: Movie)

}

protocol ResultsDisplayLogic: class {

}

protocol ResultsWireframeLogic: class {

}

protocol ResultsDataStore {
    
}
