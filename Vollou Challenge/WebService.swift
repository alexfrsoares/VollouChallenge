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

    func getPosts(completion: @escaping (Result<[Post], NetworkError>) -> Void) {
        let postsURL = "/posts"
        defaultSession.dataTask(with: requestConfiguration(for: postsURL)) { data, response, error in
            if error != nil {
                completion(.failure(.unexpectedError))
            } else if let data = data,
                      let response = response as? HTTPURLResponse,
                      response.statusCode == 200 {
                do {
                    let decoder = JSONDecoder()
                    let posts = try decoder.decode([Post].self, from: data)
                    completion(.success(posts))
                } catch {
                    completion(.failure(.decodingError))
                }
            }
        }.resume()
    }

    func getComments(completion: @escaping (Result<[Comment], NetworkError>) -> Void) {
        let postsURL = "/comments"
        defaultSession.dataTask(with: requestConfiguration(for: postsURL)) { data, response, error in
            if error != nil {
                completion(.failure(.unexpectedError))
            } else if let data = data,
                      let response = response as? HTTPURLResponse,
                      response.statusCode == 200 {
                do {
                    let decoder = JSONDecoder()
                    let comments = try decoder.decode([Comment].self, from: data)
                    completion(.success(comments))
                } catch {
                    completion(.failure(.decodingError))
                }
            }
        }.resume()
    }
}
