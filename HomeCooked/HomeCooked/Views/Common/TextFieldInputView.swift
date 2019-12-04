//
//  TextFieldInputView.swift
//  HomeCooked
//
//  Created by Rachel Kim on 12/3/19.
//  Copyright © 2019 67442. All rights reserved.
//

import SwiftUI

struct TextFieldInputView: View {
    let placeholder: String
    let input: Binding<String>
    
    var body: some View {
        TextField(self.placeholder, text: self.input)
            .padding(.top, 5).padding(.bottom, 5).padding(.leading).padding(.trailing)
            .overlay(RoundedRectangle(cornerRadius: 30).stroke(Color.gray))
    }
}
