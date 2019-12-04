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
    var frame_size: CGFloat = UIScreen.main.bounds.width - 48
    
    init(reservation: Reservation, meal: Meal) {
        self.meal = meal
        self.reservation = reservation
    }
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                BookedMealDetailComponentView(meal_date: meal.date(), meal_time: meal.time, guest_count: 2)
                Spacer().frame(height: 30.0)
                
                NavigationLink(destination: LoggedInView(2)) {
                    Text("Ok!")
                        .foregroundColor(OrangeColor)
                        .padding(.top, 12).padding(.bottom, 12).padding(.leading).padding(.trailing)
                        .overlay(
                            RoundedRectangle(cornerRadius: 30)
                                .stroke(OrangeColor, lineWidth: 2)
                                .frame(width: frame_size))
                }
            }
            .navigationBarTitle("Meal Confirmation")
            .navigationBarHidden(true)

        }
    }
}

struct ConfirmationView_Previews: PreviewProvider {
    static var previews: some View {
        ConfirmationView(reservation: reservation1, meal: meal1)
    }
}
