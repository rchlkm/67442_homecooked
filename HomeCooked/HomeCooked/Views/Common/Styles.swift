//
//  Styles.swift
//  HomeCooked
//
//  Created by Rachel Kim on 12/4/19.
//  Copyright © 2019 67442. All rights reserved.
//

import Foundation
import SwiftUI

let OrangeColor = Color(.sRGB, red: 235.0/255.0, green: 134.0/255.0, blue: 85.0/255.0, opacity: 1.0)
let frame_size: CGFloat = UIScreen.main.bounds.width - 48
let corner_radius: CGFloat = 20.0

struct SectionTitle: View {
    let text: String
    init(_ text: String) {
        self.text = text
    }
    var body: some View {
        Text(self.text)
            .font(.headline)
            .padding(.trailing)
    }
}

struct LargeTitle: View {
    let text: String
    init(_ text: String) {
        self.text = text
    }
    var body: some View {
        Text(self.text)
            .font(.largeTitle)
            .bold()
            .padding(.top,40).padding(.bottom,30)
    }
}


//struct MainView: View {
//    let view: View
//    var body: some View {
//        ScrollView {
//            view
//        }.padding(.leading,20).padding(.trailing,20)
//    }
//}
