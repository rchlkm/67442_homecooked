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


//func getTodayDate() -> String {
//    let date = Date()
//    let formatter = DateFormatter()
//    formatter.dateFormat = "MM/d"
//    return formatter.string(from: date)
//}
//getTodayDate()

extension Date {
    
    var month: Int {
        return Calendar.current.component(.month,  from: self)
    }
    var day: Int {
        return Calendar.current.component(.day,  from: self)
    }
    var dayOfWeek: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EE"
        return dateFormatter.string(from:self)
    }
    
    var date_str: String {
        return "\(self.dayOfWeek) \(self.month)/\(self.day)"
    }
}



let date = Date()
date.month
date.dayOfWeek


let formatter = DateFormatter()
formatter.dateFormat = "YYYY/MM/dd"
let someDateTime = formatter.date(from: "2019/11/9")



//let calendar = Calendar.current
//calendar.component(.year, from: date)
//calendar.component(.month, from: date)
//calendar.component(.day, from: date)
//calendar.dateComponents([.weekday], from: date).weekday
