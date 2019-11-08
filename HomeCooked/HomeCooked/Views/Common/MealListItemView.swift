//
//  MealListItemView.swift
//  HomeCooked
//
//  Created by Rachel Kim on 11/4/19.
//  Copyright © 2019 67442. All rights reserved.
//

import SwiftUI

struct MealListItemView: View {
    var listItemViewType: String// = "search"
    let meal: Meal
    let search_guest_count: Int
//    let chef_name: String
    
    init(type: String, meal: Meal, search_guest_count: Int = 1) {
        self.listItemViewType = type
        self.meal = meal
        self.search_guest_count = search_guest_count
//        self.chef_name = getChefsById(chef_id: meal.chef_id).first_name
    }
    
    var body: some View {
        NavigationLink(destination: getItemDesinationView()) {
            
            HStack(spacing: 0) {
                //  Image(systemName: "rectangle.grid.1x2.fill")
                Rectangle()
                    .frame(width: 180.0)
                    .foregroundColor(Color.orange)
                
                mealInfoText()
                    .frame(width: 180)
            }
        }
        .frame(width: 360, height: 180)
        .overlay(
            RoundedRectangle(cornerRadius: 20)
                .stroke(Color.gray, lineWidth: 0.5)
        )
    }
    
    func getItemDesinationView() -> AnyView {
        switch listItemViewType {
        case "search": return AnyView(MealDetailsView(meal: self.meal, search_guest_count: self.search_guest_count))
        case "bookedMeal": return AnyView(BookedMealDetailView(meal: self.meal))
        default: return AnyView(SearchItemView(meal: self.meal))
        }
    }
    
    func mealInfoText() -> AnyView {
        switch listItemViewType {
        case "search": return AnyView(SearchItemView(meal: self.meal))
        case "bookedMeal": return AnyView(BookedMealItemView(meal: self.meal))
        default: return AnyView(SearchItemView(meal: self.meal))
        }
    }
    
}
