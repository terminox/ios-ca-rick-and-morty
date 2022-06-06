//
//  LocationListView.swift
//  RickAndMortyWorkshop
//
//  Created by Art on 12/5/2565 BE.
//

import SwiftUI

struct LocationListView: View {
  
  @ObservedObject var viewModel: LocationListViewModel
  
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
          ForEach(viewModel.locations) { location in
            LocationRow(location: location)
              .onAppear {
                if location == viewModel.locations.last {
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

extension Location: Identifiable {}

struct LocationRow: View {
  
  let location: Location
  
  var body: some View {
    VStack(alignment: .leading, spacing: 8) {
      Text(location.name)
        .font(.title3)
        .fontWeight(.semibold)
      
      Text(location.dimension)
        .foregroundColor(.gray)
    }
    .padding(.vertical, 8)
  }
}

struct LocationListView_Previews: PreviewProvider {
  static var previews: some View {
    LocationListView(viewModel: LocationListViewModel())
  }
}

