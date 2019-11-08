import Foundation

//import FirebaseCore
//import FirebaseFirestore
//
//let reservation: Reservation
//var db: Firestore!
//
//print("hi")
//
//let settings = FirestoreSettings()
//
//Firestore.firestore().settings = settings
//// [END setup]
//db = Firestore.firestore()
//
//func postReservation(reservation: Reservation) {
//  let documentId = String(reservation.id)
//  db.collection("reservation").document(documentId).setData([
//    "id": reservation.id,
//    "guest_count": reservation.guest_count,
//    "guest_id": reservation.guest_id,
//    "payment_info": "This is a credit card",
//    "meal_id": reservation.meal_id,
//    "reservation_time": "Now",
//  ]) { err in
//      if let err = err {
//          print("Error writing document: \(err)")
//      } else {
//          print("Document successfully written!")
//      }
//  }
//}


func randomString(length: Int) -> String {
    let letters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
    return String((0..<length).map{ _ in letters.randomElement()! })
}

randomString(length: 10)
