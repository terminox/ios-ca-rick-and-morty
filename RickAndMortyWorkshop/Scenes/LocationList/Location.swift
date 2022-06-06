//
//  Location.swift
//  RickAndMortyWorkshop
//
//  Created by Art on 12/5/2565 BE.
//

import Foundation

struct Location {
  let id: String
  let name: String
  let type: String
  let dimension: String
  let residents: [Character]
}

extension Location: Equatable {}

extension Location {
  static var locations: [Location] {
    [
      .earth,
      .abadango,
      .citadelOfRicks,
    ]
  }

  static var earth: Location {
    .init(
      id: "1",
      name: "Earth (C-137)",
      type: "Planet",
      dimension: "Dimension C-137",
      residents: [])
  }
  
  static var abadango: Location {
    .init(
      id: "2",
      name: "Abadango",
      type: "Cluster",
      dimension: "unknown",
      residents: [])
  }
  
  static var citadelOfRicks: Location {
    .init(
      id: "3",
      name: "Citadel of Ricks",
      type: "Space station",
      dimension: "unknown",
      residents: [])
  }
}
