//
//  SearchView.swift
//  HomeCooked
//
//  Created by Albert Yuan on 10/30/19.
//  Copyright © 2019 67442. All rights reserved.
//

import SwiftUI

struct SearchView: View {
    @State var filterIsPresent = false
    @State var search_city: String = ""
    @State var party_size: Int = 2
    @State var search_month: Int = 11
    @State var search_day: Int = 8
    let vm = SearchViewModel()
    
    
    var search_results: [Meal] = [Meal]()
    
    func submitSearch() {
      let search_params = SearchParams(city: self.search_city, month: self.search_month, day: self.search_day, party_size: self.party_size)
      // do something here with results
      let search_results = vm.search(params: search_params)
    }
    
    var searchEngine: some View {
        HStack {
            Image(systemName:"magnifyingglass")
            TextField("Search", text: $search_city)
                .font(.title)
            
                Button(action: {
                    self.submitSearch()
                }) {
                    Text("Search")
                }
        }
        .padding(.top, 5).padding(.bottom, 5).padding(.leading).padding(.trailing)
        .overlay(RoundedRectangle(cornerRadius: 30).stroke(Color.gray))
    }
    
    
    var filterButton: some View {
        Button(action: {
            self.filterIsPresent.toggle()
        }) {
            HStack {
                IconTextView(text: "Party of 3", img: "person.fill")
                    .padding(.trailing, 15)
                MealDateView(meal_date: "Fri 11/8")
                    .padding(.trailing, 10)
            }.font(.caption)
                .padding(10)
                .overlay(
                    RoundedRectangle(cornerRadius: 20)
                        .stroke(Color.gray, lineWidth: 0.5)
            )
        }
        .sheet(isPresented: $filterIsPresent) {
            ModalView(showModal: self.$filterIsPresent)
                .frame(maxHeight: 300)
        }
    }
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack (alignment: .leading) {
                    Spacer().frame(height: 20.0)
                    
                    searchEngine
                    Spacer().frame(height: 15.0)
                    
                    filterButton
                    Spacer().frame(height: 30.0)
                    
//                     search_results
                    ForEach(search_items, id: \.id) { meal in
                        MealListItemView(type: "search", meal: meal)
                            .padding(.bottom, 20)
                    }
                }
            }
            .padding(.leading,20).padding(.trailing,20)
            .navigationBarHidden(true)
            .navigationBarTitle(Text("Search"))
        }.navigationBarBackButtonHidden(true)
    }
}


struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
