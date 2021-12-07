//
//  CitiesDataRequestModel.swift
//  Cities of the world
//
//  Created by DarkBringer on 7.12.2021.
//

import Foundation

struct CitiesDataRequest: Codable {
    
    private(set) var limit: Int
    private(set) var offset: Int
    
    init(limit: Int, offset: Int) {
        self.limit = limit
        self.offset = offset
    }

}
