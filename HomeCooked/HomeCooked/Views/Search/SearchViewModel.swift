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

  func mealForRowAtIndexPath(_ indexPath: IndexPath) -> Meal? {
    if indexPath.row > meals.count {
      return nil
    }
    return meals[indexPath.row]
  }
  
  func search(params: SearchParams) -> [Meal] {
    client.setParams(params:params)
    return client.fetchMeals()
  }
}

