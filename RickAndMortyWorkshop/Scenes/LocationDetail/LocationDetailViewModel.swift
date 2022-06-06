//
//  LocationDetailViewModel.swift
//  RickAndMortyWorkshop
//
//  Created by Art on 13/5/2565 BE.
//

import Foundation

class LocationDetailViewModel: ObservableObject {
  
  let location: Location
  
  init(location: Location) {
    self.location = location
  }
}
