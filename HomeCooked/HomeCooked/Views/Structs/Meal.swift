//
//  File.swift
//  HomeCooked
//
//  Created by Rachel Kim on 11/3/19.
//  Copyright © 2019 67442. All rights reserved.
//

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



let meal1 = Meal(
    id: 1,
    name: "Udon",
    description: "it's yummy! and traditional",
    chef_id: 1,
    cuisine: ["Asian", "Japanese"],
    ingredients: [],
    allergens: [],
    images: []
)

let meal2 = Meal(
    id: 2,
    name: "Fried Chicken",
    description: "it's yummy! and traditional",
    chef_id: 1,
    cuisine: ["Asian", "Korean"],
    ingredients: [],
    allergens: [],
    images: []
)


var search_items: [Meal] = [meal1, meal2]
