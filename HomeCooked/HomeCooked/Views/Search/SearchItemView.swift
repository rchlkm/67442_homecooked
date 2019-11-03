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
    let chef_name: String
    
    init(meal: Meal) {
        self.meal = meal
        self.chef_name = getChefsById(chef_id: meal.chef_id).firstname
    }
    
    var body: some View {
        VStack {
            Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {
                Text("\(meal.name) by Chef \(chef_name)")
                    .font(.headline)
                    .fontWeight(.bold)
                    .foregroundColor(Color.black)
            }
            .frame(width: 350, height: 120)
            .padding(.leading, 10)
            .padding(.trailing, 10)
            .overlay(
                RoundedRectangle(cornerRadius: 20)
                    .stroke(Color.gray, lineWidth: 1)
            )
            
        }
    }
}
