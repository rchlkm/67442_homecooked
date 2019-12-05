//
//  OptionButton.swift
//  HomeCooked
//
//  Created by Rachel Kim on 12/4/19.
//  Copyright © 2019 67442. All rights reserved.
//

import SwiftUI

struct OptionButton: View {
    @State private var didTap: Bool = false
    let text: String
    init(_ text: String) {
        self.text = text
    }
    var body: some View {
        Button(action: {
            self.didTap.toggle()
        }) {
            Text(self.text)
                .font(.footnote)
                .foregroundColor(didTap ? Color.white : Color.black)
                .padding(8)
                .background(didTap ? OrangeColor : Color.white)
                .clipShape(RoundedRectangle(cornerRadius: corner_radius, style: .continuous))
                .overlay(RoundedRectangle(cornerRadius: corner_radius, style: .continuous)
                    .stroke(OrangeColor, lineWidth: 1))
                .padding(5)
        }
    }
}

struct OptionButton_Previews: PreviewProvider {
    static var previews: some View {
        OptionButton("Option")
    }
}
