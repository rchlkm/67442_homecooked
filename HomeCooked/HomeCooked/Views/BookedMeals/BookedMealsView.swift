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
            ZStack {
                Text("Upcoming Meals")
            }
            
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
