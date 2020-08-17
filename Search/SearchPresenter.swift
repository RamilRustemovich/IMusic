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
  
  }
  
}
