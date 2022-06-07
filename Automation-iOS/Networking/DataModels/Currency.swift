//
//  Currency.swift
//  TSandTA
//
//  Created by Dushan Saputhanthri on 19/6/18.
//  Copyright © 2018 RYRA Circuit. All rights reserved.
//

import Foundation

public struct Currency: Codable {
    
    public var code: String?
    public var name: String?
    public var symbol: String?
    
    public init(code: String?, name: String?, symbol: String?) {
        self.code = code
        self.name = name
        self.symbol = symbol
    }
    
    public enum CodingKeys: String, CodingKey {
        case code
        case name
        case symbol
        
    }
    
}
