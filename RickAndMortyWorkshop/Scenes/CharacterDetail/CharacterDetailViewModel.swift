//
//  CharacterDetailViewModel.swift
//  RickAndMortyWorkshop
//
//  Created by Art on 13/5/2565 BE.
//

import Foundation

protocol CharacterDetailViewDelegate: AnyObject {
  func characterDetailView(_ viewModel: CharacterDetailViewModel, didSelectLocation location: Location)
}

class CharacterDetailViewModel: ObservableObject {
  
  let character: Character
  weak var delegate: CharacterDetailViewDelegate?
  
  init(character: Character) {
    self.character = character
  }
  
  func select(_ location: Location) {
    delegate?.characterDetailView(self, didSelectLocation: location)
  }
}
