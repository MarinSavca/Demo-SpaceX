//
//  YoutubeImageFetcher.swift
//  Space X
//
//  Created by Ideaction Apple on 3/28/19.
//  Copyright © 2019 savca. All rights reserved.
//

import UIKit

class YoutubeService {
   func getImage(id: String, completion: @escaping (UIImage?) -> Void) {
      let imageURL = "https://img.youtube.com/vi/\(id)/0.jpg"
      guard let url = URL(string: imageURL) else { return }
      
      downloadImage(url: url) { image in
         completion(image)
      }
   }
   
   private func downloadImage(url: URL, completionHandler: @escaping (UIImage?)->Void) {
      URLSession.shared.dataTask(with: url) { (data, response, error) in
         guard let data = data else { return }
         let image = UIImage(data: data)
         completionHandler(image)
      }.resume()
   }
}
