//
//  RateMealViewModel.swift
//  HomeCooked
//
//  Created by Albert Yuan on 12/5/19.
//  Copyright © 2019 67442. All rights reserved.
//

import Foundation

class RateMealViewModel: ObservableObject{
  let client = ReviewClient()
  
  func generateId() -> String {
    let letters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
    return String((0..<16).map{ _ in letters.randomElement()! })
  }
  
  func postReview(chef_id: String, stars: Int, user_id: String) {
    let review : Review
    /*if(test == true){
      review = Review(id: "test_review",
                             chef_id: chef_id,
                             stars: stars,
                             user_id: user_id)
    } else {
 */
    review = Review(id: generateId(),
                             chef_id: chef_id,
                             stars: stars,
                             user_id: user_id)
   
    client.postReview(review: review)
  }
  
  func deleteReview(review_id: String) {
    client.deleteReview(review_id: review_id)
  }
  
  
}
