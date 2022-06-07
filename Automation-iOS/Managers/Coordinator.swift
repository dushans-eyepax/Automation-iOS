//
//  Created by Dushan Saputhanthri on 15/6/18.
//  Copyright © 2018 RYRA Circuit. All rights reserved.
//

import Foundation
import UIKit
import SwiftyBeaver

let log = SwiftyBeaver.self

enum Storyboard: String {
    case Main
}

class Coordinator {
    
    static let shared = Coordinator()
    
    private init() {}
    
    let appDelegate: AppDelegate = UIApplication.shared.delegate as! AppDelegate
    
    // Configure Application
    func configure() {
        
        manageUIAppearance(hideNavBarShadow: true, hideTabBarShadow: false)
        
        configureLogger()
    }
    
    //MARK: Setup application appearance
    private func manageUIAppearance(hasCustomBackButton: Bool = false, hideNavBarShadow: Bool = false, hideTabBarShadow: Bool = false) {
        // Set navigation bar tint / background color
        UINavigationBar.appearance().isTranslucent = false
        
        // Set navigation bar item tint color
        UIBarButtonItem.appearance().tintColor = .white
        
        // Set navigation bar back button tint color
        UINavigationBar.appearance().tintColor = .white
        
        // Set cutom back image if needed
        if hasCustomBackButton == true {
            // Set back button image
            let backImage = #imageLiteral(resourceName: "essentials")
            UINavigationBar.appearance().backIndicatorImage = backImage
            UINavigationBar.appearance().backIndicatorTransitionMaskImage = backImage
        }
        
        // Hide navigation bar shadow if needed
        if hideNavBarShadow == true {
            // To remove the 1px seperator at the bottom of navigation bar
            UINavigationBar.appearance().setBackgroundImage(UIImage(), for: .any, barMetrics: .default)
            UINavigationBar.appearance().shadowImage = UIImage()
        }
        
        // Hide tab bar shadow if needed
        if hideTabBarShadow == true {
            // To remove the 1px seperator at the bottom of tab bar
            UITabBar.appearance().backgroundImage = UIImage()
            UITabBar.appearance().shadowImage = UIImage()
        }
    }
    
    
    //MARK: Logger
    private func configureLogger() {
        let console = ConsoleDestination() // log to Xcode Console
        log.addDestination(console)
    }
    
    //MARK: Manage User Direction
    public func manageUserDirection(from vc: UIViewController? = nil, window: UIWindow? = nil) {
        
        
    }
    
    
    //MARK: Direct to Main Root window
    public func directToPath(in sb: Storyboard, for identifier: String, from vc: UIViewController? = nil, window: UIWindow? = nil) {
        let storyboard = UIStoryboard(name: sb.rawValue, bundle: nil)
        let topController = storyboard.instantiateViewController(withIdentifier: identifier)
        
        appDelegate.setAsRoot(_controller: topController)
    }
    
    
    //MARK: Navigation push view Controller
    public func pushToViewController(in sb: Storyboard, for identifier: String, from vc: UIViewController?, data: Any? = nil) {
        
        let storyboard = UIStoryboard(name: sb.rawValue, bundle: nil)
        let destVc = storyboard.instantiateViewController(withIdentifier: identifier)
        
        if destVc is CountryDetailsViewController && data != nil {
            let _vc = storyboard.instantiateViewController(withIdentifier: identifier) as! CountryDetailsViewController
            if let _data = data as? Country {
                _vc.vm.country = _data
            }
            vc?.navigationController?.pushViewController(_vc, animated: true)
        }
        else {
            vc?.navigationController?.pushViewController(destVc, animated: true)
        }
    }
    
    
    //MARK: Present view Controller
    public func presentViewController(in sb: Storyboard, for identifier: String, from vc: UIViewController?, style: UIModalPresentationStyle = .overCurrentContext, data: Any? = nil) {
        
        let storyboard = UIStoryboard(name: sb.rawValue, bundle: nil)
        let destVc = storyboard.instantiateViewController(withIdentifier: identifier)
        
        destVc.modalPresentationStyle = style
        
        
    }
    
    
    //MARK: Get ViewController (VC, TVC, CVC, PC, TBC etc.)
    public func viewController(in sb: Storyboard, identifier: String) -> UIViewController {
        let storyboard = UIStoryboard(name: sb.rawValue, bundle: nil)
        let targetVC = storyboard.instantiateViewController(withIdentifier: identifier)
        return targetVC
    }
    
}
