//
//  MealDetailsView.swift
//  HomeCooked
//
//  Created by Albert Yuan on 10/30/19.
//  Copyright © 2019 67442. All rights reserved.
//

import SwiftUI

struct MealDetailsView: View {
    let meal: Meal
    @State var modalIsPresent = false
    init(meal: Meal) {
        self.meal = meal
    }
    
    var body: some View {
        //        NavigationView {
        ScrollView {
            VStack(alignment: .leading) {
                Rectangle() // Image(meal.image)
                    .frame(height: 250)
                    .offset(y:-20)
                
                Section {
                    description
                    Spacer().frame(height: 20.0)
                    
                    reservations
                    Spacer().frame(height: 20.0)
                    
                    reviews
                    Spacer().frame(height: 20.0)
                    
                    LocationView(meal: meal)
                    Spacer().frame(height: 20.0)
                    
                    additionalInfo
                    Spacer().frame(height: 20.0)
                }.padding(.leading,20).padding(.trailing,20)
            }
        }
            //            .navigationBarBackButtonHidden(true)
            .navigationBarHidden(true)
            //            .navigationBarTitle(Text("Book Measl"))
            .edgesIgnoringSafeArea([.top])
        //        }
    }
    
    var description: some View {
        VStack(alignment: .leading) {
            Text(meal.name)
                .font(.largeTitle)
                .fontWeight(.bold)
            
            Text("This is the meal description and it can be multiple lines long... so im just filling it in with random text just for demo purposes! it should be a max of 4 lines i think??")
        }
    }
    
    var reserveButton: some View {
        
        NavigationLink(destination: ReserveView(meal: meal1)) {
            HStack {
                MealDateView(meal_date: "\(meal.date()) \(meal.time)")
                    .padding(.trailing, 10)
            }.font(.caption)
                .padding(10)
                .overlay(
                    RoundedRectangle(cornerRadius: 20)
                        .stroke(Color.gray, lineWidth: 0.5)
            )
        }
        
        //        Button(action: {
        //            self.modalIsPresent.toggle()
        //        }) {
        //            HStack {
        //                MealDateView(meal_date: "\(meal.date()) \(meal.time)")
        //                    .padding(.trailing, 10)
        //            }.font(.caption)
        //                .padding(10)
        //                .overlay(
        //                    RoundedRectangle(cornerRadius: 20)
        //                        .stroke(Color.gray, lineWidth: 0.5)
        //            )
        //        }
        //        .sheet(isPresented: $modalIsPresent) {
        //            ReservationModalView(showModal: self.$modalIsPresent)
        //        }
    }
    
    var reservations: some View {
        VStack(alignment: .leading) {
            Text("Reserve Meal")
                .font(.title)
                .fontWeight(.bold)
            Text("$\(meal.price) per person")
            reserveButton
        }
    }
    
    var reviews: some View {
        VStack(alignment: .leading) {
            Text("Reviews" + " (5)")
                .font(.title)
                .fontWeight(.bold)
            
            Section {
                Text("4.7")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(Color.orange)
            }
        }.padding(.top, 5)
    }
    
    var additionalInfo: some View {
        VStack(alignment: .leading) {
            Text("Additional Information")
                .font(.title)
                .fontWeight(.bold)
            
            Text("Food Policy")
                .font(.headline)
                .fontWeight(.bold)
                .padding(.top, 10)
            
            Text("This is another multiline text block with lots of information asdfgtyjuk.")
                .font(.subheadline)
            
            Text("Cancellation Policy")
                .font(.body)
                .fontWeight(.bold)
                .padding(.top, 15)
            
            Text("This is another multiline text block with lots of information asdfgtyjuk.")
                .font(.subheadline)
        }
        .padding(.top, 10)
    }
    
}



struct ReservationModalView: View {
    @Binding var showModal: Bool
    //    let meal: Meal
    //
    //    init(meal: Meal) {
    //        self.meal = meal
    //    }
    
    var body: some View {
        VStack {
            Text("Reserve Meal")
                .padding()
            
            NavigationLink(destination: BookedMealDetailView(meal: meal1)) {
                //                Button("Reserve") {
                //                    self.showModal.toggle()
                //                }
                Text("Pay Now")
            }
            
            
        }
    }
}
//struct ModalView2_Previews: PreviewProvider {
//    static var previews: some View {
//        ReservationModalView(showModal: .constant(true))
//    }
//}




struct MealsView_Previews: PreviewProvider {
    static var previews: some View {
        MealDetailsView(meal: meal1)
    }
}
