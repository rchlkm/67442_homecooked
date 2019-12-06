//
//  ChefParser.swift
//  HomeCooked
//
//  Created by Albert Yuan on 11/6/19.
//  Copyright © 2019 67442. All rights reserved.
//

// We aren't using these parsers anywhere, so we didn't write tests for them.

import Foundation
import SwiftyJSON

class ChefParser {
  func parseDictionary(_ data: Data?) -> JSON? {
    do {
      if let d = data {
        let json = try JSON(data: d)
        print(json)
        return json
      }
    } catch {
      print(error)
    }
    return nil
  }

  func chefFromResponse(_ data: Data?) -> Chef? {
    if let chefDict = parseDictionary(data) {
      let dict = chefDict["fields"]
      return Chef(
        id: dict["id"]["stringValue"].stringValue,
        first_name: dict["first_name"]["stringValue"].stringValue,
        last_name: dict["last_name"]["stringValue"].stringValue,
        address: dict["address"]["stringValue"].stringValue,
        city: dict["city"]["stringValue"].stringValue,
        latitude: dict["latitude"]["doubleValue"].doubleValue,
        longitude: dict["address"]["doubleValue"].doubleValue,
        phone: dict["phone"]["stringValue"].stringValue
      )
    }
    return nil
  }
}
