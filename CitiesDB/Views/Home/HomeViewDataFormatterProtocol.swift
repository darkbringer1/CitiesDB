//
//  HomeViewDataFormatterProtocol.swift
//  CitiesDB
//
//  Created by DarkBringer on 7.12.2021.
//

import Foundation
import BaseComponents

protocol HomeViewDataFormatterProtocol {
    
    var paginationData: PaginationInfo { get set }
    
    func getNumberOfSection() -> Int
    
    func getNumbeOfItem(in section: Int) -> Int
    
    func getCount() -> Int
    
    func setData(with response: CountriesDataResponse)
    
    func getItem(at index: Int) -> GenericDataProtocol?
    
    func getItemId(at index: Int) -> String
}
