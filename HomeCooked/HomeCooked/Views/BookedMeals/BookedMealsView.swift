//
//  BookedMealsView.swift
//  HomeCooked
//
//  Created by Rachel Kim on 11/4/19.
//  Copyright © 2019 67442. All rights reserved.
//

import SwiftUI
//struct BookedMealsLoadView: View {
//    var body: some View {
//        ScrollView {
//            VStack {
//                Button(action: {
//                    //                self.button_is_active = true
//                }) {
//                    Text("LOAD")
//                }
//            }
//        }.padding(.leading,20).padding(.trailing,20)
//            .navigationBarTitle("Navbar title")
//            .navigationBarBackButtonHidden(true)
//            .navigationBarHidden(true)
//    }
//}

struct BookedMealsView: View {
    @State var button_is_active = false
    @ObservedObject var vm : BookedMealViewModel
    @State var reservations: [ReservationMeal] = [ReservationMeal]()
    
    init(){
        self.vm = BookedMealViewModel()
    }
    //user_id: String
    func updateBookedMeals(){
        self.vm.getReservationMealsByUserId(user_id: "tg0jwBTBFrdJHOfkdFTz") {
            (reservationMeals) in
            //print("UWU")
            //print(reservationMeals)
            self.reservations = reservationMeals
        }
        //print("!!!",self.reservations.count)
    }
    
    var body: some View {
        ScrollView {
            //            VStack {
            VStack(alignment: .leading) {
                HStack {
                    LargeTitle("My Meals")
                    Spacer()
                    NavigationLink(destination: HomeView(), isActive:   self.$button_is_active) { EmptyView() }
                    Button(action: {
                        self.button_is_active = true
                    }) {
                        Text("Logout")
                    }
                    //                    NavigationLink(destination: UserProfileView()) { Text("My Profile") }
                }
                Text("Upcoming Meals").font(.title).onAppear {
                    self.updateBookedMeals()
                }
                //                if !self.reservations.isEmpty {
                if (self.getUpcomingMeals().count == 0) {
                    SearchForNewMealsView(type: "upcoming")
                } else {
                    ForEach(self.getUpcomingMeals(), id: \.id) { rm in
                        //                    ForEach(bookedMeal_items, id: \.id) { rm in
                        MealListItemView(type: "bookedMeal", meal: rm.meal, reservation: rm.reservation)
                            .padding(.bottom, 15)
                    }
                }
                Divider()
                
                Text("Past Meals").font(.title)
                if (self.getPastMeals().count == 0) {
                    SearchForNewMealsView(type: "past")
                } else {
                    ForEach(self.getPastMeals(), id: \.id) { rm in
                        MealListItemView(type: "bookedMeal", meal: rm.meal, reservation: rm.reservation)
                            .padding(.bottom, 15)
                    }
                }
                
            }
        }
        .padding(.leading,20).padding(.trailing,20)
        .navigationBarTitle("Navbar title")
        .navigationBarBackButtonHidden(true)
        .navigationBarHidden(true)
    }
    
    func getUpcomingMeals() -> [ReservationMeal] {
        let meals = self.reservations.filter { !$0.meal.is_complete() }
        print(meals)
        return meals
    }
    
    func getPastMeals() -> [ReservationMeal] {
        let meals = self.reservations.filter { $0.meal.is_complete() }
        print(meals)
        return meals
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
