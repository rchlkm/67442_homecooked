//
//  ChefViewModel.swift
//  HomeCooked
//
//  Created by Albert Yuan on 12/5/19.
//  Copyright © 2019 67442. All rights reserved.
//

import Foundation

class ChefViewModel: ObservableObject {
  @Published var reviews = [Review]()
  let client = ChefClient()
  let chef_id: String
  
  init(chef_id: String) {
    self.chef_id = chef_id
    client.setChefId(chef_id:chef_id)
  }
  
  func getChefReviews(completion: @escaping ([Review]) -> ()) {
    client.setChefId(chef_id: chef_id)
    client.fetchChefAverageRating {
      (reviews) in
      completion(reviews)
      self.reviews = reviews
    }
  }
  
  func getAverageRating() -> String {
    print("getAverageRating")
    //    client.setChefId(chef_id:params)
    var total = 0
    if (self.reviews.count > 0 ){
      for review in self.reviews {
        total += review.stars
      }
      let rating = Double(total) / Double(reviews.count)
      print("rating", rating,type(of: rating))
      print("total", total, "count",reviews.count)
//      return rating.rounded(2)
      return String(format: "%.2f", rating)
    }
    return ""
  }
  
  func getReviewsCount() -> Int {
    return self.reviews.count
  }
}
