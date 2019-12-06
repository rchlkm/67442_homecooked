//
//  TextFieldInputView.swift
//  HomeCooked
//
//  Created by Rachel Kim on 12/3/19.
//  Copyright © 2019 67442. All rights reserved.
//

import SwiftUI

struct TextFieldWithBottomLine: View {
    let placeholder: String
    let input: Binding<String>
    let secure: Bool
    private let lineThickness = CGFloat(2.0)

    init(_ placeholder: String, input:Binding<String>, secure: Bool = false) {
        self.placeholder = placeholder
        self.input = input
        self.secure = secure
    }

    var body: some View {
        VStack {
            if self.secure {
                SecureField(self.placeholder, text: self.input)
                    .padding(.leading).padding(.trailing)
                    .frame(width: frame_size)
            } else {
                TextField(self.placeholder, text: self.input)
                    .padding(.leading).padding(.trailing)
                    .frame(width: frame_size)
            }
            HorizontalLine(color: OrangeColor)
        }.padding(.bottom, lineThickness)
    }
}

struct HorizontalLineShape: Shape {
    func path(in rect: CGRect) -> Path {
        let fill = CGRect(x: 0, y: 0, width: rect.size.width, height: rect.size.height)
        var path = Path()
        path.addRoundedRect(in: fill, cornerSize: CGSize(width: 2, height: 2))
        return path
    }
}

struct HorizontalLine: View {
    private var color: Color? = nil
    private var height: CGFloat = 1.0

    init(color: Color, height: CGFloat = 1.0) {
        self.color = color
        self.height = height
    }

    var body: some View {
        HorizontalLineShape().fill(self.color!).frame(minWidth: 0, maxWidth: frame_size-20, minHeight: height, maxHeight: height)
    }
}
