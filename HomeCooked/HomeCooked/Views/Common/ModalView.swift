//
//  ModalView.swift
//  HomeCooked
//
//  Created by Rachel Kim on 11/6/19.
//  Copyright © 2019 67442. All rights reserved.
//

import SwiftUI

struct ModalView: View {
    @Binding var showModal: Bool
    
    var body: some View {
        VStack {
            Text("Inside Modal View")
                .padding()
            Button("Dismiss") {
                self.showModal.toggle()
            }
        }
    }
}
struct ModalView_Previews: PreviewProvider {
    static var previews: some View {
        ModalView(showModal: .constant(true))
    }
}

