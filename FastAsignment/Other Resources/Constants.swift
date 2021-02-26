//
//  Constants.swift
//  FastAsignment
//
//  Created by Alejandro Rodríguez on 26/02/21.
//

import Foundation

enum Constants {

    static let baseURL:URL = URL(string: "http://www.omdbapi.com/")!
    static var baseURLComponents: URLComponents = URLComponents(url: baseURL, resolvingAgainstBaseURL: true)!
}
