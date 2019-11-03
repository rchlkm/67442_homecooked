//
//  SearchItemView.swift
//  HomeCooked
//
//  Created by Rachel Kim on 11/3/19.
//  Copyright © 2019 67442. All rights reserved.
//

import SwiftUI

struct SearchItemView: View {
    let name: String
    
    init(name: String) {
        self.name = name
    }
    
    var body: some View {
        VStack {
            Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {
                Text(name)
            }
                .frame(height: 80)
                .padding(.leading, 10)
                .padding(.trailing, 10)
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.orange, lineWidth: 2)
                )
        
        }.padding(.trailing, 20)
    }
}


//Text("item 1")
//.padding()
//.padding(.leading, 100)
//.padding(.trailing, 100)
//.overlay(
//    RoundedRectangle(cornerRadius: 10)
//        .stroke(Color.black)
//)
