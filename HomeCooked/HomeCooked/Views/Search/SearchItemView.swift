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
                
                .padding(30)
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.orange, lineWidth: 2)
                )
        
        }
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
