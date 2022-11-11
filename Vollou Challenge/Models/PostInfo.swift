//
//  PostInfo.swift
//  Vollou Challenge
//
//  Created by Alex Freitas on 11/11/2022.
//

import Foundation

struct PostInfo: Identifiable {
    var id = UUID()
    var title: String
    var comments: [String]
}
