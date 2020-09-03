//
//  SearchModels.swift
//  IMusic
//
//  Created by Ramil Davletshin on 18.08.2020.
//  Copyright (c) 2020 Ramil Davletshin. All rights reserved.
//

import UIKit

enum Search {
   
  enum Model {
    struct Request {
      enum RequestType {
        case getTracks(searchTerm: String)
      }
    }
    struct Response {
      enum ResponseType {
        case presentFooterView
        case presentTracks(searchResponse: SearchResponse?)
      }
    }
    struct ViewModel {
      enum ViewModelData {
        case displayTracks(searchViewModel: SearchViewModel)
        case displayFooterView
      }
    }
  }
  
}




struct SearchViewModel {
    
    struct Cell: TrackCellViewModel {
        var trackName: String
        var collectionName: String
        var artistName: String
        var iconUrlString: String?
        var previewUrl: String?
    }
    
    let cells: [Cell]
}
