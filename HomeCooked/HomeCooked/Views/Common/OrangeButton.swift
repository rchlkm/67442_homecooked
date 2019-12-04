////
////  OrangeButton.swift
////  HomeCooked
////
////  Created by Rachel Kim on 12/4/19.
////  Copyright © 2019 67442. All rights reserved.
////
//
//import SwiftUI
//
//struct OrangeButton: View {
//    let text: String
//    let action: func
//    init(text: String, action: func) {
//        self.text = text
//        self.action = action
//    }
//    var body: some View {
//        Button(action: {
//            self.action
//        }) {
//            HStack {
//                Spacer()
//                Text(self.text).foregroundColor(Color.white).bold()
//                Spacer()
//            }
//        }
//        .accentColor(Color.black)
//        .padding()
//        .background(Color.orange)
//        .cornerRadius(4.0)
//        .padding(Edge.Set.vertical, 20)
//    }
//}
//
