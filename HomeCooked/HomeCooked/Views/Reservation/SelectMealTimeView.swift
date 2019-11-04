//
//  SelectMealTimeView.swift
//  HomeCooked
//
//  Created by Rachel Kim on 11/3/19.
//  Copyright © 2019 67442. All rights reserved.
//

import SwiftUI

struct SelectMealTimeView: View {
    var body: some View {
        NavigationView {
        
            VStack(alignment: .leading) {
                Text("MealName")
                    .font(.title)
                    .fontWeight(.bold)
                ReservationFilterView()
                Spacer()
            }.border(Color.green)
            
        }
        .navigationBarItems(leading:
            Button(action: {}) {
                Text("Back")
            }
        )
        
    }
}

struct SelectMealTimeView_Previews: PreviewProvider {
    static var previews: some View {
        SelectMealTimeView()
    }
}
