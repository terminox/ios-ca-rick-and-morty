//
//  HomeViewContract.swift
//  RickAndMortyWorkshop
//
//  Created by Art on 18/5/2565 BE.
//

import Foundation

struct HomePage {
  let characters: [Character]
  let locations: [Location]
  let episodes: [Episode]
}

protocol HomeFetchingService {
  func fetchHomePage(_ payload: HomePageFetchingPayload) async throws -> HomePage
}

struct HomePageFetchingPayload {
  let limit: Int
}
