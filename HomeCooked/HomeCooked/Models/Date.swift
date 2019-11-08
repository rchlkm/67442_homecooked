//
//  Date.swift
//  HomeCooked
//
//  Created by Rachel Kim on 11/8/19.
//  Copyright © 2019 67442. All rights reserved.
//

import Foundation

extension Date {
    var year: Int {
        return Calendar.current.component(.year,  from: self)
    }
  
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
