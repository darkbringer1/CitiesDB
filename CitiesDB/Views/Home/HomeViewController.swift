//
//  HomeViewController.swift
//  Cities of the world
//
//  Created by DarkBringer on 7.12.2021.
//

import UIKit
import BaseComponents

class HomeViewController: BaseViewController<HomeViewModel> {
    
    private var citiesCollectionView: MainCollectionView!
    
    override func prepareViewControllerConfigurations() {
        super.prepareViewControllerConfigurations()
        view.backgroundColor = .red
        addViewModelListeners()
        addMainComponent()
        viewModel.getData()
    }
    
    private func addMainComponent() {
        citiesCollectionView = MainCollectionView()
        citiesCollectionView.translatesAutoresizingMaskIntoConstraints = false
        citiesCollectionView.dataProvider = viewModel
        
        view.addSubview(citiesCollectionView)
        
        NSLayoutConstraint.activate([
            
            citiesCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            citiesCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            citiesCollectionView.topAnchor.constraint(equalTo: view.topAnchor),
            citiesCollectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
        ])
        
    }
    private func addViewModelListeners() {
        viewModel.subscribeHomeViewState { [weak self] state in
            switch state {
                case .loading:
                    return
                case .done:
                    self?.citiesCollectionView.reloadCollectionView()
                case .failure:
                    return
            }
        }
        viewModel.subscribeDetailViewState { [weak self] data in
            self?.fireDetailView(with: data)
        }
    }
    
    private func fireDetailView(with data: CountryDetailRequest) {
        let viewController = DetailViewBuilder.build(with: data)
        self.navigationController?.pushViewController(viewController, animated: true)
    }
}
