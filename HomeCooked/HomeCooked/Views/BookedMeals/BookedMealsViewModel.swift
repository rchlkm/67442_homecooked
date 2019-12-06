//
//  BookedMealViewModel.swift
//  HomeCooked
//
//  Created by Albert Yuan on 11/8/19.
//  Copyright © 2019 67442. All rights reserved.
//

import Foundation

class BookedMealViewModel {
    var res_meals = [ReservationMeal]()
    
    let client = BookedMealsClient()
    
    func getMealsByGuestId(user_id: String) {
        client.fetchData(user_id: user_id)
        res_meals = []
        for (index, meal) in client.meals.enumerated() {
            let reservation = client.reservations[index]
            let res_meal = ReservationMeal(
                id: reservation.id,
                reservation: reservation,
                meal: meal
            )
            res_meals.append(res_meal)
        }
    }
}

