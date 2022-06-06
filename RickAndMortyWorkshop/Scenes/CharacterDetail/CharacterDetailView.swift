//
//  CharacterDetailView.swift
//  RickAndMortyWorkshop
//
//  Created by Art on 13/5/2565 BE.
//

import SwiftUI

struct CharacterDetailView: View {
  
  @ObservedObject var viewModel: CharacterDetailViewModel
  
  var body: some View {
    VStack(spacing: 32) {
      Text(viewModel.character.name)
        .font(.largeTitle)
      
      Button(action: {
        viewModel.select(viewModel.character.origin)
      }) {
        HStack {
          Text("Origin")
          
          Spacer()
          
          Text(viewModel.character.origin.name)
          
          Image(systemName: "chevron.right")
        }
        .padding(.horizontal, 24)
      }
    }
  }
}

struct CharacterDetailView_Previews: PreviewProvider {
  static var previews: some View {
    CharacterDetailView(viewModel: CharacterDetailViewModel(character: .rick))
  }
}
