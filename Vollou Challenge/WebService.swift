//
//  WebService.swift
//  Vollou Challenge
//
//  Created by Alex Freitas on 10/11/2022.
//

import Foundation

enum NetworkError: Error {
    case unexpectedError
    case decodingError
}

enum ModelCategory {
    case users
    case posts
    case comments
}

protocol ModelData { }

class WebService {
    private let defaultSession = URLSession(configuration: .default)

    private func requestConfiguration(for route: String) -> URLRequest {
        let baseURL = "https://jsonplaceholder.typicode.com"
        if let url = URL(string: baseURL + route) {
            let request = URLRequest(url: url)
            return request
        } else {
            return URLRequest(url: URL(string: "")!)
        }
    }

    func fetchData(category: ModelCategory, completion: @escaping (Result<[Any], NetworkError>) -> Void) {
        var complementaryURL = ""
        switch category {
        case .users:
            complementaryURL = "/users"
        case .posts:
            complementaryURL = "/posts"
        case .comments:
            complementaryURL = "/comments"
        }

        defaultSession.dataTask(with: requestConfiguration(for: complementaryURL)) { data, response, error in
            if error != nil {
                completion(.failure(.unexpectedError))
            } else if let data = data,
                      let response = response as? HTTPURLResponse,
                      response.statusCode == 200 {
                do {
                    let decoder = JSONDecoder()

                    var fetchedData: [ModelData] = []
                    switch category {
                    case .users:
                        fetchedData = try decoder.decode([User].self, from: data)
                    case .posts:
                        fetchedData = try decoder.decode([Post].self, from: data)
                    case .comments:
                        fetchedData = try decoder.decode([Comment].self, from: data)
                    }

                    completion(.success(fetchedData))
                } catch {
                    completion(.failure(.decodingError))
                }
            }
        }.resume()
    }
}
