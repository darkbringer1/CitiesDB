//
//  DetailViewBuilder.swift
//  CitiesDB
//
//  Created by DarkBringer on 9.12.2021.
//

import UIKit

class DetailViewBuilder {
    class func build(with data: CountryDetailRequest) -> UIViewController {
        let formatter = DetailViewDataFormatter()
        let viewModel = DetailViewModel(data: data, dataFormatter: formatter)
        let viewController = DetailViewController(viewModel: viewModel)
        
        return viewController
        
    }
}
