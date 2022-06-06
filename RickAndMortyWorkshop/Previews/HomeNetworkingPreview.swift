//
//  HomeNetworkingPreview.swift
//  RickAndMortyWorkshop
//
//  Created by Art on 18/5/2565 BE.
//

import SwiftUI

struct HomeNetworkingPreview: PreviewProvider {
  static var previews: some View {
    HomeView(viewModel: HomeViewModel(service: RickAndMortyClient.shared))
  }
}
