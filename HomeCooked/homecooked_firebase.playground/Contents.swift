import UIKit
import SwiftyJSON
import XCPlayground

let chefURL: NSURL = NSURL(string: "https://firestore.googleapis.com/v1/projects/homecooked-b0581/databases/(default)/documents/chef/")!

let chefdata = NSData(contentsOf: chefURL as URL)!

let chefswiftyjson = try JSON(data: chefdata as Data)

let chef = chefswiftyjson["documents"]
  
print(chef)

let guestURL: NSURL = NSURL(string: "https://firestore.googleapis.com/v1/projects/homecooked-b0581/databases/(default)/documents/guest/")!

let guestdata = NSData(contentsOf: guestURL as URL)!

let guestswiftyjson = try JSON(data: guestdata as Data)

let guest = guestswiftyjson["documents"]
  
print(guest)

let reservationURL: NSURL = NSURL(string: "https://firestore.googleapis.com/v1/projects/homecooked-b0581/databases/(default)/documents/guest/")!

let reservationdata = NSData(contentsOf: reservationURL as URL)!

let reservationswiftyjson = try JSON(data: reservationdata as Data)

let reservation = reservationswiftyjson["documents"]
  
print(reservation)
