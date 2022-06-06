//
//  MockCharacterListFetchingService.swift
//  RickAndMortyWorkshop
//
//  Created by Art on 11/5/2565 BE.
//

import Foundation

class MockCharacterListFetchingService: CharacterListFetchingService {
  func fetchCharacterPage(option: CharacterPageFetchOption) async throws -> CharacterPage {
    throw NSError(domain: "", code: -1)
  }
}
