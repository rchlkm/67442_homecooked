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
                //            VStack {
                BookedMealDetailComponentView(meal_date: self.meal.date(), meal_time: self.meal.time, guest_count: 2).padding(.top)
                Divider().padding(.top).padding(.bottom)
                
                LocationView(meal: self.meal, marker: true)
                Divider().padding(.top).padding(.bottom)
                
                ChefInfoView(chef: chef1)
                Divider().padding(.top).padding(.bottom)
                
                PaymentsComponentView(reservation: self.reservation)
                Divider().padding(.top).padding(.bottom)
                
                //                if (meal.is_complete()) {
                RatePicker()
                //                Divider().padding(.top).padding(.bottom)
                //                } else {
                Button(action: { self.cancel() }) {
                    Text("Cancel Reservation")
                }.padding(.top, 20)
            }
            .padding(.leading, 20).padding(.trailing, 20)
            .navigationBarTitle(meal.name)
        }
    }
    
    func cancel() {
        print("cancelling reservation")
        //        self.vm.cancelReservation()
    }
}

struct BookedMealDetailView_Previews: PreviewProvider {
    static var previews: some View {
        BookedMealDetailView(reservation: reservation1, meal: meal1)
    }
}
