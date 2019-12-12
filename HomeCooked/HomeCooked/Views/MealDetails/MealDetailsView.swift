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
    @ObservedObject var vm : MealDetailViewModel
    @State var chef: Chef?
    let search_guest_count: Int // used for default count when making reservation
    
    let urlString = "https://www.raspberrykiss.co.uk/wp-content/uploads/2018/07/Shin-Ramyun-The-Best-Spicy-Instant-Noodles.jpg"
    
    
    
    init(meal: Meal, search_guest_count: Int = 1) {
        self.meal = meal
        self.search_guest_count = search_guest_count
        self.vm = MealDetailViewModel(meal: meal)
    }
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                //            VStack {
                //              ImageView(urlString: self.meal.images[0])
                Image(meal.name).resizable()
                    .frame(width:frame_size+48, height: 250)
                    .offset(y:-10)
                //                Rectangle() // Image(meal.image)
                
                //UIImageView(data: Data(contentsOf: self.url))
                //.frame(height: 250)
                //.offset(y:-20)
                
                Section {
                    description
                    Spacer().frame(height: 20.0)
                    
                    reservations
                    Spacer().frame(height: 20.0)
                    
                    LocationView(meal: meal)
                    Spacer().frame(height: 20.0)
                    
                    additionalInfo
                    Spacer().frame(height: 20.0)
                }.padding(.leading,20).padding(.trailing,20)
            }
        }
        .navigationBarHidden(true)
        .edgesIgnoringSafeArea([.top])
    }
    
    @State var button_is_active = false
//    @State var chef: Chef?
    func get_chef() {
        print("getting the chef!!")
        self.vm.getChef(chef_id: self.meal.chef_id) {
            (chef) in
          if let temp = chef {
            self.chef = temp
          }
          if self.chef != nil {
              print("chef found!")
              self.button_is_active = true
          } else {
              print("the chef is nil")
          }
        }
    }
    var description: some View {
        VStack(alignment: .leading) {
            HStack {
                Text(meal.name).font(.largeTitle).bold()
                Spacer()
                //                NavigationLink(destination: ChefDetailsView(chef: chef1)) {
                //                    Text("By Chef")
                //                }

                if self.vm.chef != nil {
                    NavigationLink(destination: ChefDetailsView(chef: self.vm.chef!), isActive: self.$button_is_active) { EmptyView() }
                }
                Button(action: {
                    self.get_chef()
                }) {
                    Text("BY CHEF")
                }
                
                                
            }
            Text(meal.description)
            Text(meal.chef_id)
            Spacer().frame(height: 20.0)
            
        }
    }
    
    
    var reserveButton: some View {
        NavigationLink(destination: ReserveView(meal: meal, search_guest_count: search_guest_count)) {
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
    }
    
    var reservations: some View {
        VStack(alignment: .leading) {
            SectionTitle("Reserve Meal")
            Text("$\(meal.price) per person")
            reserveButton
        }
    }
    
    var additionalInfo: some View {
        VStack(alignment: .leading) {
            SectionTitle("Additional Information")
            
            Text("Food Policy")
                .font(.caption)
                .fontWeight(.bold)
                .padding(.top, 10)
            Text(meal.food_policy)
                .font(.footnote)
            
            Text("Cancellation Policy")
                .font(.caption)
                .fontWeight(.bold)
                .padding(.top, 15)
            Text(meal.cancellation_policy)
                .font(.footnote)
        }
        .padding(.top, 10)
    }
}

struct MealsView_Previews: PreviewProvider {
    static var previews: some View {
        MealDetailsView(meal: meal1)
    }
}
