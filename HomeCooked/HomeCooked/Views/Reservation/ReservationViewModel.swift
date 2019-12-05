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
            "guest_id": reservation.guest_id,
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
    
    func cancelReservation() {
        print("trying to cancel?")
    }
}
