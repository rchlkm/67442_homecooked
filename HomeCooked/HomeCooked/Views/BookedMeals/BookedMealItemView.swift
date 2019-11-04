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
    let chef_name: String
    
    init(meal: Meal) {
        self.meal = meal
        self.chef_name = getChefsById(chef_id: meal.chef_id).firstname
    }
    
    var body: some View {
        VStack {
            Text("\(meal.name)")
                .font(.headline)
                .fontWeight(.bold)
                .foregroundColor(Color.black)
            
            Text("by Chef \(self.chef_name)")
                .font(.footnote)
                .foregroundColor(Color.gray)
                .padding(.top, 5)
            
            
            Text("$\(meal.price) per person")
                .font(.body)
            .foregroundColor(Color.black)
                .padding(.top, 10)
            
        }
    }
}
