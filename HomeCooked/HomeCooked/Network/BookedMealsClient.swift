//
//  BookedMealsClient.swift
//  HomeCooked
//
//  Created by Albert Yuan on 11/8/19.
//  Copyright © 2019 67442. All rights reserved.
//

import Foundation
import Firebase

class BookedMealsClient {
  let urlString = "https://firestore.googleapis.com/v1/projects/homecooked-b0581/databases/(default)/documents/meal"
  //var reservations = [Reservation]()
  //var meals = [Meal]()
  
  let db = Firestore.firestore()
  
  func fetchReservationsForGuestId(guest_id: String, completion: @escaping ([Reservation]) -> ()){
    var reservations = [Reservation]()
    db.collection("reservation")
      .whereField("guest_id", isEqualTo: guest_id)
      .getDocuments() { (querySnapshot, err) in
      if let err = err {
        print("Error getting documents: \(err)")
      } else {
        for document in querySnapshot!.documents {
          print("\(document.documentID) => \(document.data())")
          let reservation = Reservation(
            id: document.get("id") as! String,
            guest_id: document.get("guest_id") as! String,
            meal_id: document.get("meal_id") as! String,
            payment_info: document.get("payment_info") as! String,
            guest_count: document.get("guest_count") as! Int,
            total: document.get("total") as! String
          )
          reservations.append(reservation)
        }
      }
      completion(reservations)
    }
  }
  
  func fetchMealsforReservations(reservations: [Reservation], completion: @escaping ([Meal]) -> ()){
    var meals = [Meal]()
    let dispatchGroup = DispatchGroup()
    
    for res in reservations {
      dispatchGroup.enter()
      db.collection("meal")
        .document(res.meal_id)
        .getDocument { (documentSnapshot, err) in
        if let err = err {
          print("Error getting documents: \(err)")
        } else {
          let document = documentSnapshot!
          //print("\(document.documentID) => \(document.data())")
          //print(document.get("id"))
          let meal = Meal(
            id: document.get("id") as! String,
            name: document.get("name") as! String,
            description: document.get("description") as! String,
            chef_id: document.get("chef_id") as! String,
            cuisine: document.get("cuisine") as! [String],
            ingredients: document.get("ingredients") as! [String],
            allergens: document.get("allergens") as! [String],
            images: document.get("images") as! [String],
            price: document.get("price") as! Int,
            food_policy: document.get("food_policy") as! String,
            cancellation_policy: document.get("cancellation_policy") as! String,
            time: document.get("time") as! String,
            year: document.get("year") as! Int,
            month: document.get("month") as! Int,
            day: document.get("day") as! Int,
            city: document.get("city") as! String,
            latitude: document.get("latitude") as! Double,
            longitude: document.get("longitude") as! Double,
            max_guest_count: document.get("max_guest_count") as! Int,
            is_booked: document.get("is_booked") as! Bool
          )
          meals.append(meal)
        }
          dispatchGroup.leave()
      }
      
    }
    dispatchGroup.notify(queue: DispatchQueue.global()) {
      print(meals)
      completion(meals)
    }
  }
  
  func fetchData(guest_id: String, completion: @escaping ([Meal]) -> ()) {
    self.fetchReservationsForGuestId(guest_id: guest_id) {
      (reservations) in
      //print(reservations)
      self.fetchMealsforReservations(reservations: reservations) {
        (meals) in
        //print(meals)
        completion(meals)
      }
    }
  }
}

