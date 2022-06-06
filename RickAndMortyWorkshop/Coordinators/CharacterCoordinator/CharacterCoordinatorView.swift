//
//  CharacterCoordinatorView.swift
//  RickAndMortyWorkshop
//
//  Created by Art on 13/5/2565 BE.
//

import SwiftUI
import Combine

struct CharacterCoordinatorView: UIViewControllerRepresentable {
  
  @ObservedObject var viewModel: CharacterCoordinatorViewModel
  
  class Coordinator: NSObject {
    var navigationController: UINavigationController?
    
    let viewModel: CharacterCoordinatorViewModel
    var cancellables = Set<AnyCancellable>()
    
    init(viewModel: CharacterCoordinatorViewModel) {
      self.viewModel = viewModel
      super.init()
      
      viewModel.$character
        .sink { character in
          if let character = character {
            self.show(character)
          }
        }
        .store(in: &cancellables)
    }
    
    func show(_ character: Character) {
      let characterDetailViewModel = CharacterDetailViewModel(character: character)
      characterDetailViewModel.delegate = self
      
      let characterDetailView = CharacterDetailView(viewModel: characterDetailViewModel)
      let characterDetailViewController = UIHostingController(rootView: characterDetailView)
      navigationController?.pushViewController(characterDetailViewController, animated: true)
    }
  }
  
  func makeCoordinator() -> Coordinator {
    return Coordinator(viewModel: viewModel)
  }
  
  func makeUIViewController(context: Context) -> some UIViewController {
    let characterListViewModel = CharacterListViewModel(service: viewModel.service)
    characterListViewModel.delegate = context.coordinator
    
    let rootView = CharacterListView(viewModel: characterListViewModel)
    let rootViewController = UIHostingController(rootView: rootView)
    let navigationController = UINavigationController(rootViewController: rootViewController)
    context.coordinator.navigationController = navigationController
    return navigationController
  }
  
  func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
  }
}

extension CharacterCoordinatorView.Coordinator: CharacterListViewDelegate {
  func characterListView(_ viewModel: CharacterListViewModel, didSelectCharacter character: Character) {
    let characterDetailViewModel = CharacterDetailViewModel(character: character)
    characterDetailViewModel.delegate = self
    
    let characterDetailView = CharacterDetailView(viewModel: characterDetailViewModel)
    let characterDetailViewController = UIHostingController(rootView: characterDetailView)
    navigationController?.pushViewController(characterDetailViewController, animated: true)
  }
}

extension CharacterCoordinatorView.Coordinator: CharacterDetailViewDelegate {
  func characterDetailView(_ viewModel: CharacterDetailViewModel, didSelectLocation location: Location) {
    let locationDetailViewModel = LocationDetailViewModel(location: location)
    let locationDetailView = LocationDetailView(viewModel: locationDetailViewModel)
    let locationDetailViewController = UIHostingController(rootView: locationDetailView)
    navigationController?.pushViewController(locationDetailViewController, animated: true)
//    navigationController?.present(locationDetailViewController, animated: true)
  }
}

//struct CharacterCoordinatorView_Previews: PreviewProvider {
//  static var previews: some View {
//    CharacterCoordinatorView()
//  }
//}
