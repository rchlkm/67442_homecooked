//
//  MealDetailViewModel.swift
//  HomeCooked
//
//  Created by Albert Yuan on 11/6/19.
//  Copyright © 2019 67442. All rights reserved.
//

import Foundation

class MealDetailViewModel {
  var meal: Meal
  var chef: Chef

  let parser = ChefParser()

  init(meal: Meal, chef: Chef) {
    self.meal = meal
    self.chef = chef
  }
}
