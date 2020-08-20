//
//  SearchResponse.swift
//  IMusic
//
//  Created by Ramil Davletshin on 18.08.2020.
//  Copyright © 2020 Ramil Davletshin. All rights reserved.
//

import Foundation

struct SearchResponse: Decodable {
    var resultCount: Int
    var results: [Track]
}


struct Track: Decodable {
    var trackName: String
    var collectionName: String?
    var artistName: String
    var artworkUrl100: String?
    var previewUrl: String?
    
}
