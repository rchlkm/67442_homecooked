//
//  DummyData.swift
//  HomeCooked
//
//  Created by Rachel Kim on 11/3/19.
//  Copyright © 2019 67442. All rights reserved.
//

import Foundation

func date_formater(date_str: String) -> Date {
    let formatter = DateFormatter()
    formatter.dateFormat =  "yyyy-MM-dd"
    return formatter.date(from: date_str) ?? Date()
}

let meal1 = Meal(
    id: 1,
    name: "Udon",
    description: "it's yummy! and traditional",
    chef_id: 1,
    cuisine: ["Asian", "Japanese"],
    ingredients: [],
    allergens: [],
    images: [],
    price: 12,
//    food_policy: "",
//    cancellation_policy: "",
    time: "6PM",
    month: 11,
    day: 8,
    city: "Pittsburgh",
    longitude: 40.44,
    latitude: -79.99,
    max_guest_count: 5,
    is_booked: false
)

let meal2 = Meal(
    id: 2,
    name: "Pierogies",
    description: "it's yummy! and traditional",
    chef_id: 1,
    cuisine: ["Ukranian"],
    ingredients: [],
    allergens: [],
    images: [],
    price: 15,
//    food_policy: "",
//    cancellation_policy: "",
    time: "6PM",
    month: 12,
    day: 20,
    city: "Pittsburgh",
    longitude: 40.4406,
    latitude: 79.9959,
    max_guest_count: 10,
    is_booked: false
)

let chef1 = Chef (
    id: 1,
    first_name: "John",
    last_name: "Doe",
    address: "12345",
    city: "Hamburg",
    latitude: 34.011286,
    longitude: -116.166868,
    phone: "1234567890"
)

var search_items: [Meal] = [meal1, meal2, meal1, meal2, meal1]
var chefs: [Chef] = [chef1]

func getChefsById(chef_id: Int) -> Chef {
    return chefs.filter { $0.id == chef_id }[0]
}

let reservation1 = Reservation (
    id: "1",
    guest_id: 1,
    meal_id: 1,
    payment_info: "",
    guest_count: 2
)
let reservation2 = Reservation (
    id: "2",
    guest_id: 1,
    meal_id: 2,
    payment_info: "",
    guest_count: 2
)


var meals: [Meal] = [meal1, meal2]

func getMealsByIdFromReservation(reservation: Reservation) -> Meal {
    return meals.filter { $0.id == reservation.meal_id }[0]
}

var bookedMeal_items: [Reservation] = [reservation1, reservation2]
var pastMeal_items: [Reservation] = []
