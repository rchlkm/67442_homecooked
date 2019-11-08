//
//  ReserveView.swift
//  HomeCooked
//
//  Created by Rachel Kim on 11/3/19.
//  Copyright © 2019 67442. All rights reserved.
//

import SwiftUI

struct ReserveView: View {
    let meal: Meal
    @State var guest_count: Int = 1
    
    var party_size: Int = 3
    let reservation : Reservation
    //    var total_price: Double
    let vm : ReservationViewModel
    
    init(meal: Meal) {
        self.meal = meal
        func randomString(length: Int) -> String {
            let letters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
            return String((0..<length).map{ _ in letters.randomElement()! })
        }
        self.reservation = Reservation(id: randomString(length: 16), guest_id: 0, meal_id: self.meal.id, payment_info: "12345", guest_count: party_size)
        self.vm = ReservationViewModel(reservation: self.reservation)
    }
    
    
    
    var body: some View {
        
        VStack(alignment: .leading) {
            
            Text(meal.name)
                .font(.title)
                .fontWeight(.bold)
            
            //            Section {
            //                MealDateView(meal_date: meal.date())
            //                MealTimeView(meal_time: meal.time)
            //            }.padding()
            //                        Divider()
            
            Section {
                Stepper(value: $guest_count, in: 1...10, label: {
                    Image(systemName: "person.fill").foregroundColor(Color.orange)
                    Text("\(guest_count)")
                })
            }.padding()
            Divider()
            
            HStack {
                Text("$\(meal.price) x \(guest_count) guests")
                Spacer()
                Text("$\(meal.price * guest_count)")
                    .foregroundColor(Color.orange)
            }.padding()
            Divider()
            
            Section {
                Text("VISA ******1234")
            }.padding()
            Divider()
            
            policy
                .padding(.bottom, 20)
            
            reserveButton
            Spacer()
            
        }
        .padding(.leading,20).padding(.trailing,20)
        .navigationBarTitle(Text("Reserve Meal"))
        
    }
    
    func reserveMeal() {
        self.vm.postReservation(reservation: self.reservation)
    }
    
    var reserveButton: some View {
        NavigationLink(destination: BookedMealDetailView(meal: meal)) {
            HStack {
                Button(action: {
                    self.reserveMeal()
                }) {
                    Text("Confirm")
                        .foregroundColor(Color.orange)
                }
                    
                .frame(width: 100)
            }
                .padding(10)
                .overlay(
                    RoundedRectangle(cornerRadius: 20)
                        .stroke(Color.gray, lineWidth: 0.5)
            )
        }
    }
    
    var policy: some View {
        Text("By confirming this reservation, you are effectively agreeing to the Cancellation Policy and Food Policy of this meal and homecooked.").font(.footnote)
            .padding()
    }
}

struct SelectMealTimeView_Previews: PreviewProvider {
    static var previews: some View {
        ReserveView(meal:meal1)
    }
}
