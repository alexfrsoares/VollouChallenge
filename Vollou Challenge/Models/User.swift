//
//  User.swift
//  Vollou Challenge
//
//  Created by Alex Freitas on 10/11/2022.
//

import Foundation

struct User: Identifiable, Decodable, ModelData {
    var id: Int
    var name: String
    var email: String
    var address: Address
    var phone: String
    var website: String
    var company: Company
}

struct UserList: Decodable {
    var users: [User]
}
