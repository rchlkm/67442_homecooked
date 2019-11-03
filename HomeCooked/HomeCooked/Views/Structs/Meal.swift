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
}
