//
//  RickAndMortyClient+HomeFetchingService.swift
//  RickAndMortyWorkshop
//
//  Created by Art on 18/5/2565 BE.
//

import Foundation

extension RickAndMortyClient: HomeFetchingService {
  @MainActor
  func fetchHomePage(_ payload: HomePageFetchingPayload) async throws -> HomePage {
    return HomePage(
      characters: Character.characters,
      locations: Location.locations,
      episodes: [])
  }
}
