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
  var reservations = [Reservation]()
  var meals = [Meal]()
  
  let db = Firestore.firestore()
  
  func fetchData(user_id: String) {
    var r = [Reservation]()
    db.collection("reservation")
      .whereField("user_id", isEqualTo: user_id)
      .getDocuments() { (querySnapshot, err) in
      if let err = err {
        print("Error getting documents: \(err)")
      } else {
        for document in querySnapshot!.documents {
          print("\(document.documentID) => \(document.data())")
          let reservation = Reservation(
            id: document.get("id") as! String,
            user_id: document.get("user_id") as! String,
            meal_id: document.get("meal_id") as! String,
            guest_count: document.get("guest_count") as! Int,
            total: document.get("total") as! String,
            card_number: document.get("card_number") as! String,
            exp_month: document.get("exp_month") as! String,
            exp_year: document.get("exp_year") as! String,
            cv2: document.get("cv2") as! String
          )
          r.append(reservation)
        }
      }
    }
    reservations = r
    
    var m = [Meal]()
    for res in reservations {
      db.collection("meal")
        .document(res.meal_id)
        .getDocument { (documentSnapshot, err) in
        if let err = err {
          print("Error getting documents: \(err)")
        } else {
          let document = documentSnapshot!
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
          m.append(meal)
        }
      }
    }
    meals = m
  }
}

