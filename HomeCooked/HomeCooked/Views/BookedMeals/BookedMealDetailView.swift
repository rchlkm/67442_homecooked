//
//  BookedMealDetailView.swift
//  HomeCooked
//
//  Created by Rachel Kim on 11/4/19.
//  Copyright © 2019 67442. All rights reserved.
//

import SwiftUI

struct BookedMealDetailView: View {
    var body: some View {
        NavigationView {
            ScrollView {
                
                VStack(alignment: .leading) {
                    HStack(alignment: .top) {
                        Rectangle() // Image(meal.image)
                            .frame(width: 220, height: 140)
                        BookedMealDetailComponentView(meal_date: "Mon 11/11", meal_time: "6PM", party_size: 3)
                            .padding(.leading, 10)
                    }
                    Spacer().frame(height: 20.0)
                    
                    LocationView(lat: 34.011286, lng: -116.166868, marker: true)
                    Spacer().frame(height: 20.0)
                    
                    ChefInfoView(chef: chef1)
                    
                }.padding(.leading).padding(.trailing)
                //.border(Color.red)
            }
            .navigationBarTitle("Meal.Name")
        }
        
    }
}


struct BookedMealDetailView_Previews: PreviewProvider {
    static var previews: some View {
        BookedMealDetailView()
    }
}
