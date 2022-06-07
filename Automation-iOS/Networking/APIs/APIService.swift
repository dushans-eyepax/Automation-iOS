//
//  Created by Dushan Saputhanthri on 15/6/18.
//  Copyright © 2018 RYRA Circuit. All rights reserved.
//

import Foundation
import UIKit
import Alamofire
import SwiftyJSON

enum ApiVersion: String {
    case v1 = "/v1"
    case v2 = "/v2"
    case v3 = "/v3"
    case v3_1 = "/v3.1"
    
    func value() -> String {
        return self.rawValue
    }
}

enum WebService: String {
    case all = "/all"
    case languageEnglish = "/lang/en"
    
    func value() -> String {
        return self.rawValue
    }
}
