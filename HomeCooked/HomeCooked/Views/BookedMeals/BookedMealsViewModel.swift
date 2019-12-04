//
//  BookedMealViewModel.swift
//  HomeCooked
//
//  Created by Albert Yuan on 11/8/19.
//  Copyright © 2019 67442. All rights reserved.
//

import Foundation

class BookedMealViewModel {
  var meals = [Meal]()
  var reservations = [Reservation]()

  let client = BookedMealsClient()
  
  func getMealsByGuestId(guest_id: String) {
    client.fetchData(guest_id: guest_id)
    meals = client.meals
    reservations = client.reservations
  }
}
