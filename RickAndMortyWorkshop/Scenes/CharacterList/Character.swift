//
//  Character.swift
//  RickAndMortyWorkshop
//
//  Created by Art on 10/5/2565 BE.
//

import Foundation

// Rick and Morty Character Model
struct Character {
  let id: String
  let name: String
  let status: CharacterStatus
  let species: String
  let gender: CharacterGender
  let origin: Location
  let location: Location
  let imageURL: URL?
}

extension Character: Equatable {}

enum CharacterStatus: String {
  case alive
  case dead
  case unknown
}

enum CharacterGender: String {
  case male
  case female
  case genderless
  case unknown
}

extension Character {
  static var rick: Character {
    .init(
      id: "1",
      name: "Rick Sanchez",
      status: .alive,
      species: "Human",
      gender: .male,
      origin: .earth,
      location: .citadelOfRicks,
      imageURL: URL(string: "https://rickandmortyapi.com/api/character/avatar/1.jpeg")!)
  }

  static var morty: Character {
    .init(
      id: "2",
      name: "Morty Smith",
      status: .alive,
      species: "Human",
      gender: .male,
      origin: .earth,
      location: .citadelOfRicks,
      imageURL: URL(string: "https://rickandmortyapi.com/api/character/avatar/2.jpeg")!)
  }
  
  static var summer: Character {
    .init(
      id: "3",
      name: "Summer Smith",
      status: .alive,
      species: "Human",
      gender: .female,
      origin: .earth,
      location: .citadelOfRicks,
      imageURL: URL(string: "https://rickandmortyapi.com/api/character/avatar/3.jpeg")!)
  }

  static var characters: [Character] {
    [.rick, .morty, .summer]
  }
}
