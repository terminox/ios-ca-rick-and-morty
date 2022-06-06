//
//  CharacterListPresenter.swift
//  RickAndMortyWorkshop
//
//  Created by Art on 10/5/2565 BE.
//

import Foundation

class CharacterListPresenter {
  weak var displayer: CharacterListDisplayLogic?
}

extension CharacterListPresenter: CharacterListPresentationLogic {
  func present(response: CharacterListUseCase.Fetch.Response) {
    let result = response.result
    let viewModel = CharacterListUseCase.Fetch.ViewModel(result: result)
    displayer?.display(viewModel: viewModel)
  }
}

protocol CharacterListDisplayLogic: AnyObject {
  func display(viewModel: CharacterListUseCase.Fetch.ViewModel)
}
