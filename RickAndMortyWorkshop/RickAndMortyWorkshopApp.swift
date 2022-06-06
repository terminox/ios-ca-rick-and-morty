//
//  RickAndMortyWorkshopApp.swift
//  RickAndMortyWorkshop
//
//  Created by Art on 10/5/2565 BE.
//

import SwiftUI

@main
struct RickAndMortyWorkshopApp: App {
  
  let client = RickAndMortyClient.shared
  
  let characterListViewModel: CharacterListViewModel
  let locationListViewModel: LocationListViewModel
  let episodeListViewModel: EpisodeListViewModel
  let characterCoordinatorViewModel: CharacterCoordinatorViewModel
  let mainTabCoordinatorViewModel: MainTabCoordinatorViewModel
  
  init() {
//    characterListFetchingService = MockCharacterListFetchingService()
    characterListViewModel = CharacterListViewModel(service: client)
    locationListViewModel = LocationListViewModel(service: client)
    episodeListViewModel = EpisodeListViewModel(service: client)
    characterCoordinatorViewModel = CharacterCoordinatorViewModel(service: client)
    
    mainTabCoordinatorViewModel = MainTabCoordinatorViewModel(service: client)
  }
  
  var body: some Scene {
    WindowGroup {
      MainTabCoordinatorView(viewModel: mainTabCoordinatorViewModel)
//      CharacterCoordinatorView(viewModel: characterCoordinatorViewModel)
//      CharacterListView(viewModel: characterListViewModel)
//      LocationListView(viewModel: locationListViewModel)
//      EpisodeListView(viewModel: episodeListViewModel)
    }
  }
}
