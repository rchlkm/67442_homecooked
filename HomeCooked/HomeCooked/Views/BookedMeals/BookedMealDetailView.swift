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
    let reservation: Reservation
    @ObservedObject var vm : ReservationViewModel
    
    init(reservation: Reservation, meal: Meal) {
        self.meal = meal
        self.reservation = reservation
        self.vm = ReservationViewModel(reservation: reservation)
    }
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                
                BookedMealDetailComponentView(meal_date: meal.date(), meal_time: meal.time, guest_count: 2)
                Spacer().frame(height: 30.0)
                
                LocationView(meal: meal, marker: true)
                Spacer().frame(height:30.0)
                
                ChefInfoView(chef: chef1)
                Spacer().frame(height:30.0)
                
                //                RateMealAlert()
                //                Spacer().frame(height:30.0)
                
                
//                if (!meal.is_complete()) {
                    
                    Button(action: {
                        self.cancel()
                    }) {
                        Text("Cancel")
                    }
                    
//                } else {
                    Text("Rate Meal")
                        .fontWeight(.bold)
                    RatePicker()
//                }
                
            }
        }
        .navigationBarTitle(meal.name)
        .padding(.leading,20).padding(.trailing,20)
    }
    
    func cancel() {
        self.vm.cancelReservation()
    }
    
    
}

struct BookedMealDetailView_Previews: PreviewProvider {
    static var previews: some View {
        BookedMealDetailView(reservation: reservation1, meal: meal1)
    }
}
