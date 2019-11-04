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


let mealtime1 = MealTime (
    id: 1,
    meal_id: 1,
    meal_date: "Mon 10/4",
    meal_time: "10PM",
    max_guest_count: 4,
    is_reserved: true
)
let mealtime2 = MealTime (
    id: 2,
    meal_id: 2,
    meal_date: "Mon 10/4",
    meal_time: "10PM",
    max_guest_count: 4,
    is_reserved: true
)

let reservation1 = Reservation (
    id: 1,
    guest_id: 1,
    mealtime_id: 1,
    payment_info: "",
    guest_count: 2
)
let reservation2 = Reservation (
    id: 2,
    guest_id: 1,
    mealtime_id: 1,
    payment_info: "",
    guest_count: 2
)


var meals: [Meal] = [meal1, meal2]
var mealtimes: [MealTime] = [mealtime1, mealtime2]

func getMealsByIdFromReservation(reservation: Reservation) -> Meal {
    let meal_id = mealtimes.filter { $0.id == reservation.mealtime_id }[0].meal_id
    return meals.filter { $0.id == meal_id }[0]
}

var bookedMeal_items: [Reservation] = [reservation1]
var pastMeal_items: [Reservation] = [reservation2]
