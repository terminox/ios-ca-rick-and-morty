//
//  RickAndMortyClient.swift
//  RickAndMortyWorkshop
//
//  Created by Art on 11/5/2565 BE.
//

import Foundation
import Apollo

class RickAndMortyClient {
  static let shared = RickAndMortyClient()

  private(set) lazy var apollo = ApolloClient(url: URL(string: "https://rickandmortyapi.com/graphql")!)
}
