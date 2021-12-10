//
//  DetailViewDataFormatter.swift
//  CitiesDB
//
//  Created by DarkBringer on 10.12.2021.
//

import Foundation
import WebKit

class DetailViewDataFormatter: DetailViewDataFormatterProtocol {
    
    func itemDetailView(form data: CountryDetail) -> DetailViewData {
        
        return DetailViewData(imageRequest: returnImageRequest(from: data), countryId: data.wikiDataID, countryLink: returnLink(from: data))
    }
    
    private func returnImageRequest(from data: CountryDetail) -> URLRequest {
        
        let url = URL(string: "\(data.flagImageURI)")
        let urlRequest = URLRequest(url: url!)
    
        return urlRequest
    }
    private func returnLink(from data: CountryDetail) -> String {
        let id = data.wikiDataID
        return "https://wft-geo-db.p.rapidapi.com/v1/geo/countries/\(id)"
    }
    
}
