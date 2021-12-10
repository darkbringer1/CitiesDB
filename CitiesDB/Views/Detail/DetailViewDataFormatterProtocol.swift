//
//  DetailViewDataFormatterProtocol.swift
//  CitiesDB
//
//  Created by DarkBringer on 10.12.2021.
//

import Foundation

protocol DetailViewDataFormatterProtocol {
    func itemDetailView(form data: CountryDetail) -> DetailViewData
}
