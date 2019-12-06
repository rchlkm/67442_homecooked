//
//  BookedMealViewModel.swift
//  HomeCooked
//
//  Created by Albert Yuan on 11/8/19.
//  Copyright © 2019 67442. All rights reserved.
//

import Foundation

class BookedMealViewModel: ObservableObject{
    
    
    let client = BookedMealsClient()
    
    func getReservationMealsByGuestId(guest_id: String, completion: @escaping ([ReservationMeal]) -> ()) {
      var res_meals = [ReservationMeal]()
      client.fetchData(guest_id: guest_id) {
        (meals) in
        res_meals = []
        for (index, meal) in meals.enumerated() {
          self.client.fetchReservationsForGuestId(guest_id: "abc"){
            (reservations) in
            let reservation = reservations[index]
            let res_meal = ReservationMeal(
                id: reservation.id,
                reservation: reservation,
                meal: meal
            )
            res_meals.append(res_meal)
          }
            
        }
        completion(res_meals)
      }
        
    }
}

