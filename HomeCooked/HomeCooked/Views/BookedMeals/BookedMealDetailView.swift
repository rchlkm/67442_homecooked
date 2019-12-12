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
    @State var cancelbutton_is_active = false
    @State var cancel_alert_present = false
    
    init(reservation: Reservation, meal: Meal) {
        self.meal = meal
        self.reservation = reservation
        self.vm = ReservationViewModel(reservation: reservation)
    }
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                BookedMealDetailComponentView(meal_date: self.meal.date(), meal_time: self.meal.time, guest_count: 2).padding(.top)
                Divider().padding(.top).padding(.bottom)
                
                LocationView(meal: self.meal, marker: true)
                Divider().padding(.top).padding(.bottom)
                
                ChefInfoView(chef: chef1)
                Divider().padding(.top).padding(.bottom)
                
                PaymentsComponentView(reservation: self.reservation)
                Divider().padding(.top).padding(.bottom)
                
                if (meal.is_complete()) {
                    RatePicker()
                }
                //                Divider().padding(.top).padding(.bottom)
                //                } else {
                //                Button(action: { self.cancel() }) {
                //                    Text("Cancel Reservation")
                //                }.padding(.top, 20)
            }
            .padding(.leading, 20).padding(.trailing, 20)
            .navigationBarTitle(meal.name)
            .navigationBarItems(trailing:
                cancel_button
            )
        }
    }
    
    var cancel_button : some View {
        Section {
            if (!meal.is_complete()) {
                NavigationLink(destination: LoggedInView2(), isActive: self.$cancelbutton_is_active) { EmptyView() }
                Button(action: {
                    self.cancel_alert_present = true
                }) {
                    Text("Cancel")
                }.alert(isPresented:$cancel_alert_present) {
                    Alert(title: Text("Are you sure?"),
                          primaryButton: .destructive(Text("Cancel Reservation")) { self.cancel() },
                          secondaryButton: .cancel())
                }
            } else {
                Text("Meal Complete")
            }
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
