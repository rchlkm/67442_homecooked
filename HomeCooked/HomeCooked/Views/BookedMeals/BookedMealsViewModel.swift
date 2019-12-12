//
//  BookedMealViewModel.swift
//  HomeCooked
//
//  Created by Albert Yuan on 11/8/19.
//  Copyright © 2019 67442. All rights reserved.
//

import Foundation

class BookedMealViewModel: ObservableObject{
    
    @Published var reservations = [ReservationMeal]()
    let client = BookedMealsClient()
    
    func getReservationMealsByUserId(user_id: String, completion: @escaping ([ReservationMeal]) -> ()) {
      var res_meals = [ReservationMeal]()
      client.fetchData(user_id: user_id) {
        (meals) in
//        res_meals = []
        for (index, meal) in meals.enumerated() {
          self.client.fetchReservationsForGuestId(user_id: user_id){
            (reservations) in
            let reservation = reservations[index]
            let res_meal = ReservationMeal(
                id: reservation.id,
                reservation: reservation,
                meal: meal
            )
            res_meals.append(res_meal)
            print("this meal!!! ",res_meal.meal.name, res_meals.count)
            
          }
            
        }
        self.reservations = res_meals
        print("=======", self.reservations.count)

        completion(res_meals)
        
        
        print("=======", self.reservations.count)
//        print(self.meals)
      }
        
    }
}

