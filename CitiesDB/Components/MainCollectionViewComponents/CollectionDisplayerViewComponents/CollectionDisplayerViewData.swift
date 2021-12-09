//
//  CollectionDisplayerViewData.swift
//  CitiesDB
//
//  Created by DarkBringer on 7.12.2021.
//

import Foundation
import BaseComponents

class ContentDisplayerViewData: GenericDataProtocol {
    
    var type: GenericRowType? = nil
    
    private(set) var name: String
    
    init(
         name: String) {
        self.name = name
    }
    
}
