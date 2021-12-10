//
//  CountryDetailResponse.swift
//  CitiesDB
//
//  Created by DarkBringer on 10.12.2021.
//

import Foundation

// MARK: - Countries
struct Countries: Codable {
    let data: CountryDetail
}

// MARK: - DataClass
struct CountryDetail: Codable {
    let code: String
    let currencyCodes: [String]
    let flagImageURI: String
    let name: String
    let numRegions: Int
    let wikiDataID: String
    
    enum CodingKeys: String, CodingKey {
        case code, currencyCodes
        case flagImageURI = "flagImageUri"
        case name, numRegions
        case wikiDataID = "wikiDataId"
    }
}
