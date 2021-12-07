//
//  CitiesServiceProvider.swift
//  Cities of the world
//
//  Created by DarkBringer on 7.12.2021.
//

import Foundation
import DefaultNetworkOperationPackage

class CitiesServiceProvider: ApiServiceProvider<CitiesDataRequest> {
    
    init(request: CitiesDataRequest) {
        super.init(method: .get,
                   baseUrl: BaseUrl.main.value,
                   path: Path.cities.value,
                   data: request)
    }
}
