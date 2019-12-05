//
//  CreateAccount.swift
//  HomeCooked
//
//  Created by Rachel Kim on 12/3/19.
//  Copyright © 2019 67442. All rights reserved.
//

import SwiftUI

struct CreateAccountView: View {
    @State var isActive = false
    
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
            TextFieldWithBottomLine(placeholder: "First Name", input: $first_name).padding(.bottom, 20)
            TextFieldWithBottomLine(placeholder: "Last Name", input: $last_name).padding(.bottom, 20)
            TextFieldWithBottomLine(placeholder: "Email", input: $user_email).padding(.bottom, 40)
            
//            Text("Create Password:")
            TextFieldWithBottomLine(placeholder: "Password", input: $password, secure: true).padding(.bottom, 20)
            TextFieldWithBottomLine(placeholder: "Confirm Password", input: $confirm_password, secure: true).padding(.bottom, 40)
            
//            Spacer().frame(height: 25.0)
            
            NavigationLink(destination: LoggedInView(), isActive: self.$isActive) { EmptyView() }
            
            Button(action: {
                self.create_account()
                self.isActive = true
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
