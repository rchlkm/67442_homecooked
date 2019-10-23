import UIKit
import Firebase
import XCPlayground

XCPlaygroundPage.currentPage.needsIndefiniteExecution = true

var root = Firebase(url:"https://docs-examples.firebaseio.com/")
var hcRef = root.childByAppendingPath("users/ayuan/name")

// save

var ref = Firebase(url: "https://docs-examples.firebaseio.com/web/saving-data/fireblog")

var alanisawesome = ["full_name": "Alan Turing", "date_of_birth": "June 23, 1912"]
var gracehop = ["full_name": "Grace Hopper", "date_of_birth": "December 9, 1906"]

var usersRef = ref.childByAppendingPath("users")

var users = ["alanisawesome": alanisawesome, "gracehop": gracehop]
usersRef.setValue(users)

var nickname = ["nickname": "Amazing Grace"]
