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
   
   // MARK: - Private parameters
   @IBOutlet weak private var dateLabel: UILabel!
   @IBOutlet weak private var descriptionLabel: UILabel!
   @IBOutlet weak private var nameLabel: UILabel!
   @IBOutlet weak private var massLabel: UILabel!
   @IBOutlet weak var webView: WKWebView!
   
   private let viewModel = LaunchDetailControllerViewModel()
   
   // MARK: - Lifecycle
   override func viewDidLoad() {
      super.viewDidLoad()
      viewModel.launch = launch
      configureMandatoryLabels()
      configureOptionalLabels()
      configureWebView()
   }
   
   // MARK: - Setup
   private func configureMandatoryLabels() {
      DispatchQueue.main.async {
         self.title = self.launch.missionName
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
      webView.isOpaque = false
      webView.backgroundColor = UIColor(red: 23/255, green: 25/255, blue: 31/255, alpha: 1)
      if let request = viewModel.youtubeRequest {
         webView.load(request)
      }
   }
   
   // MARK: - Actions
   @IBAction private func openWiki(_ sender: UIButton) {
      UIApplication.shared.open(viewModel.wikiURL, options: [:])
   }
}
