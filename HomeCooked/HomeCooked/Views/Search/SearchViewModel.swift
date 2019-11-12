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
  
  func search(params: SearchParams) {
    client.setParams(params:params)
    self.meals = client.fetchMeals()
    print("searched")
  }
}

