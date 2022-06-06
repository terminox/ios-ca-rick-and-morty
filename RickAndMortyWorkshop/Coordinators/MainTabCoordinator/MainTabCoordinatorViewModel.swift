//
//  MainTabCoordinatorViewModel.swift
//  RickAndMortyWorkshop
//
//  Created by Art on 18/5/2565 BE.
//

import Foundation

class MainTabCoordinatorViewModel: ObservableObject {
  
  typealias Service
    = CharacterListFetchingService
    & LocationListFetchingService
    & EpisodeListFetchingService
    & HomeFetchingService
  
  var service: Service
  
  init(service: Service) {
    self.service = service
  }
}
