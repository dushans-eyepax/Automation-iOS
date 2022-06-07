//
//  CountryListViewModel.swift
//  Automation-iOS
//
//  Created by Dushan Saputhanthri on 6/6/22.
//

import UIKit

class CountryListViewModel: NSObject {
    
    var countryList:[Country] = []
    
    func getCountryListWithAPI(completion: @escaping CompletionHandler) {
        
        CountriesAPI.getAllCountries(parameters: [:], completion: { success, data, error in
            if success {
                self.countryList = data ?? []
                completion(true, 200, "Countries are loaded successfully.")
                
            } else {
                completion(false, 406, error?.localizedDescription ?? "Failed to load countries.")
            }
        })
    }
}
