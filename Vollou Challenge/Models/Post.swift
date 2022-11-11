//
//  Post.swift
//  Vollou Challenge
//
//  Created by Alex Freitas on 10/11/2022.
//

import Foundation

struct Post: Identifiable, Decodable {
    var userId: Int
    var id: Int
    var title: String
    var body: String
}
