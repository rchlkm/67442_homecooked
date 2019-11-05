//
//  BookedMealDetailView.swift
//  HomeCooked
//
//  Created by Rachel Kim on 11/4/19.
//  Copyright © 2019 67442. All rights reserved.
//

import SwiftUI

struct BookedMealDetailView: View {
    
    let meal: Meal
    init(meal: Meal) {
        self.meal = meal
    }
    
    var body: some View {
        NavigationView {
            ScrollView {
                
                VStack(alignment: .leading) {
                    HStack(alignment: .top) {
//                        Rectangle() // Image(meal.image)
//                            .frame(width: 220, height: 140)
                        BookedMealDetailComponentView(meal_date: "Mon 11/11", meal_time: "6PM", party_size: 3)
                    }//.border(Color.green)
                    Spacer().frame(height: 30.0)
                    
                    LocationView(lat: 34.011286, lng: -116.166868, marker: true)
                    Spacer().frame(height:30.0)
                    
                    ChefInfoView(chef: chef1)
                    
                }
//                .border(Color.purple)
            }
            .navigationBarTitle(meal.name)
//            .border(Color.red)
            .padding(.leading,20).padding(.trailing,20)
        }
        
    }
}


struct BookedMealDetailView_Previews: PreviewProvider {
    static var previews: some View {
        BookedMealDetailView(meal: meal1)
    }
}
