//
//  EpisodeListInteractor.swift
//  RickAndMortyWorkshop
//
//  Created by Art on 12/5/2565 BE.
//

import Foundation

// Data Access Interface
protocol EpisodeListFetchingService {
  func fetchEpisodePage(option: EpisodePageFetchOption) async throws -> EpisodePage
}

struct EpisodePageFetchOption {
  let pageNumber: Int
}
