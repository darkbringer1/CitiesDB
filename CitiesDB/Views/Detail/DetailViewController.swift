//
//  DetailViewController.swift
//  CitiesDB
//
//  Created by DarkBringer on 9.12.2021.
//

import UIKit
import BaseComponents

class DetailViewController: BaseViewController<DetailViewModel> {
    
    private var mainComponent: DetailView!
    
    override func prepareViewControllerConfigurations() {
        super.prepareViewControllerConfigurations()
        addMainComponent()
        viewModelListeners()
        viewModel.getData()
    }
    
    private func addMainComponent() {
        
        mainComponent = DetailView()
        mainComponent.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(mainComponent)
        
        NSLayoutConstraint.activate([
            
            mainComponent.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            mainComponent.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            mainComponent.topAnchor.constraint(equalTo: view.topAnchor),
            mainComponent.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            
        ])
        
        
    }
    
    func viewModelListeners() {
        viewModel.subscribeDetailDataState { [weak self] data in
            self?.mainComponent.setData(by: data)
        }
        
    }
    
}
