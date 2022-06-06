//
//  CharacterCoordinatorViewModel.swift
//  RickAndMortyWorkshop
//
//  Created by Art on 13/5/2565 BE.
//

import Foundation

class CharacterCoordinatorViewModel: ObservableObject {
  
  @Published var character: Character?
  
  var service: CharacterListFetchingService
  
  init(service: CharacterListFetchingService) {
    self.service = service
  }
  
  func show(_ character: Character) {
    self.character = character
  }
}
