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
        ZStack {
            Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {
                
                HStack(spacing: 0) {
                    //                    Image(systemName: "rectangle.grid.1x2.fill")
                    Rectangle()
                        .frame(width: 180.0) .foregroundColor(Color.orange)
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
                        
                    }.frame(width: 180)
                                    
                }
  
            }
            .frame(width: 360, height: 180)
                
            .overlay(
                RoundedRectangle(cornerRadius: 20)
                    .stroke(Color.gray, lineWidth: 1)
            )
            
        }
    }
}
