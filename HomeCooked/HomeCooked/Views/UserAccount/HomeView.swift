//
//  HomeView.swift
//  HomeCooked
//
//  Created by Rachel Kim on 12/3/19.
//  Copyright © 2019 67442. All rights reserved.
//

import SwiftUI

struct HomeView: View {
    var frame_size: CGFloat = UIScreen.main.bounds.width - 48
    var body: some View {
        NavigationView {
            VStack {
                Image("logo").frame(width: 100, height: 100)
                Spacer().frame(height: 75.0)
                NavigationLink(destination: LoginView()) { OrangeButton("Login") }
                Spacer().frame(height: 10.0)
                NavigationLink(destination: CreateAccountView()) { WhiteButton("Create Account") }
            }.padding(.leading,20).padding(.trailing,20)

        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
