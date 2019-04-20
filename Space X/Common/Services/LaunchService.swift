//
//  LaunchService.swift
//  Space X
//
//  Created by Ideaction Apple on 3/28/19.
//  Copyright © 2019 savca. All rights reserved.
//

import Foundation

class LaunchService {
   func getLaunches(completion: @escaping (Launches)->Void) {
      guard let url = URL(string: "https://api.spacexdata.com/v2/launches") else {
         return
      }
      URLSession.shared.dataTask(with: url) { (data, response, error) in
         guard let data = data else { return }
         
         do {
            let launches = try JSONDecoder().decode(Launches.self, from: data)
            completion(launches)
         } catch let err {
            completion([])
            print(err.localizedDescription)
         }
         
      }.resume()
   }
}
