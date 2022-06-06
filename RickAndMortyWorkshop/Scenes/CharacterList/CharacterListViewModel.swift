//
//  CharacterListViewModel.swift
//  RickAndMortyWorkshop
//
//  Created by Art on 10/5/2565 BE.
//

import Foundation

protocol CharacterListViewDelegate: AnyObject {
  func characterListView(_ viewModel: CharacterListViewModel, didSelectCharacter character: Character)
//  func characterListViewDidCancel(_ viewModel: CharacterListViewModel)
}

class CharacterListViewModel: ObservableObject {
  
  @Published var characters: [Character] = []
  @Published var error: Error?
  private var currentPage: CharacterPage?
  
  var interactor: CharacterListBusinessLogic?
  weak var delegate: CharacterListViewDelegate?
  
  func onAppear() {
    if characters.isEmpty {
      fetch()
    }
  }
  
  func onLoadMore() {
    if currentPage?.next != nil {
      fetch()
    }
  }
  
  func select(_ character: Character) {
    // Output character to external layer
    delegate?.characterListView(self, didSelectCharacter: character)
  }
  
  func a(x: Int) {
    
  }
  
  func b(_ x: Int) {
    
  }
  
  func c(y x: Int) {
    print(x)
  }
  
  private func fetch() {
    let request = CharacterListUseCase.Fetch.Request(currentPage: currentPage)
    interactor?.fetch(request: request)
  }
}

extension CharacterListViewModel: CharacterListDisplayLogic {
  func display(viewModel: CharacterListUseCase.Fetch.ViewModel) {
    switch viewModel.result {
    case .success(let page):
      currentPage = page
      characters.append(contentsOf: page.characters)
      error = nil
      
    case .failure(let error):
      currentPage = nil
      characters = []
      self.error = error
    }
  }
}

extension CharacterListViewModel {
  convenience init(service: CharacterListFetchingService) {
    self.init()
    let displayer = self
    let interactor = CharacterListInteractor(service: service)
    let presenter = CharacterListPresenter()
    interactor.presenter = presenter
    presenter.displayer = displayer
    displayer.interactor = interactor
  }
}
