//
//  SearchItemView.swift
//  HomeCooked
//
//  Created by Rachel Kim on 11/3/19.
//  Copyright © 2019 67442. All rights reserved.
//

import SwiftUI

struct SearchItemView: View {
    let meal: Meal
    
    init(meal: Meal) {
        self.meal = meal
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("\(meal.name)")
                .font(.headline)
                .fontWeight(.bold)
                .foregroundColor(Color.black)
            
            Text("$\(meal.price) per person")
                .font(.body)
            .foregroundColor(Color.black)
                .padding(.top, 10)
            
            MealDateView(meal_date: "\(meal.date())")
            MealTimeView(meal_time: "\(meal.time)")
        }
    }
}
