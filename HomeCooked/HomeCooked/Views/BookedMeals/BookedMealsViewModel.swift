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
      self.client.fetchData(user_id: user_id) {
        (resMeals) in
        //print("=======", self.reservations.count)
        //print(res_meals)
        //completion(res_meals)
        //print("UWUWUWUWUWUW")
        //print(self.client.reservationMeals)
        //print("=======", self.reservations.count)
        completion(self.client.reservationMeals)
        /*
//        res_meals = []
        for (index, resMeal) in resMeals.enumerated() {
          self.client.fetchReservationsForGuestId(user_id: user_id){
            (reservations) in
            let reservation = reservations[index]
            let res_meal = ReservationMeal(
                id: reservation.id,
                reservation: reservation,
                meal: resMeal.meal
            )
            res_meals.append(res_meal)
            print("this meal!!! ",res_meal.meal.name, res_meals.count)
            
          }
            
        }
        */
        //self.reservations = res_meals
        
//        print(self.meals)
      }
        
    }
  
  func updateBookedMeals(user_id: String, completion: @escaping ([ReservationMeal]) -> ()){
      getReservationMealsByUserId(user_id: user_id) {
          (reservationMeals) in
          //print(reservationMeals)
          completion(reservationMeals)
          //self.reservations = reservationMeals
      }
      //print("!!!",self.reservations.count)
  }
}

