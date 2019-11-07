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
//    let chef_name: String
    init(meal: Meal) {
        self.meal = meal
//        self.chef_name = getChefsById(chef_id: meal.chef_id).first_name
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("\(meal.name)")
                .font(.headline)
                .fontWeight(.bold)
                .foregroundColor(Color.black)
            
//            Text("by Chef \(self.chef_name)")
//                .font(.footnote)
//                .foregroundColor(Color.gray)
//                .padding(.top, 5)
            
            BookedMealDetailComponentView(meal_date: meal.date(), meal_time: meal.time, party_size: 3)
            
        }
//        .frame(width: 180)
//        .border(Color.blue)1615
    }
}
