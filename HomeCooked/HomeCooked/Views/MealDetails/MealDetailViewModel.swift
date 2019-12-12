//
//  MealDetailViewModel.swift
//  HomeCooked
//
//  Created by Albert Yuan on 11/6/19.
//  Copyright © 2019 67442. All rights reserved.
//

import Foundation

class MealDetailViewModel: ObservableObject {
    var meal: Meal
    @Published var chef: Chef?
    let client = ChefClient()
    
    init(meal: Meal) {
        self.meal = meal
    }
    
    // get chef object by chef id
    var got_chef: Bool = false
    func getChef(chef_id: String, completion: @escaping (Chef?) -> ()) {
        client.setChefId(chef_id: chef_id)
        client.fetchChef() {
            (chef) in
          print("&&&&&&&&&&&&")
          print(chef == nil)
          print("&&&&&&&&&&&&")
            self.chef = chef
          completion(chef)
        }
    }
}

