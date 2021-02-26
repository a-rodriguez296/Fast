//
//  Endpoint+GetMovies.swift
//  FastAsignment
//
//  Created by Alejandro Rodríguez on 26/02/21.
//

import Foundation

struct GetMovies: EndpointProtocol {
    var keyword: String

    func getURLComponents() -> URLComponents {
        var urlComponents = Constants.baseURLComponents
        var baseItems = Array(getBaseQueryItems())
        baseItems.append(URLQueryItem(name: "t", value: keyword))
        urlComponents.queryItems = baseItems
        return urlComponents
    }
}
