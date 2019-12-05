//
//  ConfirmationView.swift
//  HomeCooked
//
//  Created by Rachel Kim on 12/4/19.
//  Copyright © 2019 67442. All rights reserved.
//

import SwiftUI

struct ConfirmationView: View {
    let meal: Meal
    let reservation: Reservation
    init(meal: Meal, reservation: Reservation) {
        self.meal = meal
        self.reservation = reservation
    }
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                SectionTitle("You're meal is booked!")
                Text("\(meal.name)")
                    .font(.headline)
                    .fontWeight(.bold)
                    .foregroundColor(Color.black)
                BookedMealDetailComponentView(meal_date: meal.date(), meal_time: meal.time, guest_count: reservation.guest_count)
                Spacer().frame(height: 30.0)
                NavigationLink(destination: LoggedInView2()) { OrangeButton("Ok!") }
            }
        }
        .padding(.leading,20).padding(.trailing,20)
        .navigationBarTitle("Confirmation")
        .navigationBarBackButtonHidden(true)
    }
}

struct ConfirmationView_Previews: PreviewProvider {
    static var previews: some View {
        ConfirmationView(meal: meal1, reservation: reservation1)
    }
}
