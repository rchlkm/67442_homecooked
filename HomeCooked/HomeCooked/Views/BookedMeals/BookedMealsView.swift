//
//  BookedMealsView.swift
//  HomeCooked
//
//  Created by Rachel Kim on 11/4/19.
//  Copyright © 2019 67442. All rights reserved.
//

import SwiftUI

struct BookedMealsView: View {
    @State var selectedView = 2
    
    init() {
        UINavigationBar.appearance().backgroundColor = .blue
    }
    var body: some View {
        NavigationView {
            ScrollView {
                Spacer()
                VStack(alignment: .leading) {
                    
                    Text("Upcoming Meals")
                        .font(.title)
                    
                    if bookedMeal_items.isEmpty {
                        SearchForNewMealsView(type: "upcoming")
                    } else {
                        ForEach(bookedMeal_items, id: \.id) { reservation in
                            MealListItemView(type: "bookedMeal", meal: getMealsByIdFromReservation(reservation: reservation))
                                .padding(.bottom, 20)
                        }
                    }
                    
                    Divider()
                    
                    Text("Past Meals")
                        .font(.title)
                    if pastMeal_items.isEmpty {
                        SearchForNewMealsView(type: "past")
                    } else {
                        ForEach(pastMeal_items, id: \.id) { reservation in
                            MealListItemView(type: "bookedMeal", meal: getMealsByIdFromReservation(reservation: reservation))
                                .padding(.bottom, 20)
                        }
                    }
                }
            }
            .navigationBarTitle("Meals")
            .padding(.leading,20).padding(.trailing,20)
            //            .border(Color.purple)
            
            
            
        }
    }
}


struct SearchForNewMealsView: View {
//    let type: String
     @State private var isPresented = false
    let text: String
    init(type: String) {
//        self.type = type
        switch type {
        case "past":
            self.text = "You haven't booked meals with homecooked."
        default:
            self.text = "You have no upcoming meals."
        }
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(self.text)
                .padding(.bottom,10)
            
            NavigationLink(destination: SearchView(), isActive:$isPresented) {
                Image(systemName: "magnifyingglass")
                Text("Book a Meal")
            }
        .navigationBarBackButtonHidden(true)
            .padding(10)
            .overlay(
            RoundedRectangle(cornerRadius: 20)
                    .stroke(Color.gray, lineWidth: 0.5)
            )
            
        }.padding(.top)
    }
}


struct BookedMealsView_Previews: PreviewProvider {
    static var previews: some View {
        BookedMealsView()
    }
}
