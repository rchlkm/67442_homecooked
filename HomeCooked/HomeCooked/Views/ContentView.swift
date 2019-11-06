//
//  ContentView.swift
//  HomeCooked
//
//  Created by Albert Yuan on 10/30/19.
//  Copyright © 2019 67442. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            SearchView().tabItem {
                Image(systemName: "magnifyingglass")
                Text("Search")
            }.tag(1)
            BookedMealsView().tabItem {
                Image(systemName: "m.circle")
                Text("Meals")
            }.tag(2)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
