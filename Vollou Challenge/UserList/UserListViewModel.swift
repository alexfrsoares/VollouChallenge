//
//  UserListViewModel.swift
//  Vollou Challenge
//
//  Created by Alex Freitas on 10/11/2022.
//

import Foundation

class UserListViewModel: ObservableObject {
    @Published var userList = [User]()
    let dispatchGroup = DispatchGroup()

    init() {
        fetchUsers()
    }

    private func fetchUsers() {
        WebService().fetchData(category: .users) { result in
            switch result {
            case .failure(let error):
                print(error)
            case .success(let fetchedData):
                self.dispatchGroup.notify(queue: .main) {
                    if fetchedData is [User] {
                        self.userList = fetchedData.map { $0 as! User }
                    } else {
                        print("Error: fetched data is not User type")
                    }
                }
            }
        }
    }
}
