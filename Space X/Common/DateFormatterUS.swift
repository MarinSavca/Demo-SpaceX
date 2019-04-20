//
//  DateFormatterUS.swift
//  Space X
//
//  Created by Ideaction Apple on 3/28/19.
//  Copyright © 2019 savca. All rights reserved.
//

import Foundation

struct DateFormatterUS {
   func getDate(from dateString: String) -> String {
      let originalFormatter = DateFormatter()
      originalFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
      let customFormatter = DateFormatter()
      customFormatter.dateFormat = "EEEE dd,yyyy"
      if let date = originalFormatter.date(from: dateString) {
         return customFormatter.string(from: date)
      } else {
         return ""
      }
   }
}
