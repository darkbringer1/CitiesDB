//
//  CountryDetailServiceProvider.swift
//  CitiesDB
//
//  Created by DarkBringer on 10.12.2021.
//

import Foundation
import DefaultNetworkOperationPackage

class CountryDetailServiceProvider: ApiServiceProvider<CountryDetailRequest> {
    
    init(request: CountryDetailRequest) {
        super.init(method: .get,
                   baseUrl: BaseUrl.main.value,
                   path: Path.country(request.countryId).value,
                   data: request)
    }
}
