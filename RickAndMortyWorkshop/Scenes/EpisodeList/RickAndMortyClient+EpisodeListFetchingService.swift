//
//  RickAndMortyClient+EpisodeListFetchingService.swift
//  RickAndMortyWorkshop
//
//  Created by Art on 12/5/2565 BE.
//

import Foundation

extension RickAndMortyClient: EpisodeListFetchingService {
  @MainActor
  func fetchEpisodePage(option: EpisodePageFetchOption) async throws -> EpisodePage {
    return await withCheckedContinuation { continuation in
      apollo.fetch(
        query: EpisodesQuery(page: option.pageNumber),
        cachePolicy: .returnCacheDataAndFetch)
      { result in
        switch result {
        case .success(let gqlResult):
          let episodes: [Episode] = gqlResult.data?.episodes?.results?.compactMap { gqlEpisode in
            guard
              let e = gqlEpisode,
              let id = e.id,
              let name = e.name,
              let airDate = e.airDate,
              let episode = e.episode
            else {
              return nil
            }
            
            let characters: [Character] = e.characters.compactMap { gqlCharacter in
              guard
                let c = gqlCharacter,
                let id = c.id,
                let name = c.name,
                let status = c.status,
                let species = c.species,
                let gender = c.gender,
                let image = c.image
              else {
                return nil
              }
              
              return Character(
                id: id,
                name: name,
                status: CharacterStatus(rawValue: status) ?? .unknown,
                species: species,
                gender: CharacterGender(rawValue: gender) ?? .unknown,
                origin: .earth,
                location: .citadelOfRicks,
                imageURL: URL(string: image))
            }
            
            return Episode(
              id: id,
              name: name,
              airDate: airDate,
              episode: episode,
              characters: characters)
          } ?? []
          
          let page = EpisodePage(next: gqlResult.data?.episodes?.info?.next, episodes: episodes)
          continuation.resume(returning: page)
          
        case .failure(let error):
          print(error.localizedDescription)
        }
      }
    }
  }
}
