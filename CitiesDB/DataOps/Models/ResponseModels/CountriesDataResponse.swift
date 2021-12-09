//
//  CountriesDataRespone.swift
//  CitiesDB
//
//  Created by DarkBringer on 9.12.2021.
//

import Foundation

// MARK: - Countries
struct CountriesDataResponse: Codable {
    let data: [Country]
    let links: [Link]
    let metadata: Metadata
}

// MARK: - Datum
struct Country: Codable {
    let code: String
    let currencyCodes: [String]
    let name: String
    let wikiDataID: String
    
    enum CodingKeys: String, CodingKey {
        case code, currencyCodes, name
        case wikiDataID = "wikiDataId"
    }
}
