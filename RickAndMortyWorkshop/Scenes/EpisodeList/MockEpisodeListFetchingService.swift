//
//  MockEpisodeListFetchingService.swift
//  RickAndMortyWorkshop
//
//  Created by Art on 12/5/2565 BE.
//

import Foundation

class MockEpisodeListFetchingService: EpisodeListFetchingService {
  @MainActor
  func fetchEpisodePage(option: EpisodePageFetchOption) async throws -> EpisodePage {
    throw NSError(domain: "", code: -1)
  }
}
