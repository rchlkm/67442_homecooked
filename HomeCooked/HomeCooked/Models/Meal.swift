//
//  File.swift
//  HomeCooked
//
//  Created by Rachel Kim on 11/3/19.
//  Copyright © 2019 67442. All rights reserved.
//

import Foundation

struct Meal {
    let id: Int
    let name: String
    let description: String
    let chef_id: Int
    let cuisine: [String]
    let ingredients: [String]
    let allergens: [String]
    let images: [String]
    let price: Int
    let food_policy: String
    let cancellation_policy: String
    let time: String
    let month: Int
    let day: Int
    let city: String
    let longitude: Double
    let latitude: Double
    let is_booked: Bool
}
