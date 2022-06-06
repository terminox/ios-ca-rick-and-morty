//
//  RickAndMortyClient+LocationListFetchingService.swift
//  RickAndMortyWorkshop
//
//  Created by Art on 12/5/2565 BE.
//

import Foundation

extension RickAndMortyClient: LocationListFetchingService {
  @MainActor
  func fetchLocationPage(option: LocationPageFetchOption) async throws -> LocationPage {
    return await withCheckedContinuation { continuation in
      apollo.fetch(query: LocationsQuery(page: option.pageNumber)) { result in
        switch result {
        case .success(let gqlResult):
          let locations: [Location] = gqlResult.data?.locations?.results?.compactMap { gqlLocation in
            guard
              let l = gqlLocation,
              let id = l.id,
              let name = l.name,
              let type = l.type,
              let dimension = l.dimension
            else {
              return nil
            }
            
            let residents: [Character] = l.residents.compactMap { gqlCharacter in
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
            
            return Location(
              id: id,
              name: name,
              type: type,
              dimension: dimension,
              residents: residents)
          } ?? []
          
          let page = LocationPage(next: gqlResult.data?.locations?.info?.next, locations: locations)
          continuation.resume(returning: page)
          
        case .failure(let error):
          print(error.localizedDescription)
        }
      }
    }
  }
}
