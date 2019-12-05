//
//  ReservationViewModel.swift
//  HomeCooked
//
//  Created by Jeremy on 11/7/19.
//  Copyright © 2019 67442. All rights reserved.
//

import Foundation

import FirebaseCore
import FirebaseFirestore

class ReviewViewModel {
  let review: Reviews
  var db: Firestore!

  init(review: Reviews) {
    self.review = review
    let settings = FirestoreSettings()

    Firestore.firestore().settings = settings
    // [END setup]
    db = Firestore.firestore()
  }
  
  func postReview(review: Reviews) {
    let documentId = String(review.id)
    db.collection("review").document(documentId).setData([
      "id": review.id,
      "description": review.description,
      "guest_id": review.guest_id,
      "chef_id": review.chef_id,
      "stars": review.stars,
    ]) { err in
        if let err = err {
            print("Error writing document: \(err)")
        } else {
            print("Document successfully written!")
        }
    }
  }
}
