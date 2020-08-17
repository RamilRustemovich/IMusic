//
//  NetworkService.swift
//  IMusic
//
//  Created by Ramil Davletshin on 18.08.2020.
//  Copyright © 2020 Ramil Davletshin. All rights reserved.
//

import UIKit
import Alamofire


class NetworkService {
        
    func fetchTracks(searchText: String, completion: @escaping (SearchResponse?) -> ()) {
        let url = "https://itunes.apple.com/search?term=\(searchText)"
        let parameters = ["term": "\(searchText)", "limit": "10", "media": "music"]
        
        AF.request(url, parameters: parameters).responseData { (dataResponse) in
            if let error = dataResponse.error {
                print("error: \(error.localizedDescription)")
                completion(nil)
                return
            }
            
            guard let data = dataResponse.data else { return }
            
            let decoder = JSONDecoder()
            do {
                let objects = try decoder.decode(SearchResponse.self, from: data)
                print("objects: ", objects)
                completion(objects)
                
            } catch let jsonError {
                print("Failed to decode JSON", jsonError)
                completion(nil)
            }
        }
    }
}
