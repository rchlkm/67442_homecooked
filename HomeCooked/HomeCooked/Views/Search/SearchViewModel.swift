//
//  SearchViewModel.swift
//  HomeCooked
//
//  Created by Albert Yuan on 11/3/19.
//  Copyright © 2019 67442. All rights reserved.
//


import Foundation

class SearchViewModel: ObservableObject {
    
  var meals = [Meal]()

  let client = SearchClient()

  func mealForRowAtIndexPath(_ indexPath: IndexPath) -> Meal? {
    if indexPath.row > meals.count {
      return nil
    }
    return meals[indexPath.row]
  }
  
//  func search(params: SearchParams) {
//    client.setParams(params:params)
//
//    print("searched")
//  }
  
  func setParams(params: SearchParams) {
    client.setParams(params:params)
  }
  
  func refresh(completion: @escaping () -> Void) {
    client.fetchMeals { [unowned self] data in
      
      // we need in this block a way for the parser to get an array of repository
      // objects (if they exist) and then set the repos var in the view model to
      // those repository objects
      self.meals = data
      
      completion()
    }
  }
}

