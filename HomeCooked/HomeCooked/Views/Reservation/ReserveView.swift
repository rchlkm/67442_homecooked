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
    let party_size = 3
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
        
        VStack(alignment: .leading) {
            BookedMealItemView(meal: meal).padding()
            Divider()
            Section {
                Text("VISA ******1234")
            }.padding()
            Divider()
            HStack {
                Text("$\(meal.price) x \(party_size) guests")
                Spacer()
                Text("$\(meal.price * party_size)")
                    .foregroundColor(Color.orange)
            }.padding()
            
            
            Divider()
            policy
            
            Spacer()
            reserveButton
            
            Spacer()
            
        }
        .padding(.leading,20).padding(.trailing,20)
        .navigationBarTitle(Text("Reserve Meal"))
        
    }
  

    
    
    func reserveMeal() {
        //        vm.setParams(params: reservation)
      self.vm.postReservation(reservation: self.reservation)
    }
    var reserveButton: some View {
        NavigationLink(destination: BookedMealDetailView(meal: meal)) {
            HStack {
                Button(action: {
                    self.reserveMeal()
                }) {
                    Text("Reserve")
                }
                    .foregroundColor(Color.orange)
            }.font(.caption)
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
