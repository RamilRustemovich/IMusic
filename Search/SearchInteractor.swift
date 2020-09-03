//
//  SearchInteractor.swift
//  IMusic
//
//  Created by Ramil Davletshin on 18.08.2020.
//  Copyright (c) 2020 Ramil Davletshin. All rights reserved.
//

import UIKit

protocol SearchBusinessLogic {
  func makeRequest(request: Search.Model.Request.RequestType)
}


class SearchInteractor: SearchBusinessLogic {

  var presenter: SearchPresentationLogic?
  var service: SearchService?
    private var networkService = NetworkService()
  
  func makeRequest(request: Search.Model.Request.RequestType) {
    if service == nil {
      service = SearchService()
    }
    
    switch request {
    case .getTracks(let searchTerm):
        presenter?.presentData(response: .presentFooterView)
        networkService.fetchTracks(searchText: searchTerm) { [weak self] (searchResponse) in
            self?.presenter?.presentData(response: .presentTracks(searchResponse: searchResponse))
        }
    }
    
  }
  
}
