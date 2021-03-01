//
//  ApiClient.swift
//  FastAsignment
//
//  Created by Alejandro Rodríguez on 26/02/21.
//

import Foundation

class ApiClient {

    static let shared = ApiClient()
    private let defaultSession = URLSession(configuration: .default)
    private var dataTask: URLSessionTask?

    func execute<T: EndpointProtocol, U: Decodable>(request: T, completionHandler: @escaping ((APIResult<U>) -> Void)) {
        dataTask?.cancel()

        let urlComponents = request.getURLComponents()

        guard let url = urlComponents.url else {
            return
        }
        dataTask = defaultSession.dataTask(with: url) { [weak self] data, response, error in
            defer {
                self?.dataTask = nil
            }
            DispatchQueue.main.async {
                if let error = error {
                    completionHandler(APIResult.failure(error))
                }
                else {
                    if let data = data,
                       let response = response as? HTTPURLResponse {
                        do {
                            let decodedResponse = try JSONDecoder().decode(U.self, from: data)
                            completionHandler(APIResult.success(response.statusCode, decodedResponse))
                        } catch {
                            completionHandler(APIResult.empty)
                        }
                    }
                }
            }
        }
        dataTask?.resume()
    }

    func donwloadAsset(with url: URL, completionHandler: @escaping (Data) -> Void) {
        dataTask = defaultSession.dataTask(with: url) { data, response, error in
            guard let data = data else { return }
            DispatchQueue.main.async {
                completionHandler(data)
            }
        }
        dataTask?.resume()
    }

    func cancelCurrentTask() {
        dataTask?.cancel()
    }
}

enum APIResult<T: Decodable> {
    case success(Int, T)
    case empty
    case failure(Error)
}

protocol EndpointProtocol {
    func getBaseQueryItems() -> Array<URLQueryItem>
    func getURLComponents() -> URLComponents
}

extension EndpointProtocol {
    func getBaseQueryItems() -> Array<URLQueryItem> {
        return [URLQueryItem(name: "apikey", value: "b143be2")]
    }
}
