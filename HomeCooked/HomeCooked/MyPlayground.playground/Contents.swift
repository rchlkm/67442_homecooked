import UIKit
import XCPlayground
import Firebase


XCPlaygroundPage.currentPage.needsIndefiniteExecution = true

FirebaseApp.configure()

let db = Firestore.firestore()

db.collection("users").getDocuments() { (querySnapshot, err) in
    if let err = err {
        print("Error getting documents: \(err)")
    } else {
        for document in querySnapshot!.documents {
            print("\(document.documentID) => \(document.data())")
        }
    }
}
