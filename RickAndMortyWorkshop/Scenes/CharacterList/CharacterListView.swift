//
//  CharacterListView.swift
//  RickAndMortyWorkshop
//
//  Created by Art on 10/5/2565 BE.
//

import SwiftUI

struct CharacterListView: View {
  
  @ObservedObject var viewModel: CharacterListViewModel
  
  var body: some View {
    ZStack {
      if let _ = viewModel.error {
        VStack {
          Image(systemName: "exclamationmark.octagon")
            .resizable()
            .frame(width: 200, height: 200)
            .foregroundColor(.red)
          
          Text("Network error!")
          Text("Please check your connection.")
        }
      } else {
        List {
          ForEach(viewModel.characters) { character in
            Button(action: {
              viewModel.select(character)
            }) {
              CharacterRow(character: character)
                .onAppear {
                  if character == viewModel.characters.last {
                    viewModel.onLoadMore()
                  }
                }
            }
          }
        }
      }
    }
    .onAppear {
      viewModel.onAppear()
    }
  }
}

extension Character: Identifiable {}

struct CharacterRow: View {
  
  let character: Character
  
  var body: some View {
    HStack(spacing: 16) {
      AsyncImage(
        url: character.imageURL,
        content: { image in
          image
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(width: 75, height: 75)
        },
        placeholder: {
          ProgressView()
        })
      .frame(width: 75, height: 75)
      
      VStack(alignment: .leading, spacing: 8) {
        Text(character.name)
          .font(.title3)
          .fontWeight(.semibold)
        
        Text(character.species)
          .foregroundColor(.gray)
      }
    }
    .padding(.vertical, 8)
  }
}

struct CharacterListView_Previews: PreviewProvider {
  static var previews: some View {
    CharacterListView(viewModel: CharacterListViewModel())
  }
}
