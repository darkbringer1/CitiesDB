//
//  HomeViewModel.swift
//  Cities of the world
//
//  Created by DarkBringer on 7.12.2021.
//

import Foundation
import DefaultNetworkOperationPackage
import BaseComponents

typealias ViewStateBlock = (HomeViewState) -> Void

class HomeViewModel {
    
    private var dataFormatter: HomeViewDataFormatterProtocol
    private var homeViewState: ViewStateBlock?
    private var detailViewState: ((CountryDetailRequest) -> Void)?
    
    init(dataFormatter: HomeViewDataFormatterProtocol) {
        self.dataFormatter = dataFormatter
    }
    
    
    func getData() {
        homeViewState?(.loading)
        do {
            guard let urlRequest = try? CountriesServiceProvider(request: getCountriesDataRequest()).returnUrlRequest(headerType: .rapidApi("d8f665eb3fmsh2bb4d003a73d548p15c094jsnede373d832cb")) else { return }
            fireApiCall(urlRequest: urlRequest, completion: countriesDataListener)
        }
    }
    
    func subscribeDetailViewState(with completion: @escaping (CountryDetailRequest) -> Void) {
        detailViewState = completion
    }
    
    func subscribeHomeViewState(with completion: @escaping ViewStateBlock) {
        homeViewState = completion
    }
    
    private func getCountriesDataRequest() -> CountriesDataRequest {
        return CountriesDataRequest(limit: dataFormatter.paginationData.limit,
                                    offset: dataFormatter.paginationData.offset)
    }
    
    private func fireApiCall(urlRequest: URLRequest, completion: @escaping (Result<CountriesDataResponse, ErrorResponse>) -> Void) {
        APIManager.shared.executeRequest(urlRequest: urlRequest, completion: completion)
    }
    
    private lazy var countriesDataListener: (Result<CountriesDataResponse, ErrorResponse>) -> Void = { [weak self] result in
        
        self?.dataFormatter.paginationData.fetching = false
        
        switch result {
            case .failure(let error):
                print("Error data listener: \(error)")
            case .success(let response):
                self?.apiCallHandler(from: response)
        }
    }
    
    private func apiCallHandler(from response: CountriesDataResponse) {
        dataFormatter.setData(with: response)
        homeViewState?(.done)
    }
}

extension HomeViewModel: DataProviderProtocol {
    func askNumberOfSection() -> Int {
        return 0
    }
    
    func askNumberOfItem(in section: Int) -> Int {
        return dataFormatter.getNumbeOfItem(in: section)
    }
    
    func askData(at index: Int) -> GenericDataProtocol? {
        return dataFormatter.getItem(at: index)
    }
    
    func selectedItem(at index: Int) {
        print("tapped index: \(index)")
        detailViewState?(CountryDetailRequest(countryId: dataFormatter.getItemId(at: index)))
    }
    
    func getMoreData() {
        guard dataFormatter.paginationData.checkLoadingMore() else { return }
        dataFormatter.paginationData.nextOffset()
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            self.getData()
        }
    }
    
    func isLoadingCell(for index: Int) -> Bool {
        return index >= dataFormatter.getCount()
    }
    
    
    
}
enum HomeViewState {
    case loading
    case done
    case failure
}
