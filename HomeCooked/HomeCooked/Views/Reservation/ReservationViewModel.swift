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
        let documentId = String(reservation.id)
        db.collection("reservation").document(documentId).setData([
            "id": reservation.id,
            "guest_count": reservation.guest_count,
            "guest_id": reservation.guest_id,
            "payment_info": reservation.payment_info,
            "meal_id": reservation.meal_id,
            "reservation_time": Date(), // Change this to current date/time
          "total": reservation.total,
        ]) { err in
            if let err = err {
                print("Error writing document: \(err)")
            } else {
                print("Document successfully written!")
            }
        }
    }
    
    func cancelReservation() {
        print("trying to cancel?")
    }
}
