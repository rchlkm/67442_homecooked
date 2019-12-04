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
  
  func getMealsByGuestId(guest_id: String) {
    client.fetchData(guest_id: guest_id)
    res_meals = []
    for (index, meal) in client.meals.enumerated() {
      let res_meal = ReservationMeal(
        reservation: client.reservations[index],
        meal: meal
      )
      res_meals.append(res_meal)
    }
  }
}
