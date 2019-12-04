//
//  CreateAccount.swift
//  HomeCooked
//
//  Created by Rachel Kim on 12/3/19.
//  Copyright © 2019 67442. All rights reserved.
//

import SwiftUI

struct CreateAccount: View {
    @State var first_name: String = ""
    @State var last_name: String = ""
    @State var user_email: String = ""
    @State var password: String = ""
    @State var confirm_password: String = ""
    
    //    @State var gender: String
    //    @State var age: String
    //    @State var country: String
    
    var body: some View {
        VStack {
            
            Spacer().frame(height: 80.0)
            
            RoundedRectangle(cornerRadius: 20)
                .frame(width: 100, height: 100)
                .foregroundColor(Color.orange)
            
            Text("Create Account").font(.title)
            
            Spacer().frame(height: 30.0)
            
            TextFieldInputView(placeholder: "First Name", input: $first_name)
            TextFieldInputView(placeholder: "Last Name", input: $last_name)
//
            TextFieldInputView(placeholder: "Email", input: $user_email)
            
//            TextFieldInputView(placeholder: "Gender", input: $gender)
//            TextFieldInputView(placeholder: "Age", input: $age)
//            TextFieldInputView(placeholder: "Country", input: $country)
            
            Spacer().frame(height: 10.0)
//            SecureField("Password", text: $password)
//                 .padding(.top, 5).padding(.bottom, 5).padding(.leading).padding(.trailing)
//                 .overlay(RoundedRectangle(cornerRadius: 30).stroke(Color.gray))
//
//            SecureField("Confirm Password", text: $confirm_password)
//                .padding(.top, 5).padding(.bottom, 5).padding(.leading).padding(.trailing)
//                .overlay(RoundedRectangle(cornerRadius: 30).stroke(Color.gray))
            
//            Spacer().frame(height: 10.0)
            Button(action: {
                self.create_account()
            }) {
                Text("Login")
            }
            Spacer()
        }.padding(.leading,20).padding(.trailing,20)
            .border(Color.green)
    }
    
    
    func create_account() {
//        let user_params = CreateAccountParams(email: self.user_email, password: self.password)
        
        //        self.vm.login(params: login_params)
        //        print(self.vm.meals)
    }
}

struct CreateAccount_Previews: PreviewProvider {
    static var previews: some View {
        CreateAccount()
    }
}
