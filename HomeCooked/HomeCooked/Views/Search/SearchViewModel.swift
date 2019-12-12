//
//  SearchViewModel.swift
//  HomeCooked
//
//  Created by Albert Yuan on 11/3/19.
//  Copyright © 2019 67442. All rights reserved.
//

import Foundation

class SearchViewModel: ObservableObject {
    @Published var meals = [Meal]()
    let client = SearchClient()
    
    func mealForRowAtIndexPath(_ indexPath: IndexPath) -> Meal? {
        if indexPath.row > meals.count {
            return nil
        }
        return meals[indexPath.row]
    }
    
    func search(params: SearchParams, completion: @escaping ([Meal]) -> ()) {
        client.setParams(params:params)
//        print("!!!! this array should be empty",meals)
        client.fetchMeals {
            (meals) in
//            print("before")
//            print(meals)
//            print("after")
            completion(meals)
            self.meals = meals
        }
//        print("searched")
        //print(self.meals)
        //print(self.meals)
    }
}

