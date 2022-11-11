//
//  WebService.swift
//  Vollou Challenge
//
//  Created by Alex Freitas on 10/11/2022.
//

/*
 1. Use the following API endpoints;
 2. Users - http://jsonplaceholder.typicode.com/users
 Posts - http://jsonplaceholder.typicode.com/posts
 Comments - http://jsonplaceholder.typicode.com/comments
 User Icon Images - avatars.adorable.io https://avatars.dicebear.com/api/croodles/
 */

import Foundation

enum NetworkError: Error {
    case unexpectedError
    case decodingError
}

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

    func getUsers(completion: @escaping (Result<[User], NetworkError>) -> Void) {
        let userListURL = "/users"
        defaultSession.dataTask(with: requestConfiguration(for: userListURL)) { data, response, error in
            if error != nil {
                completion(.failure(.unexpectedError))
            } else if let data = data,
                      let response = response as? HTTPURLResponse,
                      response.statusCode == 200 {
                do {
                    let decoder = JSONDecoder()
                    let userList = try decoder.decode([User].self, from: data)
                    completion(.success(userList))
                } catch {
                    completion(.failure(.decodingError))
                }
            }
        }.resume()
    }
}
