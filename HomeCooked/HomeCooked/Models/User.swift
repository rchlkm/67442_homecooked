//
//  User.swift
//  HomeCooked
//
//  Created by Rachel Kim on 12/3/19.
//  Copyright © 2019 67442. All rights reserved.
//

import Foundation

struct User {
    let id: String
    let first_name: String
    let last_name: String
    let email: String
    let password: String
}

struct LoginParams {
    let email: String
    let password: String
}

struct CreateAccountParams {
    let first_name: String
    let last_name: String
    let email: String
    let password: String
}
