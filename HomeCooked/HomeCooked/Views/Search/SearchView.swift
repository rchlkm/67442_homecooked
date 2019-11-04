//
//  SearchView.swift
//  HomeCooked
//
//  Created by Albert Yuan on 10/30/19.
//  Copyright © 2019 67442. All rights reserved.
//

import SwiftUI

struct SearchView: View {
    @State private var city: String = "Hamburg"
    var party_size = 3
    var search_date = "Sat Nov 2"
    
    var body: some View {
        NavigationView {
            ScrollView {
                Spacer()
                VStack(alignment: .leading) {
                    ForEach(search_items, id: \.id) { meal in
                        SearchItemView(meal: meal)
                            .padding(.bottom, 20)
                    }
                }
            }
        
            .navigationBarItems(leading:
                VStack (alignment: .leading) {
                    Spacer()
                    Text(city).font(.largeTitle)
                        .padding(.top, 5).padding(.bottom, 5).padding(.leading).padding(.trailing)
                        .overlay(
                            RoundedRectangle(cornerRadius: 30)
                                .stroke(Color.gray)
                        )
                    Spacer()
                    
                    ReservationFilterView()
                }.padding(.top, 50)

            )
            
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
