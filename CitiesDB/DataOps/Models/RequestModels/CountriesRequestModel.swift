//
//  CountriesRequestModel.swift
//  CitiesDB
//
//  Created by DarkBringer on 9.12.2021.
//

import Foundation

struct CountriesDataRequest: Codable {
    
    private(set) var limit: Int
    private(set) var offset: Int
    
    init(limit: Int, offset: Int) {
        self.limit = limit
        self.offset = offset
    }
    
}
