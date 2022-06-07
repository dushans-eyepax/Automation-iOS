//
//  InternalNotification.swift
//  TSandTA
//
//  Created by Dushan Saputhanthri on 1/3/21.
//  Copyright © 2021 RYRA Circuit. All rights reserved.
//

import Foundation


protocol InternalNotificationSenderDelegate {
    func postInternalNotification(name: Notification.Name, object: Any?, userInfo: [AnyHashable : Any]?)
}

extension InternalNotificationSenderDelegate {
    
    func postInternalNotification(name: Notification.Name, object: Any?, userInfo: [AnyHashable : Any]? = nil) {
        NotificationCenter.default.post(name: name, object: object, userInfo: userInfo)
    }
}
