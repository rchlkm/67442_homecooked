//
//  SearchClient.swift
//  HomeCooked
//
//  Created by Albert Yuan on 11/6/19.
//  Copyright © 2019 67442. All rights reserved.
//

import Foundation
import Alamofire

class SearchClient {
  let urlString = "https://firestore.googleapis.com/v1/projects/homecooked-b0581/databases/(default)/documents/meal"

  func fetchMeals(_ completion: @escaping (Data?) -> Void) {

    Alamofire.request(urlString).response { response in
      if let error = response.error {
        print("Error fetching meals: \(error)")
        completion(response.data)
        return
      }
      completion(response.data)
    }

  }
}
