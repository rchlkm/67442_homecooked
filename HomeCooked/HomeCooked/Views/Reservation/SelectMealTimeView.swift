//
//  SelectMealTimeView.swift
//  HomeCooked
//
//  Created by Rachel Kim on 11/3/19.
//  Copyright © 2019 67442. All rights reserved.
//

import SwiftUI

struct ReserveView: View {
    let meal: Meal
    init(meal: Meal) {
        self.meal = meal
    }
    var body: some View {
        //        NavigationView {
        
        VStack(alignment: .leading) {
            Text("MealName")
                .font(.title)
                .fontWeight(.bold)
            ReservationFilterView()
            Spacer()
            
            
            NavigationLink(destination: BookedMealDetailView(meal: meal)) {
                HStack {
                   Text("Reserve")
                        .padding(.trailing, 10)
                }.font(.caption)
                    .padding(10)
                    .overlay(
                        RoundedRectangle(cornerRadius: 20)
                            .stroke(Color.gray, lineWidth: 0.5)
                )
            }
            
            
        }.border(Color.green)
        
        
        
        
    }
    
    
    
    
}

struct SelectMealTimeView_Previews: PreviewProvider {
    static var previews: some View {
        ReserveView(meal:meal1)
    }
}
