//
//  RegionalBloc.swift
//  TSandTA
//
//  Created by Dushan Saputhanthri on 19/6/18.
//  Copyright © 2018 RYRA Circuit. All rights reserved.
//

import Foundation

public struct RegionalBloc: Codable {
    
    public var acronym: String?
    public var name: String?
    public var otherAcronyms: [String]?
    public var otherNames: [String]?
    
    public init(acronym: String?, name: String?, otherAcronyms: [String]?, otherNames: [String]?) {
        self.acronym = acronym
        self.name = name
        self.otherAcronyms = otherAcronyms
        self.otherNames = otherNames
    }
    
    public enum CodingKeys: String, CodingKey {
        case acronym
        case name
        case otherAcronyms
        case otherNames
    }
    
}
