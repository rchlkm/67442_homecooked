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
    @State var button_is_active = false
    @State var paymentValid = false
    
    @State var card_number: String = ""
    @State var expiration_month: String = ""
    @State var expiration_year: String = ""
    @State var security_code: String = ""
    
    init(meal: Meal, search_guest_count: Int = 1) {
        self.meal = meal
    }
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                meal_details.padding()
                Divider()
                
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
    
      func matchRegex(regex: String, text: String) -> Bool {
          do {
              let regex = try NSRegularExpression(pattern: regex, options: [.caseInsensitive])
              let nsString = text as NSString
              let match = regex.firstMatch(in: text, options: [], range: NSMakeRange(0, nsString.length))
              return (match != nil)
          } catch {
              return false
          }
      }
      
      func reserveMeal() {
        print("trying to reserve the meal!!!!")
          let meal_total = "$\(meal.price * guest_count)"
        if self.valid_payment() {
            let reservation: Reservation = Reservation(id: randomString(length: 16), user_id: "tg0jwBTBFrdJHOfkdFTz", meal_id: self.meal.id, guest_count: guest_count, total: meal_total, card_number: self.card_number, exp_month: self.expiration_month, exp_year: self.expiration_year, cv2: self.security_code)
              let vm = ReservationViewModel(reservation: reservation)
              vm.postReservation(reservation: reservation)
          } else {
              // if invalid payment...
              print("invalid payment")
          }
        self.button_is_active = true
      }
    
    func valid_payment() -> Bool {
        print("checking if it is valid payment!!")
        if ((matchRegex(regex: "^4[0-9]{12}(?:[0-9]{3})?$", text: self.card_number) //||
//        matchRegex(regex: "^(?:5[1-5][0-9]{2}|222[1-9]|22[3-9][0-9]|2[3-6][0-9]{2}|27[01][0-9]|2720)[0-9]{12}$", text: self.card_number) ||
//        matchRegex(regex: "^3[47][0-9]{13}$", text: self.card_number) ||
//        matchRegex(regex: "^6(?:011|5[0-9]{2})[0-9]{12}$", text: self.card_number)
            && (Int(self.expiration_month) != nil) && (Int(self.expiration_year) != nil) &&
            Int(self.expiration_month)! >= 0 && Int(self.expiration_month)! <= 12 &&
            Int(self.expiration_year)! >= 2019 &&
            self.security_code.count == 3)
       ) {
            print("VALID payment")
            return true
        } else {
            print("INvalid payment")
            return false
        }
        
    }
    
//    func buttonClickable() -> Bool {
////        return self.$isActive && self.$ibutton_is_active
//    }
    
    
    var reserveButton: some View {
        Section {
            NavigationLink(destination:  ConfirmationView(meal: self.meal, reservation: reservation1), isActive: self.$button_is_active) { EmptyView() }
            Button(action: {
                do {
                    self.reserveMeal()
                } catch {
                    print("reservation shouldn't be allowed!!")
                }
            }) {
                if (self.valid_payment()) {
                    OrangeButton("Confirm")
                } else {
                    WhiteButton("Confirm")
                }
                
            }.disabled(!self.valid_payment())
        }
    }
    
    var meal_details: some View {
        VStack(alignment: .leading) {
            Text(meal.name)
                .font(.body)
                .fontWeight(.bold)
            MealDateView(meal_date: meal.date())
            MealTimeView(meal_time: meal.time)
        }
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
            SectionTitle("Payment")
            TextField("Card Number (VISA)", text: $card_number)
            HStack {
                TextField("Month (MM)", text: $expiration_month)
                TextField("Year (YYYY)", text: $expiration_year)
            }
            TextField("Security Code", text: $security_code)
            //        TextFieldWithBottomLine("Card Number", input: $card_number)
            //        HStack {
            //            TextFieldWithBottomLine("Month", input: $expiration_month)
            //            TextFieldWithBottomLine("Year", input: $expiration_year)
            //        }
            //        TextFieldWithBottomLine("Security Code", input: $security_code)
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
