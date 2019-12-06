//
//  LoginViewModel.swift
//  HomeCooked
//
//  Created by Albert Yuan on 12/5/19.
//  Copyright © 2019 67442. All rights reserved.
//

import Foundation

class LoginViewModel: ObservableObject {
    let client = UserClient()
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
