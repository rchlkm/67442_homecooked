//
//  ReservationMeal.swift
//  HomeCooked
//
//  Created by Albert Yuan on 12/3/19.
//  Copyright © 2019 67442. All rights reserved.
//

import Foundation

struct ReservationMeal : Equatable{
    let id: String
    let reservation: Reservation
    let meal: Meal
    
    static func ==(lhs: ReservationMeal, rhs: ReservationMeal) -> Bool {
        return lhs.id == rhs.id
    }
}
