//
//  DetailViewModel.swift
//  CitiesDB
//
//  Created by DarkBringer on 9.12.2021.
//

import Foundation
import DefaultNetworkOperationPackage

typealias DetailDataBlock = (DetailViewData) -> Void

class DetailViewModel {
    
    private let data: CountryDetailRequest
    private var detailDataState: DetailDataBlock?
    private let dataFormatter: DetailViewDataFormatterProtocol
    
    init(data: CountryDetailRequest,
         dataFormatter: DetailViewDataFormatterProtocol) {
        self.data = data
        self.dataFormatter = dataFormatter
    }
    
    func getData() {
        
        do {
            guard let urlRequest = try? CountryDetailServiceProvider(request: getCountryDetailRequest()).returnUrlRequest(headerType: .rapidApi("d8f665eb3fmsh2bb4d003a73d548p15c094jsnede373d832cb")) else { return }
            fireDetailApi(request: urlRequest, completion: detailDataListener)
        }
    }

    func subscribeDetailDataState(with completion: @escaping DetailDataBlock) {
        detailDataState = completion
    }
    
    private func getCountryDetailRequest() -> CountryDetailRequest {
        return CountryDetailRequest(countryId: data.countryId)
    }
    
    private func fireDetailApi(request: URLRequest, completion: @escaping (Result<Countries, ErrorResponse>) -> Void) {
        APIManager.shared.executeRequest(urlRequest: request, completion: completion)
    }
    
    private lazy var detailDataListener: (Result<Countries, ErrorResponse>) -> Void = { [weak self] result in
        
        switch result {
            case .failure(let error):
                print("error getting detail data = \(error)")
            case .success(let response):
                self?.detailResponseHandler(from: response)
        }
    }
    
    private func detailResponseHandler(from detailResponse: Countries) {
        detailDataState?(dataFormatter.itemDetailView(form: detailResponse.data))
    }
        
}
