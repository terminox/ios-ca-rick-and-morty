//
//  LocationListPresenter.swift
//  RickAndMortyWorkshop
//
//  Created by Art on 12/5/2565 BE.
//

import Foundation

class LocationListPresenter {
  weak var displayer: LocationListDisplayLogic?
}

extension LocationListPresenter: LocationListPresentationLogic {
  func present(response: LocationListUseCase.Fetch.Response) {
    let result = response.result
    let viewModel = LocationListUseCase.Fetch.ViewModel(result: result)
    displayer?.display(viewModel: viewModel)
  }
}

protocol LocationListDisplayLogic: AnyObject {
  func display(viewModel: LocationListUseCase.Fetch.ViewModel)
}
