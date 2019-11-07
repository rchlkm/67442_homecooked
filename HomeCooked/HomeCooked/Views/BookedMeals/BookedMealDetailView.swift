//
//  BookedMealDetailView.swift
//  HomeCooked
//
//  Created by Rachel Kim on 11/4/19.
//  Copyright © 2019 67442. All rights reserved.
//

import SwiftUI

struct BookedMealDetailView: View {
    
    let meal: Meal
    init(meal: Meal) {
        self.meal = meal
    }
    
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                
//                Text(meal.name)
//                    .font(.largeTitle)
//                    .fontWeight(.bold)
                HStack(alignment: .top) {
                    //                        Rectangle() // Image(meal.image)
                    //                            .frame(width: 220, height: 140)
                    BookedMealDetailComponentView(meal_date: "Mon 11/11", meal_time: "6PM", party_size: 3)
                }//.border(Color.green)
                Spacer().frame(height: 30.0)
                
                LocationView(meal: meal, marker: true)
                Spacer().frame(height:30.0)
                
                ChefInfoView(chef: chef1)
                Spacer().frame(height:30.0)
                
                RateMealAlert()
            }
        }
        .navigationBarTitle(meal.name)
        .padding(.leading,20).padding(.trailing,20)
    }
}

struct RateMealAlert: View {
    @State var isPresented = false
    let dismiss = Alert.Button.default(Text("OK")) {}
    var alert: Alert {
        Alert(title: Text("Rate the Meal"),
              message: Text("How many stars do you give the meal?"),
              dismissButton: dismiss)
    }
    
    var body: some View {
        Button(action: {
            self.isPresented = true
        }) {
            Image(systemName: "star.fill")
            Text("Rate Meal")
        }.alert(isPresented: $isPresented) { () -> Alert in
            alert
        }
        .padding(10)
        .overlay(
            RoundedRectangle(cornerRadius: 20)
                .stroke(Color.gray, lineWidth: 0.5)
        )
    }
}

struct BookedMealDetailView_Previews: PreviewProvider {
    static var previews: some View {
        BookedMealDetailView(meal: meal1)
    }
}
