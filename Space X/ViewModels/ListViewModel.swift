//
//  ListPresenter.swift
//  Space X
//
//  Created by Ideaction Apple on 3/28/19.
//  Copyright © 2019 savca. All rights reserved.
//

import UIKit

protocol ListControllerProtocol: class {
   func reloadData()
}

final class ListControllerViewModel {
   
   weak var delegate: ListControllerProtocol!
   
   private let launchService = LaunchService()
   private var launches: Launches = [] {
      didSet {
         delegate.reloadData()
      }
   }
   
}

extension ListControllerViewModel {
   
   var numberOfItems: Int {
      return launches.count
   }
   
   func item(at index: IndexPath) -> Launch {
      return launches[index.row]
   }
   
   func fetchItems() {
      launchService.getLaunches { [weak self] launches in
         self?.launches = launches
      }
   }
   
}
