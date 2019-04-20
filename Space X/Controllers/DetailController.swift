//
//  LaunchDetailController.swift
//  Space X
//
//  Created by Ideaction Apple on 3/28/19.
//  Copyright © 2019 savca. All rights reserved.
//

import UIKit
import WebKit

class LaunchDetailController: UIViewController {
   
   var launch: Launch!
   
   @IBOutlet weak private var dateLabel: UILabel!
   @IBOutlet weak private var descriptionLabel: UILabel!
   @IBOutlet weak private var nameLabel: UILabel!
   @IBOutlet weak private var massLabel: UILabel!
   @IBOutlet weak private var webView: WKWebView!
   
   private let viewModel = LaunchDetailControllerViewModel()
   
   override func viewDidLoad() {
      super.viewDidLoad()
      
      viewModel.launch = launch
      configureMandatoryLabels()
      configureOptionalLabels()
      configureWebView()
   }
   
   private func configureMandatoryLabels() {
      DispatchQueue.main.async {
         self.dateLabel.text = self.viewModel.date
         self.nameLabel.text = self.viewModel.name
         self.massLabel.text = self.viewModel.payloadMass
      }
   }
   
   private func configureOptionalLabels() {
      if let details = launch.details {
         self.descriptionLabel.text = details
      } else {
         self.descriptionLabel.removeFromSuperview()
      }
   }
   
   private func configureWebView() {
      webView.allowsLinkPreview = true
      if let request = viewModel.youtubeRequest {
         webView.load(request)
      }
   }
}

extension LaunchDetailController {
   
   @IBAction private func openWiki(_ sender: UIButton) {
      UIApplication.shared.open(viewModel.wikiURL, options: [:])
   }
   
}
