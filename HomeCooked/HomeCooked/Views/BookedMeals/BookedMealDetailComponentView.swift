//
//  BookedMealDetailComponentView.swift
//  HomeCooked
//
//  Created by Rachel Kim on 11/4/19.
//  Copyright © 2019 67442. All rights reserved.
//

import SwiftUI

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
        }//.border(Color.green)
    }
}

struct GuestCountView: View {
    let guest_count: Int
    init(guest_count: Int) {
        self.guest_count = guest_count
    }
    var body: some View {
        IconTextView(text: "\(self.guest_count)", img: "person.fill")
        
    }
}

struct MealDateView: View {
    let meal_date: String
    init(meal_date: String) {
        self.meal_date = meal_date
    }
    
    var body: some View {
        IconTextView(text: "\(self.meal_date)", img: "calendar")
    }
}

struct MealTimeView: View {
    let meal_time: String
    init(meal_time: String) {
        self.meal_time = meal_time
    }
    var body: some View {
        IconTextView(text: "\(self.meal_time)", img: "clock")
    }}
