//
//  ListController.swift
//  Space X
//
//  Created by Ideaction Apple on 3/28/19.
//  Copyright © 2019 savca. All rights reserved.
//

import UIKit

class ListController: UIViewController {
   
   @IBOutlet weak private var tableView: UITableView!
   
   private let viewModel = ListControllerViewModel()
   private var refreshControl: UIRefreshControl!
   
   
   override func viewDidLoad() {
      super.viewDidLoad()
      setupTableView()
      viewModel.delegate = self
      viewModel.fetchItems()
      setupNavigationBar()
   }
   
   private func setupNavigationBar() {
      self.title = "Space X"
      self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
   }
   
   private func setupTableView() {
      refreshControl = UIRefreshControl()
      refreshControl.addTarget(self, action: #selector(refreshData), for: .valueChanged)
      tableView.refreshControl = refreshControl
      tableView.register(
         UINib(nibName: Strings.Cell.launchCell, bundle: nil),
         forCellReuseIdentifier: Strings.Cell.launchCell
      )
   }
   
   @objc private func refreshData() {
      viewModel.fetchItems()
   }
   
   private func showDetails(for launch: Launch) {
      if let vc = storyboard?.instantiateViewController(withIdentifier: "LaunchDetailController") as? LaunchDetailController {
         vc.launch = launch
         vc.title = launch.missionName
         navigationController?.pushViewController(vc, animated: true)
      }
   }
   
}

extension ListController: ListControllerProtocol {
   
   func reloadData() {
      DispatchQueue.main.async {
         self.tableView.reloadData()
         self.refreshControl.endRefreshing()
      }
   }
   
}

extension ListController: UITableViewDataSource {
   
   func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      return viewModel.numberOfItems
   }
   
   func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      let cell = tableView.dequeueReusableCell(withIdentifier: Strings.Cell.launchCell) as! LaunchCell
      cell.setup(viewModel.item(at: indexPath))
      return cell
   }
   
}

extension ListController: UITableViewDelegate {
   
   func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
      tableView.deselectRow(at: indexPath, animated: true)
      showDetails(for: viewModel.item(at: indexPath))
   }
   
}
