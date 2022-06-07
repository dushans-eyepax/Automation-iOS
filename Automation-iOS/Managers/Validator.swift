//
//  Created by Dushan Saputhanthri on 15/6/18.
//  Copyright © 2018 RYRA Circuit. All rights reserved.
//

import Foundation
import UIKit

enum ValidateError: Error {
    case invalidData(String)
}

protocol ValidatorDelegate {
    func isValidEmailAddress(email: String) -> Bool
    func isValidPhoneNumber(phone: String?) -> Bool
}

extension ValidatorDelegate {
    func isValidEmailAddress(email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        let emailTest = NSPredicate(format: "SELF MATCHES %@", emailRegEx)
        if emailTest.evaluate(with: email) {
            return true
        }
        return false
    }
    
    // This function is used to check the phone number validity
    func isValidPhoneNumber(phone: String?) -> Bool {
        let charcterSet  = NSCharacterSet(charactersIn: "+0123456789").inverted
        let inputString = phone?.components(separatedBy: charcterSet)
        let filtered = inputString?.joined(separator: "")
        return (phone == filtered) && ((filtered!.count) > 5) && ((filtered!.count) < 15)
    }
}
