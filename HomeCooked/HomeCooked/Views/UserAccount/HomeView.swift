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
                Spacer()
                Text("homecooked")
                    .font(.largeTitle)
                
                Spacer().frame(height: 60.0)
                NavigationLink(destination: LoginView()) {
                    Text("Log In")
                        .foregroundColor(Color.orange)
                        .padding(.top, 12).padding(.bottom, 12).padding(.leading).padding(.trailing)
                        .overlay(
                            RoundedRectangle(cornerRadius: 30)
                                .stroke(Color.orange, lineWidth: 2)
                                .frame(width: frame_size))
                }
                        
                Spacer().frame(height: 15.0)
                NavigationLink(destination: CreateAccountView()) {
                    Text("Create Account")
                        .foregroundColor(Color.orange)
                        .padding(.top, 12).padding(.bottom, 12).padding(.leading).padding(.trailing)
                        .overlay(
                            RoundedRectangle(cornerRadius: 30)
                                .stroke(Color.orange, lineWidth: 2)
                                .frame(width: frame_size))
                }
                Spacer().frame(height: 80.0)
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
