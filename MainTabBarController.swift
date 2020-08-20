//
//  MainTabBarController.swift
//  IMusic
//
//  Created by Ramil Davletshin on 17.08.2020.
//  Copyright © 2020 Ramil Davletshin. All rights reserved.
//

import UIKit
import SwiftUI

class MainTabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        tabBar.tintColor = #colorLiteral(red: 1, green: 0, blue: 0.3764705882, alpha: 1)
        
        let searchVC: SearchViewController = SearchViewController.loadFromStoryboard()
        let navigationSearchVC = generateViewController(rootViewController: searchVC, image: #imageLiteral(resourceName: "search"), title: "Search")
        let contentView = UIHostingController(rootView: ContentView())
        let libraryVC = generateViewController(rootViewController: contentView, image: #imageLiteral(resourceName: "library"), title: "Library")
        viewControllers = [navigationSearchVC, libraryVC]
    }
    
    private func generateViewController(rootViewController: UIViewController, image: UIImage, title: String) -> UIViewController {
        let navigationVC = UINavigationController(rootViewController: rootViewController)
        navigationVC.tabBarItem.image = image
        navigationVC.tabBarItem.title = title
        navigationVC.navigationBar.prefersLargeTitles = true
        rootViewController.navigationItem.title = title
        return navigationVC
    }
    
}
