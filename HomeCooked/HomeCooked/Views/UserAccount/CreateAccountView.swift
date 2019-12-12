//
//  CreateAccount.swift
//  HomeCooked
//
//  Created by Rachel Kim on 12/3/19.
//  Copyright © 2019 67442. All rights reserved.
//

import SwiftUI

struct CreateAccountView: View {
    @ObservedObject var vm : CreateAccountViewModel
    @State var button_is_active = false
    @State var actionButton_clicked = false
    
    @State var first_name: String = ""
    @State var last_name: String = ""
    @State var user_email: String = ""
    @State var password: String = ""
    @State var confirm_password: String = ""
    @State var errorMsg: String = "Please enter all fields."
    init(){
        self.vm = CreateAccountViewModel()
    }
    var body: some View {
        VStack {
            Image("logo").frame(width: 50.0, height: 50.0)
            Spacer().frame(height: 75.0)
            
            TextFieldWithBottomLine("First Name", input: $first_name).padding(.bottom, 20)
            TextFieldWithBottomLine("Last Name", input: $last_name).padding(.bottom, 20)
            TextFieldWithBottomLine("Email", input: $user_email).padding(.bottom, 20)
            TextFieldWithBottomLine("Password", input: $password, secure: true).padding(.bottom, 20)
            //            TextFieldWithBottomLine("Confirm Password", input: $confirm_password, secure: true).padding(.bottom, 40)
            
            //            Spacer().frame(height: 25.0)
            
            NavigationLink(destination: LoggedInView(), isActive: self.$button_is_active) { EmptyView() }
            
            Button(action: {
                self.actionButton_clicked = true
                self.create_account()
                self.is_create_sucess()
            }) {
                OrangeButton("Create Account")
            }
            
            Section {
                if (self.actionButton_clicked && !self.button_is_active) {
                    Text(self.errorMsg)
                } else { Text("") }
            }.padding(.top)
        }.padding(.leading,20).padding(.trailing,20)
    }
    
    func create_account() {
        if (self.first_name != "" && self.last_name != "" && self.user_email != "" && self.password != "") {
            let user_params = CreateAccountParams(
                first_name: self.first_name,
                last_name: self.last_name,
                email: self.user_email,
                password: self.password)
            
            self.vm.createAccount(params: user_params) {
                (success) in
            }
            
        }
    }
    
    
    func is_create_sucess() {
        if (self.vm.create_account_success) {
            self.button_is_active = true
        } else {
            self.errorMsg = "Email has already been used."
        }
    }

}

struct CreateAccount_Previews: PreviewProvider {
    static var previews: some View {
        CreateAccountView()
    }
}
