//
//  MealParser.swift
//  HomeCooked
//
//  Created by Albert Yuan on 11/5/19.
//  Copyright © 2019 67442. All rights reserved.
//

import Foundation
import SwiftyJSON

typealias JSONDictionary = [String: AnyObject]

class MealParser {
  func parseDictionary(_ data: Data?) -> JSON? {
    do {
      if let d = data {
        let json = try JSON(data: d)
        print(json)
        return json
      }
    } catch {
      print(error)
    }
    return nil
  }

  func mealsFromSearchResponse(_ data: Data?) -> [Meal]? {
    if let dict = parseDictionary(data) {
      var meals = [Meal]()
      let mealDicts = dict["documents"]
      for (index,mealDict):(String, JSON) in mealDicts {
        let meal = parseMeal(mealDict)
        meals.append(meal)
        print(index)
      }
      return meals
    }
    return nil
  }

  func parseMeal(_ mealDict: JSON) -> Meal {
    // Your code here
    let dict = mealDict["fields"]
    return Meal(
      id: dict["id"]["integerValue"].intValue,
      name: dict["name"]["stringValue"].stringValue,
      description: dict["description"]["stringValue"].stringValue,
      chef_id: dict["chef_id"]["integerValue"].intValue,
      cuisine: dict["cuisine"]["arrayValue"]["values"].arrayValue.map {$0["stringValue"].stringValue},
      ingredients: dict["ingredients"]["arrayValue"]["values"].arrayValue.map {$0["stringValue"].stringValue},
      allergens: dict["allergens"]["arrayValue"]["values"].arrayValue.map {$0["stringValue"].stringValue},
      images: dict["images"]["arrayValue"]["values"].arrayValue.map {$0["stringValue"].stringValue},
      price: dict["price"]["integerValue"].intValue
    )
  }
}
