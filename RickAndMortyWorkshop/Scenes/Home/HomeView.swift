//
//  HomeView.swift
//  RickAndMortyWorkshop
//
//  Created by Art on 18/5/2565 BE.
//

import SwiftUI

struct HomeView: View {
  
  @ObservedObject var viewModel: HomeViewModel
  
  var body: some View {
    ScrollView {
      VStack(spacing: 16) {
        ForEach(viewModel.sections) { section in
          VStack(spacing: 8) {
            HStack {
              Text(section.title)
                .font(.title3)
                .fontWeight(.semibold)
              
              Spacer()
              
              Button(action: {
                viewModel.seeMore(section)
              }) {
                HStack(spacing: 4) {
                  Text("See more")
                  
                  Image(systemName: "chevron.right")
                }
              }
            }
            .padding(.horizontal, 24)
            
            ScrollView(.horizontal, showsIndicators: false) {
              HStack(spacing: 16) {
                ForEach(section.items) { item in
                  Button(action: {
                    viewModel.select(item)
                  }) {
                    AsyncImage(
                      url: item.imageURL,
                      content: { image in
                        image
                          .resizable()
                          .scaledToFill()
                          .frame(width: 120, height: 150)
                          .clipped()
                      },
                      placeholder: {
                        ProgressView()
                      })
                    .frame(width: 120, height: 150)
                  .background(Color.gray)
                  }
                }
              }
              .padding(.horizontal, 24)
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

struct HomeView_Previews: PreviewProvider {
  static var previews: some View {
    HomeView(viewModel: HomeViewModel(service: MockHomeFetchingService()))
  }
}

class MockHomeFetchingService: HomeFetchingService {
  func fetchHomePage(_ payload: HomePageFetchingPayload) async throws -> HomePage {
    return HomePage(
      characters: Character.characters,
      locations: Location.locations,
      episodes: [])
  }
}
