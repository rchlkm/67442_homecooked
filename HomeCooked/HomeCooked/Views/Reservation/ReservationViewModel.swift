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

class ReservationViewModel: ObservableObject{
    let reservation: Reservation
    var db: Firestore!
    
    init(reservation: Reservation) {
        self.reservation = reservation
        let settings = FirestoreSettings()
        
        Firestore.firestore().settings = settings
        // [END setup]
        db = Firestore.firestore()
    }
    
    func postReservation(reservation: Reservation) {
      let documentId = reservation.id
      db.collection("reservation").document(documentId).setData([
        "id": reservation.id,
        "guest_id": reservation.user_id,
        "meal_id": reservation.meal_id,
        "guest_count": reservation.guest_count,
        "total": reservation.total,
        "card_number": reservation.card_number,
        "exp_month": reservation.exp_month,
        "exp_year": reservation.exp_year,
        "cv2": reservation.cv2,
      ]) { err in
        if let err = err {
          print("Error writing document: \(err)")
        } else {
          print("Document successfully written!")
        }
      }
    }
    
    func cancelReservation(reservation_id: String) {
      db.collection("reservation").document("reservation_id").delete() { err in
        if let err = err {
          print("Error removing document: \(err)")
        } else {
          print("Document successfully removed!")
        }
      }
    }
}
