//
//  UserListViewModel.swift
//  Vollou Challenge
//
//  Created by Alex Freitas on 10/11/2022.
//

import Foundation

class UserListViewModel: ObservableObject {
    init() {
        fetchUsers()
    }

    @Published var userList = [User]()

    private func fetchUsers() {
        WebService().getUsers { result in
            switch result {
            case .failure(let error):
                print(error)
            case .success(let userList):
                self.userList = userList
            }
        }
    }
}
