//
//  SearchPresenter.swift
//  IMusic
//
//  Created by Ramil Davletshin on 18.08.2020.
//  Copyright (c) 2020 Ramil Davletshin. All rights reserved.
//

import UIKit

protocol SearchPresentationLogic {
  func presentData(response: Search.Model.Response.ResponseType)
}

class SearchPresenter: SearchPresentationLogic {
  weak var viewController: SearchDisplayLogic?
  
  func presentData(response: Search.Model.Response.ResponseType) {
    switch response {
    case .presentFooterView:
        viewController?.displayData(viewModel: .displayFooterView)
    case .presentTracks(let searchResults):
        
        let cells = searchResults?.results.map({ (track) in
            cellViewModel(from: track)
        }) ?? []
        
        let searchViewModel = SearchViewModel.init(cells: cells)
        viewController?.displayData(viewModel: .displayTracks(searchViewModel: searchViewModel))
    }
  }
    
    private func cellViewModel(from track: Track) -> SearchViewModel.Cell {
        return SearchViewModel.Cell(trackName: track.trackName,
                                    collectionName: track.collectionName ?? "",
                                    artistName: track.artistName,
                                    iconUrlString: track.artworkUrl100,
                                    previewUrl: track.previewUrl)
    }
  
}
