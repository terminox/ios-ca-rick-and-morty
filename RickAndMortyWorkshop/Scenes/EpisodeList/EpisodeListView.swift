//
//  EpisodeListView.swift
//  RickAndMortyWorkshop
//
//  Created by Art on 12/5/2565 BE.
//

import SwiftUI

struct EpisodeListView: View {
  
  @ObservedObject var viewModel: EpisodeListViewModel
  
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
          ForEach(viewModel.episodes) { episode in
            EpisodeRow(episode: episode)
              .onAppear {
                if episode == viewModel.episodes.last {
                  viewModel.onLoadMore()
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

extension Episode: Identifiable {}

struct EpisodeRow: View {
  
  let episode: Episode
  
  var body: some View {
    VStack(alignment: .leading, spacing: 8) {
      Text(episode.name)
        .font(.title3)
        .fontWeight(.semibold)
      
      Text(episode.airDate)
        .foregroundColor(.gray)
    }
    .padding(.vertical, 8)
  }
}

struct EpisodeListView_Previews: PreviewProvider {
  static var previews: some View {
    EpisodeListView(viewModel: EpisodeListViewModel(service: MockEpisodeListFetchingService()))
  }
}

