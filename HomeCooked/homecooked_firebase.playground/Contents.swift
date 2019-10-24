import UIKit
import SwiftyJSON
import XCPlayground

let fbURL: NSURL = NSURL(string: "https://firestore.googleapis.com/v1/projects/homecooked-b0581/databases/(default)/documents/chef/GJFmRADeY9MJCQ4AUTpC")!

let data = NSData(contentsOf: fbURL as URL)!

let swiftyjson = try JSON(data: data as Data)

let chef = swiftyjson["fields"]
  
print(chef)
