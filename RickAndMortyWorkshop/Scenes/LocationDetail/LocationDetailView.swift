//
//  LocationDetailView.swift
//  RickAndMortyWorkshop
//
//  Created by Art on 13/5/2565 BE.
//

import SwiftUI

struct LocationDetailView: View {
  
  @ObservedObject var viewModel: LocationDetailViewModel
  
  var body: some View {
    Text(viewModel.location.name)
      .font(.largeTitle)
  }
}

struct LocationDetailView_Previews: PreviewProvider {
  static var previews: some View {
    LocationDetailView(viewModel: LocationDetailViewModel(location: .earth))
  }
}
