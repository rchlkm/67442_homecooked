//
//  MealsView.swift
//  HomeCooked
//
//  Created by Albert Yuan on 10/30/19.
//  Copyright © 2019 67442. All rights reserved.
//

import SwiftUI

struct MealsView: View {
    var body: some View {
        NavigationView {
            ScrollView {
                ZStack {
                    VStack(alignment: .leading) {
                        Rectangle() // Image(meal.image)
                            .frame(height: 250)
                        
                        Section {
                            MealDetailsView()
                            Spacer().frame(height: 20.0)
                            
                            ReservationsView()
                            Spacer().frame(height: 20.0)
                            
                            ReviewsView()
                            Spacer().frame(height: 20.0)
                            
                            LocationView()
                            Spacer().frame(height: 20.0)
                            
                            AdditionalInfoView()
                            Spacer().frame(height: 20.0)
                        }.padding(.leading).padding(.trailing)
                        
                    }
                    
                    ReserveButton()
                }
            }
            .navigationBarItems(leading:
                Button(action: {}) {
                    Text("Back")
                }
            ).border(Color.green)
    
        }
    }
}


struct MealDetailsView: View {
    var body: some View {
        VStack(alignment: .leading) {
            Text("MealName")
                .font(.largeTitle)
                .fontWeight(.bold)
            
            Text("This is the meal description and it can be multiple lines long... so im just filling it in with random text just for demo purposes! it should be a max of 4 lines i think??")
        }
    }
}


struct ReservationsView: View {
    var body: some View {
        VStack(alignment: .leading) {
            Text("Reserve Meal")
                .font(.title)
                .fontWeight(.bold)
            
            ReservationFilterView()
            AvailableTimesView()
        }
    }
    
}

struct AvailableTimesView: View {
    
    //    @State private var times = [MealTime]()
    
    var body: some View {
        HStack {
            Text("6 PM")
                .font(.caption)
                .multilineTextAlignment(.center)
                .paddinug(10)
                .overlay(
                    RoundedRectangle(cornerRadius: 20)
                        .stroke(Color.orange, lineWidth: 2)
            )
            
            Text("8 PM")
                .font(.caption)
                .multilineTextAlignment(.center)
                .padding(10)
                .overlay(
                    RoundedRectangle(cornerRadius: 20)
                        .stroke(Color.orange, lineWidth: 2)
            )
            
        }
        .padding(.top, 10)
        
    }
}

struct ReviewsView: View {
    var body: some View {
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
}

struct LocationView: View {
    var body: some View {
        VStack(alignment: .leading) {
            Text("Location")
                .font(.title)
                .fontWeight(.bold)
            
            Section {
                Text("Nord, Hamburg")
                    .font(.body)
                    .fontWeight(.bold)
                //                Text("5 minute walk from")
                //                    .font(.body)
            }.padding(.top, 5)
            
            MapView(lat: 34.011286, lng: -116.166868)
                .frame(height: 150)
        }
    }
}


struct AdditionalInfoView: View {
    var body: some View {
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

struct ReserveButton: View {
    
    // https://medium.com/programming-with-swift/create-a-floating-action-button-with-swiftui-4d05dcddc365
    //    var meal_price = 13
    var body: some View {
        VStack {
            Spacer()
            HStack {
                Spacer()
                Button(action: {
                    print("Hello world")
                    //                self.items.append(Item(value: "Item"))
                }, label: {
                    //                    Text("Reserve Meal\n$\(meal_price) per person")
                    Text("Reserve\n$12")
                        .font(.title)
                        .multilineTextAlignment(.center)
                        .frame(width: 200, height: 70)
                        .foregroundColor(Color.white)
                })
                    .background(Color.blue)
                    .cornerRadius(38.5)
                    .padding()
                    .shadow(color: Color.black.opacity(0.3),
                            radius: 3,
                            x: 3,
                            y: 3)
            }
            
        }
    }
}

struct MealsView_Previews: PreviewProvider {
    static var previews: some View {
        MealsView()
    }
}
