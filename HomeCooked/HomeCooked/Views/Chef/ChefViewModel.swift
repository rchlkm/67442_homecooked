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
        var total = 0
        for review in self.reviews {
            total += review.stars
        }
        return Double(total) / Double(reviews.count)
    }
    
}
