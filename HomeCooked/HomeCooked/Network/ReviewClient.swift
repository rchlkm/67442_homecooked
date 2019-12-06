//
//  ReviewClient.swift
//  HomeCooked
//
//  Created by Albert Yuan on 12/5/19.
//  Copyright © 2019 67442. All rights reserved.
//

import Foundation
import Firebase

class ReviewClient {
  let db = Firestore.firestore()
  
  func postReview(review: Review) {
    let documentId = review.id
    db.collection("review").document(documentId).setData([
      "id": review.id,
      "chef_id": review.chef_id,
      "stars": review.stars,
      "user_id": review.user_id
    ]) { err in
      if let err = err {
        print("Error writing document: \(err)")
      } else {
        print("Document successfully written!")
      }
    }
  }
  
  func deleteReview(review_id: String) {
    db.collection("review").document(review_id).delete()
  }
}
