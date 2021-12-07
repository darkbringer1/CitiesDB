//
//  HomeViewBuilder.swift
//  Cities of the world
//
//  Created by DarkBringer on 7.12.2021.
//

import Foundation
import UIKit

class HomeViewBuilder {
    
    class func build() -> UIViewController {
        
        let viewModel = HomeViewModel()
        let viewController = HomeViewController(viewModel: viewModel)
        let navigationController = UINavigationController(rootViewController: viewController)
        return navigationController
        
    }
    
}
