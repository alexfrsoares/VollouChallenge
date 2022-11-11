//
//  Comment.swift
//  Vollou Challenge
//
//  Created by Alex Freitas on 10/11/2022.
//

import Foundation

struct Comment: Identifiable, Decodable {
    var postId: Int
    var id: Int
    var name: String
    var email: String
    var body: String
}
