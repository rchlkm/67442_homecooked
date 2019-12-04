//
//  Login.swift
//  HomeCooked
//
//  Created by Rachel Kim on 12/3/19.
//  Copyright © 2019 67442. All rights reserved.
//

import SwiftUI

struct LoginView: View {
    @State var isActive = false
    
    @State var user_email: String = ""
    @State var password: String = ""
    
    var body: some View {
        VStack {
            
            //            Spacer().frame(height: 200.0)
            
            RoundedRectangle(cornerRadius: 20)
                .frame(width: 150, height: 150)
                .foregroundColor(Color.orange)
            
            Spacer().frame(height: 30.0)
            
            TextFieldInputView(placeholder: "Email", input: $user_email)
            Spacer().frame(height: 10.0)
            
            SecureField("Password", text: $password)
                .padding(.top, 5).padding(.bottom, 5).padding(.leading).padding(.trailing)
                .overlay(RoundedRectangle(cornerRadius: 30).stroke(Color.gray))
            //                Text("You entered: \(password)")
            
            Spacer().frame(height: 10.0)
            
            
            NavigationLink(destination: LoggedInView(), isActive: self.$isActive) { EmptyView() }
            
            Button(action: {
                self.login()
                self.isActive = true
            }) {
                HStack {
                    Spacer()
                    Text("Login").foregroundColor(Color.white).bold()
                    Spacer()
                }
            }
            .accentColor(Color.black)
            .padding()
            .background(Color.orange)
            .cornerRadius(4.0)
            .padding(Edge.Set.vertical, 20)
            
            
            Spacer()
        }.padding(.leading,20).padding(.trailing,20)
    }
    
    func login() {
        let login_params = LoginParams(email: self.user_email, password: self.password)
        //        self.vm.login(params: login_params)
        //        print(self.vm.meals)
    }
    
}


struct Login_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
