//
//  Episode.swift
//  RickAndMortyWorkshop
//
//  Created by Art on 12/5/2565 BE.
//

import Foundation

struct Episode {
  let id: String
  let name: String
  let airDate: String
  let episode: String
  let characters: [Character]
}

extension Episode: Equatable {}
