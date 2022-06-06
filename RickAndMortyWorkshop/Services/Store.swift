//
//  Store.swift
//  RickAndMortyWorkshop
//
//  Created by Art on 12/5/2565 BE.
//

import Foundation

class Store {
  let client = RickAndMortyClient.shared
  let analytics = Analytics()
}

class Analytics {
  func track() {}
}
