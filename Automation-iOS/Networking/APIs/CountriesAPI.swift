//
//  CountriesAPI.swift
//  Copyright © 2020 RYRA Circuit. All rights reserved.
//

import Foundation


open class CountriesAPI {
    
    open class func getCountries(parameters: [String : Any], completion: @escaping ((_ status: Bool, _ data: [Country]?, _ error: Error?) -> Void)) {
        
        let queryParameters = Configuration.shared.getQueryFromDictionary(dict: parameters) ?? ""
        
        let urlString = "https://restcountries.com/v2/lang/en?" //"\(Configuration.API.baseUrl)?\(queryParameters)"
        
        APIClient.performRequest(urlString: urlString, headerType: .Guest, parameters: nil, method: .get) { (status, data, error) in
            completion(status, data, error)
        }
    }
    
}
