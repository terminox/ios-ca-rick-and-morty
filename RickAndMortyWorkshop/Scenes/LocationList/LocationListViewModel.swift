//
//  LocationListViewModel.swift
//  RickAndMortyWorkshop
//
//  Created by Art on 12/5/2565 BE.
//

import Foundation

class LocationListViewModel: ObservableObject {
  
  @Published var locations: [Location] = []
  @Published var error: Error?
  private var currentPage: LocationPage?
  
  var interactor: LocationListBusinessLogic?
  
  func onAppear() {
    if locations.isEmpty {
      fetch()
    }
  }
  
  func onLoadMore() {
    if currentPage?.next != nil {
      fetch()
    }
  }
  
  private func fetch() {
    let request = LocationListUseCase.Fetch.Request(currentPage: currentPage)
    interactor?.fetch(request: request)
  }
}

extension LocationListViewModel: LocationListDisplayLogic {
  func display(viewModel: LocationListUseCase.Fetch.ViewModel) {
    switch viewModel.result {
    case .success(let page):
      currentPage = page
      locations.append(contentsOf: page.locations)
      error = nil
      
    case .failure(let error):
      currentPage = nil
      locations = []
      self.error = error
    }
  }
}

extension LocationListViewModel {
  convenience init(service: LocationListFetchingService) {
    self.init()
    let displayer = self
    let interactor = LocationListInteractor(service: service)
    let presenter = LocationListPresenter()
    interactor.presenter = presenter
    presenter.displayer = displayer
    displayer.interactor = interactor
  }
}
