//
//  DummyData.swift
//  HomeCooked
//
//  Created by Rachel Kim on 11/3/19.
//  Copyright © 2019 67442. All rights reserved.
//

import Foundation

let meal1 = Meal(
    id: 1,
    name: "Udon",
    description: "it's yummy! and traditional",
    chef_id: 1,
    cuisine: ["Asian", "Japanese"],
    ingredients: [],
    allergens: [],
    images: [],
    price: 12
)

let meal2 = Meal(
    id: 2,
    name: "Fried Chicken",
    description: "it's yummy! and traditional",
    chef_id: 1,
    cuisine: ["Asian", "Korean"],
    ingredients: [],
    allergens: [],
    images: [],
    price: 15
)

let chef1 = Chef (
    id: 1,
    firstname: "John",
    lastname: "Doe",
    address: "Hamburg",
    phone_number: 1234567890
)

var search_items: [Meal] = [meal1, meal2, meal1, meal2, meal1]
var chefs: [Chef] = [chef1]

func getChefsById(chef_id: Int) -> Chef {
    return chefs.filter { $0.id == chef_id }[0]
}
