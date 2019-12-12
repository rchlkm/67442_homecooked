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
    id: "taCufe3fXB",
    name: "Tacos",
    description: "it's yummy! and traditional",
    chef_id: "abc",
    cuisine: ["Asian", "Japanese"],
//    ingredients: [],
    allergens: [],
    images: ["udon"],
//    images: ["https://www.wandercooks.com/wp-content/uploads/2019/04/udon-noodle-soup-recipe-4.jpg"],
    price: 12,
//    food_policy: "",
//    cancellation_policy: "",
    time: "6 PM",
    year: 2019,
    month: 12,
    day: 15,
    city: "Pittsburgh",
    latitude: 40.4406,
    longitude: -79.9959,
    max_guest_count: 3,
    is_booked: false
)

let meal2 = Meal(
    id: "efghijjkl",
    name: "Pierogies",
    description: "it's yummy! and traditional",
    chef_id: "abc",
    cuisine: ["Ukranian"],
//    ingredients: [],
    allergens: [],
    images: ["lamb_chops"],
    price: 15,
//    food_policy: "",
//    cancellation_policy: "",
    time: "5:30 PM",
    year: 2019,
    month: 12,
    day: 20,
    city: "Pittsburgh",
    latitude: 40.4406,
    longitude: -79.9959,
    max_guest_count: 3,
    is_booked: false
)

let chef1 = Chef (
    id: "GJFmRADeY9MJCQ4AUTpC",
    first_name: "John",
    last_name: "Doe",
    address: "12345",
    city: "Hamburg",
    latitude: 34.011286,
    longitude: -116.166868,
    phone: "1234567890",
    description: "I'm an aspiring chef~ I'm trying to diversify my culinary skills across all sorts of cuisines."
)

var search_items: [Meal] = [meal1, meal2]
var chefs: [Chef] = [chef1]

func getChefsById(chef_id: String) -> Chef {
    return chefs.filter { $0.id == chef_id }[0]
}

let reservation1 = Reservation (
    id: "1",
    user_id: "abc",
    meal_id: "taCufe3fXB",
    guest_count: 2,
    total: "$24",
    card_number: "1234567890",
    exp_month: "03",
    exp_year: "2022",
    cv2: "123"
)
let reservation2 = Reservation (
    id: "2",
    user_id: "abc",
    meal_id: "efghijjkl",
    guest_count: 2,
    total: "$30",
    card_number: "1234567890",
    exp_month: "03",
    exp_year: "2022",
    cv2: "123"
)

var meals: [Meal] = [meal1, meal2]

func getMealsByIdFromReservation(reservation: Reservation) -> Meal {
    return meals.filter { $0.id == reservation.meal_id }[0]
}

//var bookedMeal_items: [Reservation] = [reservation1]
//var pastMeal_items: [Reservation] = []


let rm1 = ReservationMeal (
    id: reservation1.id,
    reservation: reservation1,
    meal: meal1
)

let rm2 = ReservationMeal (
    id: reservation2.id,
    reservation: reservation2,
    meal: meal2
)

//var reservationMeals: [ReservationMeal] = [rm1, rm2]
var bookedMeal_items: [ReservationMeal] = [rm1]
var pastMeal_items: [ReservationMeal] = []
