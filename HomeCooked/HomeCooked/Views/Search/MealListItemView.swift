//
//  MealListItemView.swift
//  HomeCooked
//
//  Created by Rachel Kim on 11/4/19.
//  Copyright © 2019 67442. All rights reserved.
//

import SwiftUI

struct MealListItemView: View {
    var listItemViewType: String = "search"
    let meal: Meal
    let chef_name: String
    
    init(type: String, meal: Meal) {
        self.listItemViewType = type
        self.meal = meal
        self.chef_name = getChefsById(chef_id: meal.chef_id).firstname
    }
    
    var body: some View {
        ZStack {
            Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {
               
                HStack(spacing: 0) {
                    //                    Image(systemName: "rectangle.grid.1x2.fill")
                    Rectangle()
                        .frame(width: 180.0)
                        .foregroundColor(Color.orange)
                    
                    mealView()
                        .frame(width: 180)
                }
            }
            .frame(width: 360, height: 180)
            .overlay(
                RoundedRectangle(cornerRadius: 20)
                    .stroke(Color.gray, lineWidth: 1)
            )
            
        }
    }
    
    func mealView() -> AnyView {
        switch listItemViewType {
            case "search": return AnyView(SearchItemView(meal: self.meal))
            case "bookedMeal": return AnyView(SearchItemView(meal: self.meal))
            default: return AnyView(SearchItemView(meal: self.meal))
        }
    }
    
}
