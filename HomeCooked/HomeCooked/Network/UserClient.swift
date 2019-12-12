//
//  UserClient.swift
//  HomeCooked
//
//  Created by Albert Yuan on 12/5/19.
//  Copyright © 2019 67442. All rights reserved.
//

import Foundation
import Firebase

class UserClient {
  let urlString = "https://firestore.googleapis.com/v1/projects/homecooked-b0581/databases/(default)/documents/user"
  
  var email: String = ""
  var password: String = ""
  
  let db = Firestore.firestore()
  
  func login(completion: @escaping (User?) -> ()) {
    var user: User? = nil
    let dispatchGroup = DispatchGroup()
    
    db.collection("user")
      .whereField("email", isEqualTo: self.email)
      .getDocuments() { (querySnapshot, err) in
        if let err = err {
          print("Error getting documents: \(err)")
        } else {
          for document in querySnapshot!.documents {
            dispatchGroup.enter()
            if (self.password == (document.get("password") as! String)) {
              user = User(id: document.get("id") as! String,
                          first_name: document.get("first_name") as! String,
                          last_name: document.get("last_name") as! String,
                          email: document.get("email") as! String,
                          password: document.get("password") as! String)
            }
            dispatchGroup.leave()
          }
        }
        completion(user)
    }
  }
  
  func checkUserEmail(email: String, completion: @escaping (Bool) -> ()) {
    let dispatchGroup = DispatchGroup()
    var success = false
    db.collection("user")
      .whereField("email", isEqualTo: email)
      .getDocuments() { (querySnapShot, err) in
        if let err = err {
          print("Error getting documents: \(err)")
        } else {
          dispatchGroup.enter()
          if let doc = querySnapShot?.documents, !doc.isEmpty {
              success = false
          } else {
            success = true
          }
          dispatchGroup.leave()
        }
        completion(success)
    }
  }
  
  func postUser(user: User) {
    let documentId = user.id
    db.collection("user").document(documentId).setData([
      "id": user.id,
      "first_name": user.first_name,
      "last_name": user.last_name,
      "email": user.email,
      "password": user.password
    ]) { err in
      if let err = err {
        print("Error writing document: \(err)")
      } else {
        print("Document successfully written!")
      }
    }
  }
  
  func setLoginParams(params: LoginParams) {
    self.email = params.email
    self.password = params.password
  }
}
