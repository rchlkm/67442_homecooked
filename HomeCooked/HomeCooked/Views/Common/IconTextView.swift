//
//  IconTextView.swift
//  HomeCooked
//
//  Created by Rachel Kim on 11/4/19.
//  Copyright © 2019 67442. All rights reserved.
//

import SwiftUI

struct IconTextView: View {
    let text: String
    let img: String
    
    init(text: String, img: String) {
        self.text = text
        self.img = img == "" ? "rectangle.fill" : img
    }
    
    var body: some View {
        HStack {
            Image(systemName: self.img) .foregroundColor(OrangeColor)
                .frame(width: 20, height: 20)
            
            Text("\(self.text)")
                .font(.body)
                .foregroundColor(Color.black)
        }
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
