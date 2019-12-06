//
//  SearchClient.swift
//  HomeCooked
//
//  Created by Albert Yuan on 11/6/19.
//  Copyright © 2019 67442. All rights reserved.
//

import Foundation
import Firebase

class SearchClient {
    let urlString = "https://firestore.googleapis.com/v1/projects/homecooked-b0581/databases/(default)/documents/meal"
    var city: String = ""
    var year: Int = 0
    var month: Int = 0
    var day: Int = 0
    var max_guest_count: Int = 0
    var user_filters_cuisines: [String] = []
    var user_filters_allergens: [String] = []
    
    let db = Firestore.firestore()
    
    func fetchMeals(completion: @escaping ([Meal]) -> ()) {
        var meals = [Meal]()
        let dispatchGroup = DispatchGroup()
        
        db.collection("meal")
          .whereField("city", isEqualTo: city)
            .whereField("year", isEqualTo: year)
            .whereField("month", isEqualTo: month)
            .whereField("day", isEqualTo: day)
            .whereField("max_guest_count", isGreaterThanOrEqualTo: max_guest_count)
            .getDocuments() { (querySnapshot, err) in
                if let err = err {
                    print("Error getting documents: \(err)")
                } else {
                    print("in the search client querying!!")
                    for document in querySnapshot!.documents {
                        dispatchGroup.enter()
                        //print("\(document.documentID) => \(document.data())")
                        let meal = Meal(
                            id: document.get("id") as! String,
                            name: document.get("name") as! String,
                            description: document.get("description") as! String,
                            chef_id: document.get("chef_id") as! String,
                            cuisine: document.get("cuisine") as! [String],
                            ingredients: document.get("ingredients") as! [String],
                            allergens: document.get("allergens") as! [String],
                            images: document.get("images") as! [String],
                            price: document.get("price") as! Int,
                            food_policy: document.get("food_policy") as! String,
                            cancellation_policy: document.get("cancellation_policy") as! String,
                            time: document.get("time") as! String,
                            year: document.get("year") as! Int,
                            month: document.get("month") as! Int,
                            day: document.get("day") as! Int,
                            city: document.get("city") as! String,
                            latitude: document.get("latitude") as! Double,
                            longitude: document.get("longitude") as! Double,
                            max_guest_count: document.get("max_guest_count") as! Int,
                            is_booked: document.get("is_booked") as! Bool
                        )
                        
                        if self.should_show_meal(meal) {
                            meals.append(meal)
                        }
                        //print("appended meal!")
                        //print(meals)
                        //print("hi")
                        //print(meal)
                        //meals.append(meal)
                        //print(meal)
                        dispatchGroup.leave()
                    }
                    
                }
                completion(meals)
        }
    }
    
    func should_show_meal(_ meal: Meal) -> Bool {
        /*
         Meal
         cuisine = ["American"]
         allergens = ["Shellfish"]
         
         allergen 1 + cuisine 1 -> false
         allergen 1 + cuisine 0 -> false
         allergen 0 + cuisine 1 -> true
         allergen 0 + cuisine 0 -> true
         */
        print("==========")
        print("this meal has these filters: ", meal.cuisine, meal.allergens)
        print("user filtered by: ", self.user_filters_cuisines, self.user_filters_allergens)
        
        var show: Bool = false
        var bool_updated: Bool = false // if show has been changed, ignore following condition
        
        if (self.user_filters_allergens.count > 0) {
            for allergen in self.user_filters_allergens {
                print("+++User has allergen filter", self.user_filters_allergens)
                if (meal.allergens.contains(allergen)) {
                    print("i dont want  ", allergen)
                    show = false
                    return show
                }
            }
            //        } else if {
            //            show = true
            //            print("---User has no allergen filters")
            //        }
        }
        
        if (self.user_filters_cuisines.count > 0) {
            for cuisine in self.user_filters_cuisines {
                print("+++User has cuisine filter", self.user_filters_cuisines)
                if (meal.cuisine.contains(cuisine)) {
                    print("i want ", cuisine)
                    show = true
                    bool_updated = true
                }
            }
        } else {
            show = true
            bool_updated = true
            print("---User has no cuisine filters")
        }
        
        print("AFTER should_show_meal", show)
        return show
        
        
    }
    
    func setParams(params: SearchParams) {
        city = params.city
        year = params.year
        month = params.month
        day = params.day
        max_guest_count = params.max_guest_count
        
        user_filters_cuisines = params.filters_cuisines
        user_filters_allergens = params.filters_allergens
        
        //        if (params.cuisine_asian) { filter_cuisines.append("Asian") }
        //        if (params.cuisine_american) { filter_cuisines.append("American") }
        //        if (params.cuisine_italian) { filter_cuisines.append("Italian") }
        //        if (params.cuisine_mexican) { filter_cuisines.append("Mexican") }
        //        if (params.cuisine_mediterranean) { filter_cuisines.append("Mediterranean") }
        
        //        if (params.allergens_nuts) { filter_allergens.append("Nuts") }
        //        if (params.allergens_shellfish) { filter_allergens.append("Shellfish") }
        //        if (params.allergens_dairy) { filter_allergens.append("Dairy") }
        //        if (params.allergens_fish) { filter_allergens.append("Fish") }
        //        if (params.allergens_soy) { filter_allergens.append("Soy") }
    }
}


//let cuisines = ["Asian", "American"]
// or

//allergns
// and
