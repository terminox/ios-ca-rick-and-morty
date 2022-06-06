//
//  LocationListInteractor.swift
//  RickAndMortyWorkshop
//
//  Created by Art on 12/5/2565 BE.
//

import Foundation

class LocationListInteractor {
  
  var service: LocationListFetchingService // Data Access
  var presenter: LocationListPresentationLogic?
  
  init(service: LocationListFetchingService) {
    self.service = service
  }
}

extension LocationListInteractor: LocationListBusinessLogic {
  func fetch(request: LocationListUseCase.Fetch.Request) {
    Task {
      do {
        let currentPage = request.currentPage
        if let next = currentPage?.next {
          let option = LocationPageFetchOption(pageNumber: next)
          let page = try await service.fetchLocationPage(option: option)
          let response = LocationListUseCase.Fetch.Response(result: .success(page))
          presenter?.present(response: response)
        } else {
          let option = LocationPageFetchOption(pageNumber: 0)
          let page = try await service.fetchLocationPage(option: option)
          let response = LocationListUseCase.Fetch.Response(result: .success(page))
          presenter?.present(response: response)
        }
      } catch {
        let response = LocationListUseCase.Fetch.Response(result: .failure(error))
        presenter?.present(response: response)
      }
    }
  }
}

// Input Boundary / Business Logic
protocol LocationListBusinessLogic {
  func fetch(request: LocationListUseCase.Fetch.Request)
}

// Output Boundary / Presentation Logic
protocol LocationListPresentationLogic {
  func present(response: LocationListUseCase.Fetch.Response)
}

// Data Access Interface
protocol LocationListFetchingService {
  func fetchLocationPage(option: LocationPageFetchOption) async throws -> LocationPage
}

struct LocationPageFetchOption {
  let pageNumber: Int
}

// Input / Output Data
enum LocationListUseCase {
  enum Fetch {
    // Input Data
    struct Request {
      let currentPage: LocationPage?
    }
    
    // Output Data
    struct Response {
      let result: Result<LocationPage, Error>
    }
    
    struct ViewModel {
      let result: Result<LocationPage, Error>
    }
  }
}
