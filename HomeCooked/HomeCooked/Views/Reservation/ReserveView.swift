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
    var guestString: String = "guest(s)" //= guest_count == 1 ? "guest" : "guests"
    let reservation : Reservation
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
        //        NavigationView {
        ScrollView {
            VStack(alignment: .leading) {
                
                Text(meal.name)
                    .font(.title)
                    .fontWeight(.bold)
                
                //            meal_details
                //            Divider()
                
                guest_stepper.padding()
                Divider()
                
                meal_price
                Divider()
                
                payment
                Divider()
                
                policy.padding(.bottom, 20)
                
                reserveButton
                Spacer()
                
            }
            .padding(.leading,20).padding(.trailing,20)
            .navigationBarTitle(Text("Reserve Meal"))
            
        }
        //        }
        
    }
    
    func reserveMeal() {
        self.vm.postReservation(reservation: self.reservation)
    }
    
    
    var reserveButton: some View {
//        @State private var actionState: Int? = 0
//        NavigationLink(destination: Text("Destination View"), tag: 1, selection: $actionState) {

        NavigationLink(destination: BookedMealDetailView(meal: meal)) {
            HStack {
                Text("Confirm")
                    .padding(10)
                    .foregroundColor(Color.orange)
                    .onTapGesture {
                        self.reserveMeal()
                    }
            }.frame(width: 100)

            .overlay(
                RoundedRectangle(cornerRadius: 20)
                    .stroke(Color.gray, lineWidth: 0.5)
            )
        }
        
    }
    
    
//    var reserveButton: some View {
//        NavigationLink(destination: BookedMealDetailView(meal: meal)) {
//            HStack {
//                Button(action: {
//                    self.reserveMeal()
//                }) {
//                    Text("Confirm")
//                        .foregroundColor(Color.orange)
//                }
//
//                .frame(width: 100)
//            }
//            .padding(10)
//            .overlay(
//                RoundedRectangle(cornerRadius: 20)
//                    .stroke(Color.gray, lineWidth: 0.5)
//            )
//        }
//    }
    
    var meal_details: some View {
        VStack {
            MealDateView(meal_date: meal.date())
            MealTimeView(meal_time: meal.time)
        }.padding()
    }
    
    var guest_stepper: some View {
        Stepper(value: $guest_count, in: 1...10, label: {
            Image(systemName: "person.fill").foregroundColor(Color.orange)
            Text("\(guest_count)")
        })
    }
    
    var meal_price: some View {
        HStack {
            Text("$\(meal.price) x \(guest_count) \(guestString)")
            Spacer()
            Text("$\(meal.price * guest_count)")
                .fontWeight(.bold)
                .foregroundColor(Color.orange)
        }.padding()
    }
    
    var payment: some View {
        Section {
            Text("VISA ******1234")
        }.padding()
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
