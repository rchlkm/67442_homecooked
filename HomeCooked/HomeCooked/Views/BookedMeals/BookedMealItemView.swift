//
//  BookedMealItemView.swift
//  HomeCooked
//
//  Created by Rachel Kim on 11/4/19.
//  Copyright © 2019 67442. All rights reserved.
//


import SwiftUI

struct BookedMealItemView: View {
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

            BookedMealDetailComponentView(meal_date: meal.date(), meal_time: meal.time, guest_count: 2)
        }
    }
}

struct BookedMealDetailComponentView: View {
    let meal_date: String
    let meal_time: String
    let guest_count: Int
    init(meal_date: String, meal_time: String, guest_count: Int) {
        self.meal_date = meal_date
        self.meal_time = meal_time
        self.guest_count = guest_count
    }
    var body: some View {
        VStack(alignment: .leading) {
            MealDateView(meal_date: self.meal_date)
            MealTimeView(meal_time: self.meal_time)
            GuestCountView(guest_count: self.guest_count)
        }
    }
}
