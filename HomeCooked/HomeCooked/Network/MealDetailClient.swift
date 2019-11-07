//
//  MealDetailClient.swift
//  HomeCooked
//
//  Created by Albert Yuan on 11/6/19.
//  Copyright © 2019 67442. All rights reserved.
//

import Foundation
import Alamofire

class MealDetailClient {
  var chef_id: Int
  let urlTemplate = "https://firestore.googleapis.com/v1/projects/homecooked-b0581/databases/(default)/documents/chef/"
  
  init(chef_id: Int) {
    self.chef_id = chef_id
  }
  
  func fetchChef(_ completion: @escaping (Data?) -> Void) {
    let urlString = urlTemplate + String(chef_id)
      
    Alamofire.request(urlString).response { response in
      if let error = response.error {
        print("Error fetching chef: \(error)")
        completion(response.data)
        return
      }
      completion(response.data)
    }
    
  }
}

