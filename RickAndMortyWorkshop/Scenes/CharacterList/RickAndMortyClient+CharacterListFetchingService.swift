//
//  RickAndMortyClient+CharacterListFetchingService.swift
//  RickAndMortyWorkshop
//
//  Created by Art on 11/5/2565 BE.
//

import Foundation

extension Store: CharacterListFetchingService {
  @MainActor
  func fetchCharacterPage(option: CharacterPageFetchOption) async throws -> CharacterPage {
    return await withCheckedContinuation { continuation in
      client.apollo.fetch(query: CharactersQuery(page: option.pageNumber)) { result in
        switch result {
        case .success(let gqlResult):
          let characters: [Character] = gqlResult.data?.characters?.results?.compactMap { gqlCharacter in
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
              status: CharacterStatus(rawValue: status.lowercased()) ?? .unknown,
              species: species,
              gender: CharacterGender(rawValue: gender.lowercased()) ?? .unknown,
              origin: .earth,
              location: .citadelOfRicks,
              imageURL: URL(string: image))
          } ?? []
          
          let page = CharacterPage(next: gqlResult.data?.characters?.info?.next, characters: characters)
          continuation.resume(returning: page)
          
        case .failure(let error):
          print(error.localizedDescription)
        }
      }
    }
  }
}

extension RickAndMortyClient: CharacterListFetchingService {
  @MainActor
  func fetchCharacterPage(option: CharacterPageFetchOption) async throws -> CharacterPage {
    return await withCheckedContinuation { continuation in
      apollo.fetch(query: CharactersQuery(page: option.pageNumber)) { result in
        switch result {
        case .success(let gqlResult):
          let characters: [Character] = gqlResult.data?.characters?.results?.compactMap { gqlCharacter in
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
          } ?? []
          
          let page = CharacterPage(next: gqlResult.data?.characters?.info?.next, characters: characters)
          continuation.resume(returning: page)
          
        case .failure(let error):
          print(error.localizedDescription)
        }
      }
    }
  }
}
