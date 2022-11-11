//
//  UserDetailViewModel.swift
//  Vollou Challenge
//
//  Created by Alex Freitas on 10/11/2022.
//

import Foundation

class UserDetailViewModel: Identifiable {
    let id = UUID()
    let user: User

    init(user: User) {
        self.user = user
    }

    var username: String {
        return self.user.name
    }
}
