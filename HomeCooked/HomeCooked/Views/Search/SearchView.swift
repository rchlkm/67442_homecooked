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
    @ObservedObject var vm : SearchViewModel
    /*
     let vm = SearchViewModel()
     @State var search_results: [Meal] = [Meal]()
     @State var updated: Bool = false
     */
    
    @State private var didTap: Bool = false
    
    init(){
        self.vm = SearchViewModel()
    }
    
    var body: some View {
        ScrollView {
            VStack (alignment: .leading) {
                Spacer().frame(height: 20.0)
                
                searchEngine
                Spacer().frame(height: 15.0)
                
                filterButton
                Spacer().frame(height: 30.0)
                
                //                    ForEach(self.vm.meals, id: \.id) { meal in
                ForEach(search_items, id: \.id) { meal in
                    MealListItemView(type: "search", meal: meal, reservation: nil, search_guest_count: self.guest_count)
                        .padding(.bottom, 15)
                }
            }
        }.border(Color.blue)
            .padding(.leading,20).padding(.trailing,20)
            .navigationBarTitle("Search")
            .navigationBarBackButtonHidden(true)
            .navigationBarHidden(true)
    }
    
    func submitSearch() {
        /*
         let search_params = SearchParams(city: self.search_city, year: self.search_date.year, month: self.search_date.month, day: self.search_date.day, max_guest_count: self.max_guest_count)
         // do something here with results
         self.search_results = vm.search(params: search_params)
         print(self.search_results)
         self.updated = !self.updated
         print(self.updated)
         */
        let search_params = SearchParams(city: self.search_city, year: self.search_date.year, month: self.search_date.month, day: self.search_date.day, max_guest_count: self.guest_count)
        
        self.vm.search(params: search_params)
        print(self.vm.meals)
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
            Spacer()
            Text("Filter")
                .font(.title)
                .fontWeight(.bold)
                .padding()
            
            SectionTitle("Party Size")
            Stepper(value: $guest_count, in: 1...10, label: {
                Image(systemName: "person.fill").foregroundColor(OrangeColor)
                Text("\(guest_count)")
            }).frame(width:200)
                .padding(.bottom, 20)
            
            SectionTitle("Choose a Date")
            DatePicker(selection: $search_date, in: Date()..., displayedComponents: .date) {
                Text("")
            }.padding(.bottom, 20)
            
            //            dietaryFilters.padding(.bottom, 20)
            cuisineFilters.padding(.bottom, 20)
            allergensFilters.padding(.bottom, 40)
            Button(action: {
                self.filterIsPresent.toggle()
            }) { OrangeButton("Apply") }
            
        }.padding()
    }
    
    
    @State var filter_vegetarian = false
    @State var filter_vegan = false
    @State var filter_halal = false
    let search_filters = ["Vegetarian", "Vegan", "Halal"]
    var dietaryFilters: some View {
        VStack {
            SectionTitle("Dietary").padding(.bottom)
            HStack {
                ForEach(search_filters, id: \.self) { filter in
                    Button(action: {
                        switch filter {
                        case "Vegetarian": self.filter_vegetarian.toggle()
                        case "Vegan": self.filter_vegan.toggle()
                        case "Halal": self.filter_halal.toggle()
                        default: self.filter_vegetarian.toggle()
                        }
                    }) {
                        if filter == "Vegetarian" {
                            OptionButton(filter, didTap: self.filter_vegetarian)
                        } else if filter == "Vegan" {
                            OptionButton(filter, didTap: self.filter_vegan)
                        } else if filter == "Halal" {
                            OptionButton(filter, didTap: self.filter_halal)
                        }
                    }
                }
            }
        }
    }
    
    @State var cuisine_asian = false
    @State var cuisine_american = false
    @State var cuisine_italian = false
    @State var cuisine_mexican = false
    @State var cuisine_mediterranean = false
    let cuisine_filters = ["Asian", "American", "Italian", "Mexican", "Mediterranean"]
    var cuisineFilters: some View {
        VStack {
            SectionTitle("Cuisine").padding(.bottom)
            HStack {
                ForEach(cuisine_filters, id: \.self) { filter in
                    Button(action: {
                        switch filter {
                        case "Asian": self.cuisine_asian.toggle()
                        case "American": self.cuisine_american.toggle()
                        case "Italian": self.cuisine_italian.toggle()
                        case "Mexican": self.cuisine_mexican.toggle()
                        case "Mediterranean": self.cuisine_mediterranean.toggle()
                        default: self.cuisine_mediterranean.toggle()
                        }
                    }) {
                        if filter == "Asian" {
                            OptionButton(filter, didTap: self.cuisine_asian)
                        } else if filter == "American" {
                            OptionButton(filter, didTap: self.cuisine_american)
                        } else if filter == "Italian" {
                            OptionButton(filter, didTap: self.cuisine_italian)
                        } else if filter == "Mexican" {
                            OptionButton(filter, didTap: self.cuisine_mexican)
                        } else if filter == "Mediterranean" {
                            OptionButton(filter, didTap: self.cuisine_mediterranean)
                        }
                    }
                }
            }
        }
    }
    
    @State var allergens_nuts = false
    @State var allergens_shellfish = false
    @State var allergens_dairy = false
    @State var allergens_fish = false
    @State var allergens_soy = false
    let allergen_filters = ["Nuts", "Shellfish", "Dairy", "Fish", "Soy"]
    var allergensFilters: some View {
        VStack {
            SectionTitle("Allergens").padding(.bottom)
            HStack {
                ForEach(allergen_filters, id: \.self) { filter in
                    Button(action: {
                        switch filter {
                            case "Nuts": self.allergens_nuts.toggle()
                            case "Shellfish": self.allergens_shellfish.toggle()
                            case "Dairy": self.allergens_dairy.toggle()
                            case "Fish": self.allergens_fish.toggle()
                            case "Soy": self.allergens_soy.toggle()
                        default: self.allergens_nuts.toggle()
                        }
                    }) {
                        if filter == "Nuts" {
                            OptionButton(filter, didTap: self.allergens_nuts)
                        } else if filter == "Shellfish" {
                            OptionButton(filter, didTap: self.allergens_shellfish)
                        } else if filter == "Dairy" {
                            OptionButton(filter, didTap: self.allergens_dairy)
                        } else if filter == "Fish" {
                            OptionButton(filter, didTap: self.allergens_fish)
                        } else if filter == "Soy" {
                            OptionButton(filter, didTap: self.allergens_soy)
                        }
                    }
                }
            }
        }
    }
    
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
