//
//  Configuration.swift
//  Automation-iOS
//
//  Created by Dushan Saputhanthri on 6/6/22.
//

import UIKit

class Configuration: NSObject {

    static let shared = Configuration()
    
    enum Error: Swift.Error {
        case missingKey, invalidValue
    }
    
    func value<T>(for key: String) throws -> T where T: LosslessStringConvertible {
        guard let object = Bundle.main.object(forInfoDictionaryKey: key) else {
            throw Error.missingKey
        }
        
        switch object {
        case let value as T:
            return value
        case let string as String:
            guard let value = T(string) else {
                fallthrough
            }
            return value
        default:
            throw Error.invalidValue
        }
    }
}

extension Configuration {
    struct API {
        static var apiKey: String {
            return try! Configuration.shared.value(for: Constants.Keys.apiKey)
        }
        static var baseUrl: String {
            return try! Configuration.shared.value(for: Constants.Keys.baseUrl)
        }
    }
}

extension Configuration {
    //MARK: Get url query from array of items (Int, String, Double etc. arrays)
    public func getQueryFromArray(key: String, array: [Any]) -> String? {
        
        var query = ""
        
        guard !(array.isEmpty) else {
            return nil
        }
        
        for i in 0...(array.count - 1) {
            query.append("\(key)[\(i)]=\(array[i])&")
        }
        
        query.removeLast()
        
        return query
        
    }
    
    
    //MARK: Get url query from dictionary
    public func getQueryFromDictionary(dict: [String: Any]) -> String? {
        
        var query = ""
        
        guard !(dict.isEmpty) else {
            return nil
        }
        
        for (key, value) in dict {
            query.append("\(key)=\(value)&")
        }
        
        query.removeLast()
        
        return query
        
    }
}
