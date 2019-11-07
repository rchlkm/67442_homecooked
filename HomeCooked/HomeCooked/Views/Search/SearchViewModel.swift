//
//  SearchViewModel.swift
//  HomeCooked
//
//  Created by Albert Yuan on 11/3/19.
//  Copyright © 2019 67442. All rights reserved.
//

import Foundation

class SearchViewModel {
  var meals = [Meal]()
  
  let client = SearchClient()
  let parser = MealParser()
  
  func mealForRowAtIndexPath(_ indexPath: IndexPath) -> Meal? {
    if indexPath.row > meals.count {
      return nil
    }
    return meals[indexPath.row]
  }
  
  func refresh(completion: @escaping () -> Void) {
    client.fetchMeals { [unowned self] data in
      
      // we need in this block a way for the parser to get an array of repository
      // objects (if they exist) and then set the repos var in the view model to
      // those repository objects
      if let meals = self.parser.mealsFromSearchResponse(data){
        self.meals = meals
      }
      
      completion()
    }
  }
}
