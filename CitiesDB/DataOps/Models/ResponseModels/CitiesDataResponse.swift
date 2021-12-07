//
//  CitiesDataResponse.swift
//  Cities of the world
//
//  Created by DarkBringer on 7.12.2021.
//

import Foundation

// MARK: - CitiesDataResponse
struct CitiesDataResponse: Codable {
    let data: [City]?
    let links: [Link]?
    let metadata: Metadata?
}

// MARK: - Datum
struct City: Codable {
    let id: Int?
    let wikiDataID, type, name, country: String?
    let countryCode, region: String?
    let regionCode: RegionCode?
    let latitude, longitude: Double?
    
    enum CodingKeys: String, CodingKey {
        case id
        case wikiDataID = "wikiDataId"
        case type, name, country, countryCode, region, regionCode, latitude, longitude
    }
}

enum RegionCode: Codable {
    case integer(Int)
    case string(String)
    
    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if let x = try? container.decode(Int.self) {
            self = .integer(x)
            return
        }
        if let x = try? container.decode(String.self) {
            self = .string(x)
            return
        }
        throw DecodingError.typeMismatch(RegionCode.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for RegionCode"))
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        switch self {
            case .integer(let x):
                try container.encode(x)
            case .string(let x):
                try container.encode(x)
        }
    }
}

// MARK: - Link
struct Link: Codable {
    let rel, href: String?
}

// MARK: - Metadata
struct Metadata: Codable {
    let currentOffset, totalCount: Int?
}
