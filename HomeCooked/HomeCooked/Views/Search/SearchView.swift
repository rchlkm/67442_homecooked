//
//  SearchView.swift
//  HomeCooked
//
//  Created by Albert Yuan on 10/30/19.
//  Copyright © 2019 67442. All rights reserved.
//

import SwiftUI

struct SearchView: View {
    @State private var city: String = ""
    
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
                    Text("Hamburg").font(.largeTitle)
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



struct AvailableTime: View {
    
    var body: some View {
        HStack {
            Text("6 PM")
                .font(.caption)
                .multilineTextAlignment(.center)
                .padding(10)
                .overlay(
                    RoundedRectangle(cornerRadius: 20)
                        .stroke(Color.orange, lineWidth: 2)
            )
            
            Text("8 PM")
                .font(.caption)
                .multilineTextAlignment(.center)
                .padding(10)
                .overlay(
                    RoundedRectangle(cornerRadius: 20)
                        .stroke(Color.orange, lineWidth: 2)
            )
            
        }
        .padding(.top, 10)
        
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
