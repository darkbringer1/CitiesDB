//
//  CountriesServiceProvider.swift
//  CitiesDB
//
//  Created by DarkBringer on 9.12.2021.
//

import Foundation
import DefaultNetworkOperationPackage

class CountriesServiceProvider: ApiServiceProvider<CountriesDataRequest> {
    
    init(request: CountriesDataRequest) {
        super.init(method: .get,
                   baseUrl: BaseUrl.main.value,
                   path: Path.countries.value,
                   data: request)
    }
}
