//
//  BookedMealsView.swift
//  HomeCooked
//
//  Created by Rachel Kim on 11/4/19.
//  Copyright © 2019 67442. All rights reserved.
//

import SwiftUI

struct BookedMealsView: View {
    var body: some View {
        NavigationView {
            ScrollView {
                Spacer()
                VStack(alignment: .leading) {
                    
                    Text("Upcoming Meals")
                        .font(.title)
                    ForEach(bookedMeal_items, id: \.id) { reservation in
                        MealListItemView(type: "bookedMeal", meal: getMealsByIdFromReservation(reservation: reservation))
                            .padding(.bottom, 20)
                    }
                    
                    Divider()
                    
                    Text("Past Meals")
                        .font(.title)
                    ForEach(pastMeal_items, id: \.id) { reservation in
                        MealListItemView(type: "bookedMeal", meal: getMealsByIdFromReservation(reservation: reservation))
                            .padding(.bottom, 20)
                    }
                
                }.padding(20)
            }
            .navigationBarTitle("Meals")
            
        }
    }
}

struct BookedMealsView_Previews: PreviewProvider {
    static var previews: some View {
        BookedMealsView()
    }
}
