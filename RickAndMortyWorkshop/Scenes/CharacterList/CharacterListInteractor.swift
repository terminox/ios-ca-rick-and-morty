//
//  CharacterListInteractor.swift
//  RickAndMortyWorkshop
//
//  Created by Art on 10/5/2565 BE.
//

import Foundation

class CharacterListInteractor {
  
  var service: CharacterListFetchingService // Data Access
  var presenter: CharacterListPresentationLogic?
  
  init(service: CharacterListFetchingService) {
    self.service = service
  }
}

extension CharacterListInteractor: CharacterListBusinessLogic {
  func fetch(request: CharacterListUseCase.Fetch.Request) {
    Task {
      do {
        let currentPage = request.currentPage
        if let next = currentPage?.next {
          let option = CharacterPageFetchOption(pageNumber: next)
          let page = try await service.fetchCharacterPage(option: option)
          let response = CharacterListUseCase.Fetch.Response(result: .success(page))
          presenter?.present(response: response)
        } else {
          let option = CharacterPageFetchOption(pageNumber: 0)
          let page = try await service.fetchCharacterPage(option: option)
          let response = CharacterListUseCase.Fetch.Response(result: .success(page))
          presenter?.present(response: response)
        }
      } catch {
        let response = CharacterListUseCase.Fetch.Response(result: .failure(error))
        presenter?.present(response: response)
      }
    }
  }
}

// Input Boundary / Business Logic
protocol CharacterListBusinessLogic {
  func fetch(request: CharacterListUseCase.Fetch.Request)
}

// Output Boundary / Presentation Logic
protocol CharacterListPresentationLogic {
  func present(response: CharacterListUseCase.Fetch.Response)
}

// Data Access Interface
protocol CharacterListFetchingService {
  func fetchCharacterPage(option: CharacterPageFetchOption) async throws -> CharacterPage
}

struct CharacterPageFetchOption {
  let pageNumber: Int
}

// Input / Output Data
enum CharacterListUseCase {
  enum Fetch {
    // Input Data
    struct Request {
      let currentPage: CharacterPage?
    }
    
    // Output Data
    struct Response {
      let result: Result<CharacterPage, Error>
    }
    
    struct ViewModel {
      let result: Result<CharacterPage, Error>
    }
  }
}
