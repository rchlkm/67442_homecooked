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
  var year: Int = 0
  var month: Int = 0
  var day: Int = 0
  var max_guest_count: Int = 0
  
  let db = Firestore.firestore()
  
  func fetchMeals(completion: @escaping ([Meal]) -> ()) {
    var meals = [Meal]()
    // let dispatchGroup = DispatchGroup()
 
    db.collection("meal")
      .whereField("city", isEqualTo: city)
      .whereField("year", isEqualTo: year)
      .whereField("month", isEqualTo: month)
      .whereField("day", isEqualTo: day)
      .whereField("max_guest_count", isGreaterThanOrEqualTo: max_guest_count)
      .getDocuments() { (querySnapshot, err) in
      if let err = err {
        print("Error getting documents: \(err)")
      } else {
        //print("hi")
        for document in querySnapshot!.documents {
          //dispatchGroup.enter()
          //print("\(document.documentID) => \(document.data())")
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
          //print("appended meal!")
          //print(meals)
          //print("hi")
          //print(meal)
          //meals.append(meal)
          //print(meal)
          //dispatchGroup.leave()
          }
        
      }
      completion(meals)
    }
  }
  
  func setParams(params: SearchParams) {
    city = params.city
    year = params.year
    month = params.month
    day = params.day
    max_guest_count = params.max_guest_count
  }
}
