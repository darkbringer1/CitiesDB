//
//  CountryDetailRequest.swift
//  CitiesDB
//
//  Created by DarkBringer on 10.12.2021.
//

import Foundation

struct CountryDetailRequest: Codable {
    
    private(set) var countryId: String
    
    init(countryId: String) {
        self.countryId = countryId
    }
    
}
