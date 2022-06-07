//
//  Created by Dushan Saputhanthri on 15/6/18.
//  Copyright © 2018 RYRA Circuit. All rights reserved.
//

import Foundation
import UIKit

public class Localizator {
    fileprivate func NSLocalizedString(_ key: String) -> String {
        return Foundation.NSLocalizedString(key, comment: "")
    }
}

extension String {
    
    // Segue Identifiers
    
    
    // Unwind Segue Identifiers
    
    
    // UIImage Identifiers
    
    
    // Loding messages
    static let Loading = NSLocalizedString("Loading...", comment: "")
    
    // File extensions
    static let PDF = NSLocalizedString("pdf", comment: "")
    static let HTML = NSLocalizedString("html", comment: "")
    static let DOCX = NSLocalizedString("docx", comment: "")
    static let PNG = NSLocalizedString("png", comment: "")
    
    // TableViewCells
    static let CountryCell = NSLocalizedString("CountryCell", comment: "")
    
    
    // CollectionViewCells
    
    // Alert titles
    static let Alert = NSLocalizedString("Alert", comment: "")
    static let Confirmation = NSLocalizedString("Confirmation", comment: "")
    static let Error = NSLocalizedString("Error", comment: "")
    static let Incomplete = NSLocalizedString("Incomplete", comment: "")
    static let Success = NSLocalizedString("Success", comment: "")
    static let Failed = NSLocalizedString("Failed", comment: "")
    static let Oops = NSLocalizedString("Oops", comment: "")
    static let Warning = NSLocalizedString("Warning", comment: "")
    static let PleaseSelect = NSLocalizedString("Please Select", comment: "")
    static let SelectOption = NSLocalizedString("Select Option", comment: "")
    
    // ALERT MESSAGES
    // Info messages
    
    // Error messages
    
    // Success messages
    
    // Failure messages
    
    // No data messages
    
    // Confirmation messages
    
    // Action titles
    static let OK = NSLocalizedString("OK", comment: "")
    static let Cancel = NSLocalizedString("Cancel", comment: "")
    static let Yes = NSLocalizedString("Yes", comment: "")
    static let No = NSLocalizedString("No", comment: "")
    static let Retry = NSLocalizedString("Retry", comment: "")
    static let Skip = NSLocalizedString("Skip", comment: "")
    static let Dismiss = NSLocalizedString("Dismiss", comment: "")
    
    // Placeholders
    
    
    // Other
    static let NotApplicable = NSLocalizedString("N/A", comment: "")
    static let LineBreak = NSLocalizedString("\n", comment: "")
    static let Comma = NSLocalizedString(",", comment: "")
    static let CommaWithSpace = NSLocalizedString(", ", comment: "")
    static let QuestionMark = NSLocalizedString("?", comment: "")
    static let SingleQotation = NSLocalizedString("'", comment: "")
    static let EmptyString = NSLocalizedString("", comment: "")
    
    
    // Top view controller of the Storyboards
    static let MainNavigationController = NSLocalizedString("MainNavigationController", comment: "")
    
    
    // View Controllers
    static let CountriesViewController = NSLocalizedString("CountriesViewController", comment: "")
    static let CountryDetailsViewController = NSLocalizedString("CountryDetailsViewController", comment: "")
    
    // Navigation bar titles
    
    
    // Error messages with API
    
}

// Colors
extension UIColor {
    
}

// Icons
extension UIImage {
    
}

extension Notification.Name {
    
}
