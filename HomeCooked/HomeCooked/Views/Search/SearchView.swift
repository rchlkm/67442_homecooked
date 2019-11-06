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
      @State private var showModal = false
    
    
    @State private var city: String = "Pittsburgh"
    var party_size = 3
    var search_date = "Sat Nov 2"
    
    var filterButton: some View {
        Button(action: {
            self.filterIsPresent.toggle()
    //        DatePicker(selection: .constant(Date()), label: {      })
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
    
    init() {
//        UINavigationBar.appearance().backgroundColor = .green
    }
    var body: some View {
        NavigationView {
            ScrollView {
                VStack (alignment: .leading) {
                    Spacer().frame(height: 20.0)
                    HStack {
                        Image(systemName:"magnifyingglass")
                        TextField("Pittsburgh", text: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Value@*/.constant("")/*@END_MENU_TOKEN@*/)
                            .font(.largeTitle)
                    }
                    .padding(.top, 5).padding(.bottom, 5).padding(.leading).padding(.trailing)
                    .overlay(RoundedRectangle(cornerRadius: 30).stroke(Color.gray))
                    Spacer().frame(height: 15.0)
                    filterButton
                    
//                    ReservationFilterView()
                    
//                        Button("Show Filter") {
//                           self.filterIsPresent.toggle()
//                        }.sheet(isPresented: $filterIsPresent) {
//                             ModalView(showModal: self.$filterIsPresent)
//                                .frame(maxHeight: 300)
//                         }
                    
                    Spacer().frame(height: 30.0)
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
