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
    let chef_name: String
    
    init(type: String, meal: Meal) {
        self.listItemViewType = type
        self.meal = meal
        self.chef_name = getChefsById(chef_id: meal.chef_id).firstname
    }
    
    var body: some View {
        //        VStack {
        
        NavigationLink(destination: getItemDesinationView()) {
            
            HStack(spacing: 0) {
                //  Image(systemName: "rectangle.grid.1x2.fill")
                Rectangle()
                    .frame(width: 180.0)
                    .foregroundColor(Color.orange)
                
<<<<<<< HEAD:HomeCooked/HomeCooked/Views/Styles/MealListItemView.swift
                mealInfoText()
                    .frame(width: 180)
//                    .border(Color.red)
=======
            }) {
                
                HStack(spacing: 0) {
                    //  Image(systemName: "rectangle.grid.1x2.fill")
                    Rectangle()
                        .frame(width: 180.0)
                        .foregroundColor(Color.orange)
                    
                    mealView()
                        .frame(width: 180)
//                        .border(Color.red)
                }
>>>>>>> master:HomeCooked/HomeCooked/Views/Common/MealListItemView.swift
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
        case "search": return AnyView(MealsView(meal: self.meal))
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
