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
        
        if img == "" {
            self.img = "rectangle.fill"
        }
        else {
            self.img = img
        }
    }
    
    var body: some View {
        HStack {
            Image(systemName: self.img) .foregroundColor(Color.orange)
                .frame(width: 20, height: 20)
            
            Text("\(self.text)")
                .font(.body)
                .foregroundColor(Color.black)
        }
//            .border(Color.red)
    }
}
