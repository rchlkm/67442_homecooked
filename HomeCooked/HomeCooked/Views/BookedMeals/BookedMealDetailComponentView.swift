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
    let party_size: Int
    init(meal_date: String, meal_time: String, party_size: Int) {
        self.meal_date = meal_date
        self.meal_time = meal_time
        self.party_size = party_size
    }
    var body: some View {
        VStack(alignment: .leading) {
            MealDateView(meal_date: self.meal_date)
            MealTimeView(meal_time: self.meal_time)
            PartySizeView(party_size: self.party_size)
        }//.border(Color.green)
    }
}

struct PartySizeView: View {
    let party_size: Int
    init(party_size: Int) {
        self.party_size = party_size
    }
    var body: some View {
        IconTextView(text: "\(self.party_size)", img: "person")
        
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
