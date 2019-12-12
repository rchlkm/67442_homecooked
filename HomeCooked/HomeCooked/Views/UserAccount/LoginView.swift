//
//  Login.swift
//  HomeCooked
//
//  Created by Rachel Kim on 12/3/19.
//  Copyright © 2019 67442. All rights reserved.
//

import SwiftUI

struct LoginView: View {
    @ObservedObject var vm : LoginViewModel
    //    @Published var user: User
    
    @State var button_is_active = false
    @State var actionButton_clicked = false
    
    @State var user_email: String = ""
    @State var password: String = ""
    
    init(){
        self.vm = LoginViewModel()
    }
    var body: some View {
        VStack {
            Image("logo").frame(width: 75, height: 75)
            Spacer().frame(height: 75.0)
            
            TextFieldWithBottomLine("Email", input: $user_email).padding(.bottom, 20)
            TextFieldWithBottomLine("Password", input: $password, secure: true)
            //            Text("You entered: \(password)")
            
            Spacer().frame(height: 25.0)
            
            NavigationLink(destination: LoggedInView(), isActive: self.$button_is_active) { EmptyView() }
            
            Button(action: {
                self.actionButton_clicked = true
                self.login()
                self.is_login_sucess()
            }) {
                OrangeButton("Login")
            }
            
            Section {
                if (self.actionButton_clicked && !self.button_is_active) {
                    Text("Please enter valid credentials.")
                } else {
                    Text("")
                }
            }.padding(.top)
        }.padding(.leading,20).padding(.trailing,20)
    }
    
    func login() {
        print("in the login function")
        let login_params = LoginParams(email: self.user_email, password: self.password)
        self.vm.login(params: login_params) {
            (user) in
        }
    }
    
    func is_login_sucess() {
        if self.vm.success {
            self.button_is_active = true
        }
    }
    
}

struct Login_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
