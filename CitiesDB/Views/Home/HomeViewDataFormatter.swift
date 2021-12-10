//
//  HomeViewDataFormatter.swift
//  CitiesDB
//
//  Created by DarkBringer on 7.12.2021.
//

import Foundation
import BaseComponents

class HomeViewDataFormatter: HomeViewDataFormatterProtocol {
    
    private var data: CountriesDataResponse?
    private var list: [Country] = [Country]()
    
    
    var paginationData: PaginationInfo = PaginationInfo()
    
    func getNumberOfSection() -> Int {
        return 1
    }
    
    func getNumbeOfItem(in section: Int) -> Int {
        let count = list.count
        return (paginationData.limit <= paginationData.resultCount) ? count + 1 : count
    }
    
    func getCount() -> Int {
        return list.count
    }
    
    func setData(with response: CountriesDataResponse) {
        self.data = response
        self.paginationData.resultCount = response.data.count
        self.list.append(contentsOf: response.data)
    }
    
    func getItem(at index: Int) -> GenericDataProtocol? {
        return ContentDisplayerViewData(name: list[index].name)
    }
    
    func getItemId(at index: Int) -> String {
        return list[index].code
    }
    
    
    
}
