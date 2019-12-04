//
//  Button.swift
//  HomeCooked
//
//  Created by Rachel Kim on 12/4/19.
//  Copyright © 2019 67442. All rights reserved.
//

import SwiftUI

struct OrangeButton: View {
    let text: String
    init(_ text: String) {
        self.text = text
    }
    var body: some View {
        Text(self.text)
            .font(.body)
            .fontWeight(.bold)
            .foregroundColor(.white)
            .padding()
            .frame(width: frame_size)
            .background(OrangeColor)
            .border(OrangeColor, width: 2)
            .cornerRadius(corner_radius)
            .padding(5)
    }
}

struct WhiteButton: View {
    let text: String
    init(_ text: String) {
        self.text = text
    }
    var body: some View {
        Text(self.text)
            .font(.body)
            .fontWeight(.bold)
            .foregroundColor(OrangeColor)
            .padding()
            .frame(width: frame_size)
            .background(Color.white)
            .clipShape(RoundedRectangle(cornerRadius: corner_radius, style: .continuous))
            .overlay(RoundedRectangle(cornerRadius: corner_radius, style: .continuous)
                .stroke(OrangeColor, lineWidth: 2))
        .padding(5)
    }
}

struct Button_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            OrangeButton("Orange Button")
            Spacer().frame(height: 10.0)
            WhiteButton("White Button")
        }
    }
}
