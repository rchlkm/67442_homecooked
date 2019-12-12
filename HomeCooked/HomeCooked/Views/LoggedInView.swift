//
//  LoggedInView.swift
//  HomeCooked
//
//  Created by Rachel Kim on 12/3/19.
//  Copyright © 2019 67442. All rights reserved.
//

import SwiftUI

struct LoggedInView: View {
    @State var selection = 1
    let vm = BookedMealViewModel()
    let view = BookedMealsView()
    
    init(_ tabSelection: Int = 1) {
        if tabSelection == 2 {
            self.selection = tabSelection
        }
      self.view.updateBookedMeals()
      //self.vm.updateBookedMeals(user_id: "tg0jwBTBFrdJHOfkdFTz") {
        //(reservationMeals) in
        //view.reservations = reservationMeals
      //}
    }
    var body: some View {
        TabView(selection:$selection) {
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

struct LoggedInView2: View {
    @State var selection = 2
    init(_ tabSelection: Int = 1) {
        if tabSelection == 2 {
            self.selection = tabSelection
        }
    }
    var body: some View {
        TabView(selection:$selection) {
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

struct LoggedInView_Previews: PreviewProvider {
    static var previews: some View {
        LoggedInView()
    }
}
