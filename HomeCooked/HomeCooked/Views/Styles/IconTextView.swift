//
//  IconTextView.swift
//  HomeCooked
//
//  Created by Rachel Kim on 11/4/19.
//  Copyright © 2019 67442. All rights reserved.
//

import SwiftUI

struct IconTextView: View {
    let text: String
    let img: String
    init(text: String, img: String) {
        self.text = text
        self.img = img
    }
    var body: some View {
        
        HStack {
            Rectangle()
                .frame(width: 20, height: 20)
                .foregroundColor(Color.orange)
            Text("\(self.text)")
                .font(.body)
                .foregroundColor(Color.black)
        }
//        .padding(5) //10
//        .border(Color.åred)
//        .overlay(
//            RoundedRectangle(cornerRadius: 20)
//                .stroke(Color.gray, lineWidth: 0.5)
//        )
        
    }
}
