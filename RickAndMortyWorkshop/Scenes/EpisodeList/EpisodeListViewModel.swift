//
//  EpisodeListViewModel.swift
//  RickAndMortyWorkshop
//
//  Created by Art on 12/5/2565 BE.
//

import Foundation

class EpisodeListViewModel: ObservableObject {
  
  @Published var episodes: [Episode] = []
  @Published var error: Error?
  private var currentPage: EpisodePage?
  
  var service: EpisodeListFetchingService // Data Access
  
  init(service: EpisodeListFetchingService) {
    self.service = service
  }
  
  func onAppear() {
    if episodes.isEmpty {
      fetch()
    }
  }
  
  func onLoadMore() {
    if currentPage?.next != nil {
      fetch()
    }
  }
  
  private func fetch() {
    Task {
      do {
        if let next = currentPage?.next {
          let option = EpisodePageFetchOption(pageNumber: next)
          let page = try await service.fetchEpisodePage(option: option)
          currentPage = page
          episodes.append(contentsOf: page.episodes)
          error = nil
        } else {
          let option = EpisodePageFetchOption(pageNumber: 0)
          let page = try await service.fetchEpisodePage(option: option)
          currentPage = page
          episodes.append(contentsOf: page.episodes)
          error = nil
        }
      } catch {
        currentPage = nil
        episodes = []
        self.error = error
      }
    }
  }
}
