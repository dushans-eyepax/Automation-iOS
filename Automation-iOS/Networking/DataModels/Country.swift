//
//  Country.swift
//  TSandTA
//
//  Created by Dushan Saputhanthri on 5/7/18.
//  Copyright © 2018 RYRA Circuit. All rights reserved.
//

import Foundation

public struct Country: Codable {
    
    public var name: String?
    public var topLevelDomain: [String]?
    public var alpha2Code: String?
    public var alpha3Code: String?
    public var callingCodes: [String]?
    public var capital: String?
    public var altSpellings: [String]?
    public var region: String?
    public var subregion: String?
    public var population: Int?
    public var latlng: [Double]?
    public var demonym: String?
    public var area: Double?
    public var gini: Double?
    public var timezones: [String]?
    public var borders: [String]?
    public var nativeName: String?
    public var numericCode: String?
    public var currencies: [Currency]?
    public var languages: [Language]?
    public var translations: Translation?
    public var flags: Flag?
    public var regionalBlocs: [RegionalBloc]?
    public var cioc: String?
    
    public init(name: String?, topLevelDomain: [String]?, alpha2Code: String?, alpha3Code: String?, callingCodes: [String]?, capital: String?, altSpellings: [String]?, region: String?, subregion: String?, population: Int?, latlng: [Double]?, demonym: String?, area: Double?, gini: Double?, timezones: [String]?, borders: [String]?, nativeName: String?, numericCode: String?, currencies: [Currency]?, languages: [Language]?, translations: Translation?, flags: Flag?, regionalBlocs: [RegionalBloc]?, cioc: String?) {
        self.name = name
        self.topLevelDomain = topLevelDomain
        self.alpha2Code = alpha2Code
        self.alpha3Code = alpha3Code
        self.callingCodes = callingCodes
        self.capital = capital
        self.altSpellings = altSpellings
        self.region = region
        self.subregion = subregion
        self.population = population
        self.latlng = latlng
        self.demonym = demonym
        self.area = area
        self.gini = gini
        self.timezones = timezones
        self.borders = borders
        self.nativeName = nativeName
        self.numericCode = numericCode
        self.currencies = currencies
        self.languages = languages
        self.translations = translations
        self.flags = flags
        self.regionalBlocs = regionalBlocs
        self.cioc = cioc
    }
    
    public enum CodingKeys: String, CodingKey {
        case name
        case topLevelDomain
        case alpha2Code
        case alpha3Code
        case callingCodes
        case capital
        case altSpellings
        case region
        case subregion
        case population
        case latlng
        case demonym
        case area
        case gini
        case timezones
        case borders
        case nativeName
        case numericCode
        case currencies
        case languages
        case translations
        case flags
        case regionalBlocs
        case cioc
    }
    
}
