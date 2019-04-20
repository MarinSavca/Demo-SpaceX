//
//  LaunchCell.swift
//  Space X
//
//  Created by Ideaction Apple on 3/28/19.
//  Copyright © 2019 savca. All rights reserved.
//

import UIKit

final class LaunchCell: UITableViewCell {
   
   @IBOutlet weak private var launchImageView: UIImageView!
   @IBOutlet weak private var launchNameLabel: UILabel!
   @IBOutlet weak private var launchDateLabel: UILabel!
   @IBOutlet weak private var dateContainerWidth: NSLayoutConstraint!
   
   private var youtubeImageFetcher = YoutubeService()
   private var dateFormatter = DateFormatterUS()
   
   
   final func setup(_ launch: Launch) {
      DispatchQueue.main.async {
         self.launchNameLabel.text = launch.missionName
         self.launchDateLabel.text = self.dateFormatter.getDate(from: launch.launchDateUTC)
         self.launchDateLabel.sizeToFit()
         self.dateContainerWidth.constant = self.launchDateLabel.frame.width + 10
         self.launchImageView.layer.cornerRadius = 8
         self.launchImageView.layer.masksToBounds = true
         self.setImage(url: launch.links.youtubeID)
      }
   }
   
   private func setImage(url: String) {
      youtubeImageFetcher.getImage(id: url) { [weak self] image in
         DispatchQueue.main.async {
            self?.launchImageView.image = image
         }
      }
   }
}
