//
//  Login.swift
//  HomeCooked
//
//  Created by Rachel Kim on 12/3/19.
//  Copyright © 2019 67442. All rights reserved.
//

import SwiftUI

struct Login: View {
    @State var user_email: String = ""
    @State var password: String = ""
    
    var body: some View {
        VStack {
            
            Spacer().frame(height: 200.0)
           
            RoundedRectangle(cornerRadius: 20)
                .frame(width: 150, height: 150)
                .foregroundColor(Color.orange)
            
            Spacer().frame(height: 30.0)
                
            TextFieldInputView(placeholder: "Email", input: $user_email)
            Spacer().frame(height: 10.0)
            
            SecureField("Password", text: $password)
                .padding(.top, 5).padding(.bottom, 5).padding(.leading).padding(.trailing)
                .overlay(RoundedRectangle(cornerRadius: 30).stroke(Color.gray))
//           Text("You entered: \(password)")
                
            Spacer().frame(height: 10.0)
            Button(action: {
                self.login()
            }) {
                Text("Login")
            }
            Spacer()
        }.padding(.leading,20).padding(.trailing,20)
    }
        
    func login() {
        let login_params = LoginParams(email: self.user_email, password: self.password)
        
//        self.vm.login(params: login_params)
//        print(self.vm.meals)
    }
    
}

struct LogIn_Previews: PreviewProvider {
    static var previews: some View {
        Login()
    }
}
