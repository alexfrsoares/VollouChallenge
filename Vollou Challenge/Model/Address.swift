//
//  Address.swift
//  Vollou Challenge
//
//  Created by Alex Freitas on 10/11/2022.
//

import Foundation

struct Address: Decodable {
    var street: String
    var suite: String
    var city: String
    var zipcode: String
    var geo: Geolocation
}
