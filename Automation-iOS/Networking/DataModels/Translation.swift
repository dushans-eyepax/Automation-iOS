//
//  Translation.swift
//  TSandTA
//
//  Created by Dushan Saputhanthri on 19/6/18.
//  Copyright © 2018 RYRA Circuit. All rights reserved.
//

import Foundation

public struct Translation: Codable {
    
    public var de: String?
    public var es: String?
    public var fr: String?
    public var ja: String?
    public var it: String?
    public var br: String?
    public var pt: String?
    public var nl: String?
    public var hr: String?
    public var fa: String?
    
    public init(de: String?, es: String?, fr: String?, ja: String?, it: String?, br: String?, pt: String?, nl: String?, hr: String?, fa: String?) {
        self.de = de
        self.es = es
        self.fr = fr
        self.ja = ja
        self.it = it
        self.br = br
        self.pt = pt
        self.nl = nl
        self.hr = hr
        self.fa = fa
    }
    
    public enum CodingKeys: String, CodingKey {
        case de
        case es
        case fr
        case ja
        case it
        case br
        case pt
        case nl
        case hr
        case fa
    }
}
