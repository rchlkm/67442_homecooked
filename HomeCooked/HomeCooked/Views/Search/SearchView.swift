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
    @State var guest_count: Int = 2
    @State var search_date = Date()
    
    let vm = SearchViewModel()
    @State var search_results: [Meal] = [Meal]()
    
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
                        MealListItemView(type: "search", meal: meal, search_guest_count: self.guest_count)
                            .padding(.bottom, 15)
                    }
                }
            }
            .padding(.leading,20).padding(.trailing,20)
            .navigationBarHidden(true)
            .navigationBarTitle(Text("Search"))
        }.navigationBarBackButtonHidden(true)
    }
    
    func submitSearch() {
      let search_params = SearchParams(city: self.search_city, year: self.search_date.year, month: self.search_date.month, day: self.search_date.day, max_guest_count: self.guest_count)
        // do something here with results
        print("Hellooooo")
        self.search_results = vm.search(params: search_params)
        print(self.search_results)
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
    
    
    func formatDate(date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "EE MM/d"
        return formatter.string(from: date)
    }
    
    var filterButton: some View {
        Button(action: {
            self.filterIsPresent.toggle()
        }) {
            HStack {
                IconTextView(text: "\(guest_count)", img: "person.fill")
                    .padding(.trailing, 10)
                
                MealDateView(meal_date: formatDate(date: search_date))
                    .padding(.trailing, 10)
            }.font(.caption)
                .padding(10)
                .overlay(
                    RoundedRectangle(cornerRadius: 20)
                        .stroke(Color.gray, lineWidth: 0.5)
            )
        }
        .sheet(isPresented: $filterIsPresent) {
            self.filterModal
                .frame(maxHeight: 300)
        }
    }
    
    var filterModal: some View {
        VStack {
            Text("Filter")
                .font(.title)
                .fontWeight(.bold)
                .padding()
            
            Stepper(value: $guest_count, in: 1...10, label: {
                Image(systemName: "person.fill").foregroundColor(Color.orange)
                Text("\(guest_count)")
            }).frame(width:200)
            .padding(30)
            
            DatePicker(selection: $search_date, in: Date()..., displayedComponents: .date) {
                Text("")
            }
            
            Button("Apply") {
                self.filterIsPresent.toggle()
            }
        }.padding()
    }
}


struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
