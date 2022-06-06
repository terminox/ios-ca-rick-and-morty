//
//  HomeViewModel.swift
//  RickAndMortyWorkshop
//
//  Created by Art on 18/5/2565 BE.
//

import Foundation

protocol HomeViewDelegate: AnyObject {
  func homeView(_ viewModel: HomeViewModel, didSeeMore section: HomeSection)
  func homeView(_ viewModel: HomeViewModel, didSelectItem item: HomeSectionItem)
}

class HomeViewModel: ObservableObject {
  
  @Published var sections: [HomeSection] = []
  
  var service: HomeFetchingService
  weak var delegate: HomeViewDelegate?
  
  init(service: HomeFetchingService) {
    self.service = service
  }
  
  func onAppear() {
    fetch()
  }
  
  func seeMore(_ section: HomeSection) {
    delegate?.homeView(self, didSeeMore: section)
  }
  
  func select(_ item: HomeSectionItem) {
    delegate?.homeView(self, didSelectItem: item)
  }
  
  private func fetch() {
    Task {
      do {
        let payload = HomePageFetchingPayload(limit: 5)
        let homePage = try await service.fetchHomePage(payload)
        sections = formattedSections(homePage)
      } catch {
        print(error.localizedDescription)
      }
    }
  }
  
  private func formattedSections(_ homePage: HomePage) -> [HomeSection] {
    let characterItems: [HomeSectionItem] = homePage.characters.map { character in
      return HomeSectionItem(itemType: .character(character), imageURL: character.imageURL)
    }
    let characterSection = HomeSection(sectionType: .character, title: "Characters", items: characterItems)
    
    let locationItems: [HomeSectionItem] = homePage.locations.map { location in
      return HomeSectionItem(itemType: .location(location), imageURL: location.residents.first?.imageURL)
    }
    let locationSection = HomeSection(sectionType: .location, title: "Locations", items: locationItems)
    
    let episodeItems: [HomeSectionItem] = homePage.episodes.map { episode in
      return HomeSectionItem(itemType: .episode(episode), imageURL: episode.characters.first?.imageURL)
    }
    let episodeSection = HomeSection(sectionType: .episode, title: "Episodes", items: episodeItems)
    
    return [characterSection, locationSection, episodeSection]
  }
}

enum HomeSectionItemType {
  case character(Character)
  case location(Location)
  case episode(Episode)
}

struct HomeSection {
  let sectionType: HomeSectionType
  let title: String
  let items: [HomeSectionItem]
}

enum HomeSectionType {
  case character
  case location
  case episode
}

extension HomeSection: Identifiable {
  var id: String {
    return title
  }
}

struct HomeSectionItem {
  let itemType: HomeSectionItemType
  let imageURL: URL?
}

extension HomeSectionItem: Identifiable {
  var id: String {
    return UUID().uuidString
  }
}
