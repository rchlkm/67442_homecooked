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
    @State var isActive = false
    
    init(meal: Meal, search_guest_count: Int = 1) {
        self.meal = meal
    }
    
    var body: some View {
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
                
                policy//.padding(.bottom, 20)
                
                reserveButton
            }
            .padding(.leading,20).padding(.trailing,20)
            .navigationBarTitle(Text("Reserve Meal"))
            
        }
    }
    
    func randomString(length: Int) -> String {
        let letters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
        return String((0..<length).map{ _ in letters.randomElement()! })
    }
    
    func reserveMeal() {
/*
        //print(reservation)
        //self.vm.postReservation(reservation: self.reservation)
      
        let reservation: Reservation = Reservation(id: randomString(length: 16), guest_id: "abc", meal_id: self.meal.id, payment_info: "12345", guest_count: guest_count)
*/
        let meal_total = "$\(meal.price * guest_count)"
        let reservation: Reservation = Reservation(id: randomString(length: 16), guest_id: "abc", meal_id: self.meal.id, payment_info: "12345", guest_count: guest_count, total: meal_total)

        let vm = ReservationViewModel(reservation: reservation)
        vm.postReservation(reservation: reservation)
    }
    
    var reserveButton: some View {
        VStack {
            NavigationLink(destination:  ConfirmationView(reservation: reservation1, meal: self.meal), isActive: self.$isActive) { EmptyView() }
            Button(action: {
                self.reserveMeal()
                self.isActive = true
            }) {  OrangeButton("Confirm") }
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
            Image(systemName: "person.fill").foregroundColor(OrangeColor)
            Text("\(guest_count)").fontWeight(.bold).foregroundColor(OrangeColor)
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
                .foregroundColor(OrangeColor)
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

//@State var confirmAlertPresent = false
//var confirmAlert: Alert {
//    Alert(title: Text("Meal has been reserved!"),
//          message: Text("Click 'View Reservation' to see details."),
//          dismissButton: Alert.Button.default(Text("OK")) {})
//}
