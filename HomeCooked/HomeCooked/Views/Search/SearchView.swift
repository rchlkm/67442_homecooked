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
    
    var body: some View {
        NavigationView {
            ScrollView {
                Spacer()
                VStack(alignment: .leading) {
                    ForEach(search_items, id: \.id) { meal in
                        SearchItemView(name: meal.name)
                    }
                }
            }
            .navigationBarItems(leading:
                VStack (alignment: .leading) {
                    Spacer()
                    Text(city).font(.largeTitle)
                        .padding(.leading)
                        .padding(.trailing)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color.black)
                    )
                    Spacer()
                    Text("3P   Sat Nov 2")
                        .padding(.leading)
                        .padding(.trailing)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color.black)
                    )
                }
            )
            
        }
    }
}



struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
