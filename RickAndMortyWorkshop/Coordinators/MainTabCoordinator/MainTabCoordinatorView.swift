//
//  MainTabCoordinatorView.swift
//  RickAndMortyWorkshop
//
//  Created by Art on 18/5/2565 BE.
//

import SwiftUI

struct MainTabCoordinatorView: UIViewControllerRepresentable {
  
  @ObservedObject var viewModel: MainTabCoordinatorViewModel
  
  class Coordinator: NSObject {
    var tabBarController: UITabBarController?
    var homeViewController: UIViewController?
    var locationListViewController: UIViewController?
    
    var characterCoordinatorViewModel: CharacterCoordinatorViewModel?
  }
  
  func makeCoordinator() -> Coordinator {
    return Coordinator()
  }
  
  func makeUIViewController(context: Context) -> some UIViewController {
    let coordinator = context.coordinator
    let tabBarController = UITabBarController()
    coordinator.tabBarController = tabBarController
    
    let homeViewModel = HomeViewModel(service: viewModel.service)
    homeViewModel.delegate = coordinator
    
    let homeView = HomeView(viewModel: homeViewModel)
    let homeViewController = UIHostingController(rootView: homeView)
    coordinator.homeViewController = homeViewController
    homeViewController.tabBarItem = UITabBarItem(
      title: "Home",
      image: UIImage(systemName: "house"),
      selectedImage: UIImage(systemName: "house.fill"))
    
    let characterCoordinatorViewModel = CharacterCoordinatorViewModel(service: viewModel.service)
    coordinator.characterCoordinatorViewModel = characterCoordinatorViewModel
    let characterCoordinatorView = CharacterCoordinatorView(viewModel: characterCoordinatorViewModel)
    let characterCoordinatorViewController = UIHostingController(rootView: characterCoordinatorView)
    characterCoordinatorViewController.tabBarItem = UITabBarItem(
      title: "Characters",
      image: UIImage(systemName: "person.3"),
      selectedImage: UIImage(systemName: "person.3.fill"))
    
    let locationListViewModel = LocationListViewModel(service: viewModel.service)
    let locationListView = LocationListView(viewModel: locationListViewModel)
    let locationListViewController = UIHostingController(rootView: locationListView)
    coordinator.locationListViewController = locationListViewController
    locationListViewController.tabBarItem = UITabBarItem(
      title: "Locations",
      image: UIImage(systemName: "globe.asia.australia"),
      selectedImage: UIImage(systemName: "globe.asia.australia.fill"))

    let episodeListViewModel = EpisodeListViewModel(service: viewModel.service)
    let episodeListView = EpisodeListView(viewModel: episodeListViewModel)
    let episodeListViewController = UIHostingController(rootView: episodeListView)
    episodeListViewController.tabBarItem = UITabBarItem(
      title: "Episodes",
      image: UIImage(systemName: "tv"),
      selectedImage: UIImage(systemName: "tv.fill"))
    
    tabBarController.viewControllers = [
      homeViewController,
      characterCoordinatorViewController,
      locationListViewController,
      episodeListViewController,
    ]
    
    let tabBar = tabBarController.tabBar
    tabBar.backgroundColor = .black
    tabBar.tintColor = .red
    
    return tabBarController
  }
  
  func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
  }
}

extension MainTabCoordinatorView.Coordinator: HomeViewDelegate {
  func homeView(_ viewModel: HomeViewModel, didSeeMore section: HomeSection) {
    switch section.sectionType {
    case .character:
      tabBarController?.selectedIndex = 1
    case .location:
//      tabBarController?.selectedIndex = 2
      tabBarController?.selectedViewController = locationListViewController
    case .episode:
      tabBarController?.selectedIndex = 3
    }
  }
  
  func homeView(_ viewModel: HomeViewModel, didSelectItem item: HomeSectionItem) {
    switch item.itemType {
    case .character(let character):
      tabBarController?.selectedIndex = 1
      characterCoordinatorViewModel?.show(character)
      
    case .location(let location):
      break
    case .episode(let episode):
      break
    }
  }
}

//struct MainTabCoordinatorView_Previews: PreviewProvider {
//  static var previews: some View {
//    MainTabCoordinatorView()
//  }
//}
