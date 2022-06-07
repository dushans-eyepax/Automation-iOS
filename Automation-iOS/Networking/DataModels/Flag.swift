//
//  Flag.swift
//  TSandTA
//
//  Created by Dushan Saputhanthri on 19/6/18.
//  Copyright © 2018 RYRA Circuit. All rights reserved.
//

import Foundation

public struct Flag: Codable {
    
    public var svg: String?
    public var png: String?
    
    public init(svg: String?, png: String?) {
        self.svg = svg
        self.png = png
    }
    
    public enum CodingKeys: String, CodingKey {
        case svg
        case png
        
    }
    
}
