//
//  BookedMealsView.swift
//  HomeCooked
//
//  Created by Rachel Kim on 11/4/19.
//  Copyright © 2019 67442. All rights reserved.
//

import SwiftUI

struct BookedMealsView: View {
    @State var button_is_active = false
    var body: some View {
        ScrollView {
            //            Spacer()
            VStack(alignment: .leading) {
                HStack {
                    LargeTitle("My Meals")
                    Spacer()
                    NavigationLink(destination: HomeView(), isActive: self.$button_is_active) { EmptyView() }
                        Button(action: {
                            self.button_is_active = true
                        }) {
                            Text("Logout")
                    }
                    //                    NavigationLink(destination: UserProfileView()) { Text("My Profile") }
                }
                Text("Upcoming Meals").font(.title)
                if bookedMeal_items.isEmpty {
                    SearchForNewMealsView(type: "upcoming")
                } else {
                    ForEach(bookedMeal_items, id: \.id) { rm in
                        MealListItemView(type: "bookedMeal", meal: rm.meal, reservation: rm.reservation)
                            .padding(.bottom, 15)
                    }
                }
                Divider()
                
                Text("Past Meals").font(.title)
                if pastMeal_items.isEmpty {
                    SearchForNewMealsView(type: "past")
                } else {
                    ForEach(pastMeal_items, id: \.id) { rm in
                        MealListItemView(type: "bookedMeal", meal: rm.meal, reservation: rm.reservation)
                            .padding(.bottom, 15)
                    }
                }
            }
        }//.border(Color.blue)
            .padding(.leading,20).padding(.trailing,20)
            .navigationBarTitle("Navbar title")
            .navigationBarBackButtonHidden(true)
            .navigationBarHidden(true)
    }
}

struct SearchForNewMealsView: View {
    @State private var isPresented = false
    let text: String
    init(type: String) {
        switch type {
        case "past":
            self.text = "You have no past meals with homecooked."
        default:
            self.text = "You have no upcoming meals."
        }
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(self.text)
                .padding(.bottom,10)
            
            //            Section {
            //                NavigationLink(destination: SearchView(), isActive:$isPresented) {
            //                    Image(systemName: "magnifyingglass")
            //                    Text("Book a Meal")
            //                }
            //                .padding(10)
            //                .overlay(
            //                    RoundedRectangle(cornerRadius: 20)
            //                        .stroke(Color.gray, lineWidth: 0.5)
            //                )
            //            }
        }.padding(.top)
    }
}

struct BookedMealsView_Previews: PreviewProvider {
    static var previews: some View {
        BookedMealsView()
    }
}
