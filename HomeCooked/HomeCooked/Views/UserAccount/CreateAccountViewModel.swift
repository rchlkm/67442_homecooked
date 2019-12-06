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
  
  func generateId() -> String {
    let letters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
    return String((0..<16).map{ _ in letters.randomElement()! })
  }
  
  func createAccount(first_name: String, last_name: String, email: String, password: String) {
    let user = User(id: generateId(),
                first_name: first_name,
                last_name: last_name,
                email: email,
                password: password)
    client.postUser(user: user)
  }
}
