//
//  MealDetailsView.swift
//  HomeCooked
//
//  Created by Albert Yuan on 10/30/19.
//  Copyright © 2019 67442. All rights reserved.
//

import SwiftUI

struct MealDetailsView: View {
    let meal: Meal
    init(meal: Meal) {
        self.meal = meal
    }
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                Rectangle() // Image(meal.image)
                    .frame(height: 250)
                    .offset(y:-20)
                
                Section {
                    description
                    Spacer().frame(height: 20.0)
                    
                    reservations
                    Spacer().frame(height: 20.0)
                    
                    reviews
                    Spacer().frame(height: 20.0)
                    
                    LocationView(meal: meal)
                    Spacer().frame(height: 20.0)
                    
                    additionalInfo
                    Spacer().frame(height: 20.0)
                }.padding(.leading,20).padding(.trailing,20)
            }
        }
        .navigationBarHidden(true)
        .edgesIgnoringSafeArea([.top])
    }
    
    var description: some View {
        VStack(alignment: .leading) {
            Text(meal.name)
                .font(.largeTitle)
                .fontWeight(.bold)
            
            Text(meal.description)
            Spacer().frame(height: 20.0)
            
            Text("By Chef")
        }
    }
    
    var reserveButton: some View {
        NavigationLink(destination: ReserveView(meal: meal1)) {
            HStack {
                MealDateView(meal_date: "\(meal.date()) \(meal.time)")
                    .padding(.trailing, 10)
            }.font(.caption)
                .padding(10)
                .overlay(
                    RoundedRectangle(cornerRadius: 20)
                        .stroke(Color.gray, lineWidth: 0.5)
            )
        }
    }
    
    var reservations: some View {
        VStack(alignment: .leading) {
            Text("Reserve Meal")
                .font(.title)
                .fontWeight(.bold)
            Text("$\(meal.price) per person")
            reserveButton
        }
    }
    
    var reviews: some View {
        VStack(alignment: .leading) {
            Text("Reviews" + " (5)")
                .font(.title)
                .fontWeight(.bold)
            
            Section {
                Text("4.7")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(Color.orange)
            }
        }.padding(.top, 5)
    }
    
    var additionalInfo: some View {
        VStack(alignment: .leading) {
            Text("Additional Information")
                .font(.title)
                .fontWeight(.bold)
            
            Text("Food Policy")
                .font(.headline)
                .fontWeight(.bold)
                .padding(.top, 10)
            Text(meal.food_policy)
                .font(.subheadline)
            
            Text("Cancellation Policy")
                .font(.body)
                .fontWeight(.bold)
                .padding(.top, 15)
            Text(meal.cancellation_policy)
                .font(.subheadline)
        }
        .padding(.top, 10)
    }
}


struct MealsView_Previews: PreviewProvider {
    static var previews: some View {
        MealDetailsView(meal: meal1)
    }
}
