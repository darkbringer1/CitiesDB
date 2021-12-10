//
//  DetailViewData.swift
//  CitiesDB
//
//  Created by DarkBringer on 9.12.2021.
//

import Foundation
import WebKit

class DetailViewData {
    
    
    private(set) var imageRequest: URLRequest
    private(set) var countryId: String
    private(set) var countryLink: String
    
    init(imageRequest: URLRequest,
         countryId: String,
         countryLink: String) {
        self.imageRequest = imageRequest
        self.countryId = countryId
        self.countryLink = countryLink
    }
    
}
