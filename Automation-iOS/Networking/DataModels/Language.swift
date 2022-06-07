//
//  Language.swift
//  TSandTA
//
//  Created by Dushan Saputhanthri on 19/6/18.
//  Copyright © 2018 RYRA Circuit. All rights reserved.
//

import Foundation

public struct Language: Codable {
    
    public var iso639_1: String?
    public var iso639_2: String?
    public var name: String?
    public var nativeName: String?
    
    public init(iso639_1: String?, iso639_2: String?, name: String?, nativeName: String?) {
        self.iso639_1 = iso639_1
        self.iso639_2 = iso639_2
        self.name = name
        self.nativeName = nativeName
    }
    
    public enum CodingKeys: String, CodingKey {
        case iso639_1
        case iso639_2
        case name
        case nativeName
    }
    
}
