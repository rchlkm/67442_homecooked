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
                BookedMealDetailComponentView(meal_date: "Mon 11/11", meal_time: "6PM", party_size: 3)
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
