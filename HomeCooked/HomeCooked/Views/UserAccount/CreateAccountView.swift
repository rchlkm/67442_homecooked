//
//  CreateAccount.swift
//  HomeCooked
//
//  Created by Rachel Kim on 12/3/19.
//  Copyright © 2019 67442. All rights reserved.
//

import SwiftUI

struct CreateAccountView: View {
    @State var button_is_active = false
    
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
            Image("logo").frame(width: 50.0, height: 50.0)
            Spacer().frame(height: 75.0)
            
//            Text("Personal Info:")
            TextFieldWithBottomLine("First Name", input: $first_name).padding(.bottom, 20)
            TextFieldWithBottomLine("Last Name", input: $last_name).padding(.bottom, 20)
            TextFieldWithBottomLine("Email", input: $user_email).padding(.bottom, 40)
            
//            Text("Create Password:")
            TextFieldWithBottomLine("Password", input: $password, secure: true).padding(.bottom, 20)
            TextFieldWithBottomLine("Confirm Password", input: $confirm_password, secure: true).padding(.bottom, 40)
            
//            Spacer().frame(height: 25.0)
            
            NavigationLink(destination: LoggedInView(), isActive: self.$button_is_active) { EmptyView() }
            
            Button(action: {
                self.create_account()
                self.button_is_active = true
            }) { OrangeButton("Create Account") }
        }.padding(.leading,20).padding(.trailing,20)
    }
    
    
    func create_account() {
        print("account is being created!")
        //        let user_params = CreateAccountParams(email: self.user_email, password: self.password)
        //        self.vm.login(params: login_params)
        //        print(self.vm.meals)
    }
}

struct CreateAccount_Previews: PreviewProvider {
    static var previews: some View {
        CreateAccountView()
    }
}
