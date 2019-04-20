//
//  DetailViewModel.swift
//  Space X
//
//  Created by Ideaction Apple on 3/28/19.
//  Copyright © 2019 savca. All rights reserved.
//

import Foundation

class LaunchDetailControllerViewModel {
   
   var launch: Launch!
   
   private let formatter = DateFormatterUS()
   private var totalPayloadMass: Int {
      return Int(
         launch.rocket.secondStage.payloads
         .compactMap { $0.massReturnedKg }
         .reduce(0, +)
      )
   }
   
}

extension LaunchDetailControllerViewModel {
   
   var date: String {
      return formatter.getDate(from: launch.launchDateUTC)
   }
   
   var name: String {
      return "Rocket name: \(self.launch.missionName)"
   }
   
   var payloadMass: String {
      return "Payload mass: \(totalPayloadMass)"
   }
   
   var youtubeRequest: URLRequest? {
      guard let url = URL(string: "https://www.youtube.com/embed/\(launch.links.youtubeID)?playsinline=1&showinfo=1") else {
         return nil
      }
      return URLRequest(url: url)
   }
   
   var wikiURL: URL {
      return URL(string: launch.links.wikipedia)!
   }
   
}
