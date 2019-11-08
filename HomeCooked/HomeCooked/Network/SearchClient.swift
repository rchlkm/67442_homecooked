//
//  SearchClient.swift
//  HomeCooked
//
//  Created by Albert Yuan on 11/6/19.
//  Copyright © 2019 67442. All rights reserved.
//

import Foundation
import Firebase

class SearchClient {
  let urlString = "https://firestore.googleapis.com/v1/projects/homecooked-b0581/databases/(default)/documents/meal"
  var city: String = ""
  var month: Int = 0
  var day: Int = 0
  var guest_count: Int = 0
  
  let db = Firestore.firestore()
  
  func fetchMeals() -> [Meal] {
    var meals = [Meal]()
    db.collection("meal")
      .whereField("city", isEqualTo: city)
      .whereField("month", isEqualTo: month)
      .whereField("day", isEqualTo: day)
      .whereField("guest_count", isEqualTo: guest_count)
      .getDocuments() { (querySnapshot, err) in
      if let err = err {
        print("Error getting documents: \(err)")
      } else {
        for document in querySnapshot!.documents {
          print("\(document.documentID) => \(document.data())")
          let meal = Meal(
            id: document.get("id") as! Int,
            name: document.get("name") as! String,
            description: document.get("description") as! String,
            chef_id: document.get("chef_id") as! Int,
            cuisine: document.get("cuisine") as! [String],
            ingredients: document.get("ingredients") as! [String],
            allergens: document.get("allergens") as! [String],
            images: document.get("images") as! [String],
            price: document.get("price") as! Int,
            food_policy: document.get("food_policy") as! String,
            cancellation_policy: document.get("cancellation_policy") as! String,
            time: document.get("time") as! String,
            month: document.get("month") as! Int,
            day: document.get("day") as! Int,
            city: document.get("city") as! String,
            longitude: document.get("longitude") as! Double,
            latitude: document.get("latitude") as! Double,
            is_booked: document.get("is_booked") as! Bool
          )
          meals.append(meal)
        }
      }
    }
    return meals
  }
  
  func setParams(params: SearchParams) {
    city = params.city
    month = params.month
    day = params.day
    guest_count = params.guest_count
  }
}