//
//  CreateAccountViewModel.swift
//  HomeCooked
//
//  Created by Albert Yuan on 12/5/19.
//  Copyright © 2019 67442. All rights reserved.
//

import Foundation

class CreateAccountViewModel: ObservableObject {
    let client = UserClient()
    var create_account_success: Bool = false
    
    func createAccount(params: CreateAccountParams, completion: @escaping (Bool) -> ()) {
        client.checkUserEmail(email: params.email) {
            (success) in
            if (success) {
                let user = User(id: self.generateId(),
                                first_name: params.first_name,
                                last_name: params.last_name,
                                email: params.email,
                                password: params.password)
                self.client.postUser(user: user)
            }
            completion(success)
            
            if success {
                self.create_account_success = true
            }
        }
    }
    
    func generateId() -> String {
        let letters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
        return String((0..<16).map{ _ in letters.randomElement()! })
    }
    
    
    var success: Bool = false
    
    func login(params: LoginParams, completion: @escaping (User?) -> ()) {
        client.setLoginParams(params: params)
        client.login {
            (user) in
            completion(user)
            if user != nil {
                self.success = true
            }
        }
    }
    
}
