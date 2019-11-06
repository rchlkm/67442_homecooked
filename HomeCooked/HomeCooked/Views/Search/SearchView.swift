//
//  SearchView.swift
//  HomeCooked
//
//  Created by Albert Yuan on 10/30/19.
//  Copyright © 2019 67442. All rights reserved.
//

import SwiftUI

struct SearchView: View {
    @State var selectedView = 1
    
    @State private var city: String = "Pittsburgh"
    var party_size = 3
    var search_date = "Sat Nov 2"
    
    init() {
        UINavigationBar.appearance().backgroundColor = .green
    }
    
    var body: some View {
        NavigationView {
            ScrollView {
                //                Spacer()
                VStack(alignment: .leading) {
                    ForEach(search_items, id: \.id) { meal in
                        MealListItemView(type: "search", meal: meal)
                            .padding(.bottom, 20)
                    }
                }
            }
                //            .navigationBarBackButtonHidden(true)
                .navigationBarItems(leading:
                    VStack (alignment: .leading) {
                        //                    Spacer()
                        HStack {
                            Image(systemName:"magnifyingglass")
                            TextField("Pittsburgh", text: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Value@*/.constant("")/*@END_MENU_TOKEN@*/)
//                                                    .font(.largeTitle)
                        }
                        //                    .overlay(RoundedRectangle(cornerRadius: 30).stroke(Color.gray))
                        //  .padding(.top, 5).padding(.bottom, 5).padding(.leading).padding(.trailing)
                        
                        //
                        //                    Text("\(city)").font(.largeTitle)
                        //                        .padding(.top, 5).padding(.bottom, 5).padding(.leading).padding(.trailing)
                        //                        .overlay(
                        //                            RoundedRectangle(cornerRadius: 30)
                        //                                .stroke(Color.gray)
                        //                        )
                        //                    Spacer()
                        //                    ReservationFilterView()
                        
                    }//.padding(.top, 50)
            )
        }
        
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
