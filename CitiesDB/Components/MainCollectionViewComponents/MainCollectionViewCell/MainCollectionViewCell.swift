//
//  MainCollectionViewCell.swift
//  CitiesDB
//
//  Created by DarkBringer on 7.12.2021.
//

import UIKit
import BaseComponents

class MainCollectionViewCell: BaseCollectionViewCell {
    
    private lazy var contentDisplayer: CollectionDisplayerView = {
        let temp = CollectionDisplayerView()
        temp.translatesAutoresizingMaskIntoConstraints = false
        return temp
    }()
    
    override func addMajorViews() {
        super.addMajorViews()
        addContentDisplayer()
    }
    
    private func addContentDisplayer() {
        contentView.addSubview(contentDisplayer)
        
        NSLayoutConstraint.activate([
            
            contentDisplayer.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            contentDisplayer.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            contentDisplayer.topAnchor.constraint(equalTo: contentView.topAnchor),
            contentDisplayer.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            
        ])
        
    }
    
    func setData(by value: GenericDataProtocol) {
        contentDisplayer.setData(by: value)
    }
}

