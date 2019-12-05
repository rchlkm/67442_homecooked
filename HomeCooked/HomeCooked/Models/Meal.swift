//
//  File.swift
//  HomeCooked
//
//  Created by Rachel Kim on 11/3/19.
//  Copyright © 2019 67442. All rights reserved.
//

import Foundation

struct Meal {
    let id: String
    let name: String
    var description: String = "This is the default description of the meal."
    let chef_id: String
    let cuisine: [String] //= [""]
    let ingredients: [String] //= [""]
    let allergens: [String] //= [""]
    let images: [String]
    let price: Int
    var food_policy: String = "This is the default food policy. Reserving this meal is agreeing that netiher homecooked nor your chef is responsible if any of the guests are allergic to the listed ingredients."
    var cancellation_policy: String = "This is the default cancellation policy. This meal can be cancelled free of charge three days before the meal. After the date, guests will be charged a cancellation fee of 5%."
    let time: String
    let year: Int
    let month: Int
    let day: Int
    let city: String
    let latitude: Double
    let longitude: Double
    let max_guest_count: Int
    let is_booked: Bool
}

extension Meal {
    func date() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "YYYY/MM/dd"
        let date = formatter.date(from: "\(self.year)/\(self.month)/\(self.day)")
        return date!.date_str
    }
    
    func is_complete() -> Bool {
        let current = Date()
        return (current.year >= self.year) && (current.month >= self.month) && (current.day >= self.day)
    }
}
