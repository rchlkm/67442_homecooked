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
@State var confirmAlertPresent = false
    
    
    init(meal: Meal, search_guest_count: Int = 1) {
        self.meal = meal
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
                
                HStack {
                    reserveButton.padding(.trailing, 10)
                    viewReservation
                }
                
            }
            .padding(.leading,20).padding(.trailing,20)
            .navigationBarTitle(Text("Reserve Meal"))
            
        }
        //        }
    }
    
    func randomString(length: Int) -> String {
        let letters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
        return String((0..<length).map{ _ in letters.randomElement()! })
    }
    
    func reserveMeal() {
        let reservation: Reservation = Reservation(id: randomString(length: 16), guest_id: 0, meal_id: self.meal.id, payment_info: "12345", guest_count: guest_count)
        let vm = ReservationViewModel(reservation: reservation)
        vm.postReservation(reservation: reservation)
    }
    
    var confirmAlert: Alert {
        Alert(title: Text("Meal has been reserved!"),
              message: Text("Click 'View Reservation' to see details."),
              dismissButton: Alert.Button.default(Text("OK")) {})
    }
    
    var reserveButton: some View {
        HStack {
            Button(action: {
                self.reserveMeal()
                self.confirmAlertPresent = true
            }) {
                Text("Confirm")
                    .foregroundColor(Color.orange)
            }.alert(isPresented: $confirmAlertPresent) { () -> Alert in
                    confirmAlert
                }
            .frame(width: 100)
        }
        .padding(10)
        .overlay(
            RoundedRectangle(cornerRadius: 20)
                .stroke(Color.gray, lineWidth: 0.5)
        )
    }
    
    var viewReservation: some View {
        NavigationLink(destination: BookedMealDetailView(meal: meal)) {
            HStack {
                Text("View Reservation")
                    .padding(10)
                    .foregroundColor(Color.orange)
            }
            .frame(width: 200)
            .overlay(
                RoundedRectangle(cornerRadius: 20)
                    .stroke(Color.gray, lineWidth: 0.5)
            )
        }
    }
    
    
    var meal_details: some View {
        VStack {
            MealDateView(meal_date: meal.date())
            MealTimeView(meal_time: meal.time)
        }.padding()
    }
    
    var guest_stepper: some View {
            Stepper(value: $guest_count, in: 1...meal.max_guest_count, label: {
                Image(systemName: "person.fill").foregroundColor(Color.orange)
                Text("\(guest_count)").fontWeight(.bold).foregroundColor(Color.orange)
                Text("(Max: \(meal.max_guest_count))")
            })
    }
    
    func guestString() -> String {
        let guestString: String = guest_count == 1 ? "guest" : "guests"
        return guestString
    }
    
    var meal_price: some View {
        HStack {
            Text("$\(meal.price) x \(guest_count) \(self.guestString())")
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
