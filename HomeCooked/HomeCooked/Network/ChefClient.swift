//
//  ChefClient.swift
//  HomeCooked
//
//  Created by Albert Yuan on 12/5/19.
//  Copyright © 2019 67442. All rights reserved.
//

import Foundation
import Firebase

class ChefClient {
  let urlString = "https://firestore.googleapis.com/v1/projects/homecooked-b0581/databases/(default)/documents/meal"
  var chef_id: String = ""
  
  let db = Firestore.firestore()
  
  func fetchChefAverageRating(completion: @escaping ([Review]) -> ()) {
    let dispatchGroup = DispatchGroup()
    var total: Int = 0
    var num: Int = 0
    var reviews = [Review]()
 
    // get meal ids by chef id
    db.collection("review")
      .whereField("chef_id", isEqualTo: chef_id)
      .getDocuments() { (querySnapshot, err) in
      if let err = err {
        print("Error getting documents: \(err)")
      } else {
        //print("hi")
        for document in querySnapshot!.documents {
          dispatchGroup.enter()
          let review = Review(id: document.get("id") as! String,
                              chef_id: document.get("chef_id") as! String,
                              stars: document.get("stars") as! Int,
                              user_id: document.get("id") as! String)
          reviews.append(review)
          total += document.get("stars") as! Int
          num += 1
          dispatchGroup.leave()
        }
      }
      completion(reviews)
    }
  }
  
  func fetchChef(completion: @escaping (Chef?) -> ()) {
    let dispatchGroup = DispatchGroup()
    var chef: Chef? = nil
    dispatchGroup.enter()
    db.collection("chef")
      .document(self.chef_id)
      .getDocument { (documentSnapshot, err) in
      if let err = err {
        print("Error getting documents: \(err)")
      } else {
        let document = documentSnapshot!
        chef = Chef(
          id: document.get("id") as! String,
          first_name: document.get("first_name") as! String,
          last_name: document.get("last_name") as! String,
          address: document.get("address") as! String,
          city: document.get("city") as! String,
          latitude: document.get("latitude") as! Double,
          longitude: document.get("longitude") as! Double,
          phone: document.get("phone") as! String)
      }
    }
    dispatchGroup.leave()
    completion(chef)
  }
  
  func setChefId(chef_id: String) {
    self.chef_id = chef_id
  }
  
}
