//
//  EndpointManager.swift
//  Cities of the world
//
//  Created by DarkBringer on 7.12.2021.
//

import Foundation
import BaseComponents

typealias BaseUrl = EndpointManager.BaseURL
typealias Path = EndpointManager.Paths

enum EndpointManager {
    
    enum BaseURL: GenericValueProtocol {
        
        typealias Value = String
        
        case main
        var value: String {
            switch self {
                case .main:
                    return "https://wft-geo-db.p.rapidapi.com/v1"
            }
        }
    }
    
    enum Paths: GenericValueProtocol {
        typealias Value = String
        
        case cities
        
        var value: String {
            switch self {
                case .cities:
                    return "geo/cities"
            }
        }
    }
}

