//
//  CountriesAPI.swift
//  Copyright © 2020 RYRA Circuit. All rights reserved.
//

import Foundation


open class CountriesAPI {
    
    open class func getAllCountries(parameters: [String : Any], completion: @escaping ((_ status: Bool, _ data: [Country]?, _ error: Error?) -> Void)) {
        
        
        let urlString = Configuration.shared.getUrlQuery(apiVersion: .v2, webService: .all, parameters: parameters)
        
        APIClient.performRequest(urlString: urlString, headerType: .Guest, parameters: nil, method: .get) { (status, data, error) in
            completion(status, data, error)
        }
    }
    
    open class func getEnglishCountries(parameters: [String : Any], completion: @escaping ((_ status: Bool, _ data: [Country]?, _ error: Error?) -> Void)) {
        
        let urlString = Configuration.shared.getUrlQuery(apiVersion: .v2, webService: .languageEnglish, parameters: parameters)
        
        APIClient.performRequest(urlString: urlString, headerType: .Guest, parameters: nil, method: .get) { (status, data, error) in
            completion(status, data, error)
        }
    }
    
}
