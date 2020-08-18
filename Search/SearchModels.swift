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
        case some
        case getTracks(searchTerm: String)
      }
    }
    struct Response {
      enum ResponseType {
        case some
        case presentTracks(searchResponse: SearchResponse?)
      }
    }
    struct ViewModel {
      enum ViewModelData {
        case some
        case displayTracks(searchViewModel: SearchViewModel)
      }
    }
  }
  
}




struct SearchViewModel {
    
    struct Cell {
        var trackName: String
        var collectionName: String?
        var artistName: String
        var iconUrlString: String?
    }
    
    let cells: [Cell]
}
