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
    
    func getChefReviews(chef_id: String, completion: @escaping ([Review]) -> ()) {
        client.setChefId(chef_id: chef_id)
        
        client.fetchChefAverageRating {
            (reviews) in
            completion(reviews)
            self.reviews = reviews
        }
    }
    
    func getAverageRating() -> Double {
//        client.setChefId(chef_id:params)
        var total = 0
        if (self.reviews.count > 0 ){
            for review in self.reviews {
                total += review.stars
            }
            let rating = Double(total) / Double(reviews.count)
            print("rating", rating,type(of: rating))
            print("total", total, "count",reviews.count)
            return rating.rounded()
        }
        return 0
    }
    
    func getReviewsCount() -> Int {
        return self.reviews.count
    }
}


