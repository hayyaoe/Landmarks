//
//  NotificationController.swift
//  WatchLandmarks Watch App
//
//  Created by RabiRabi Channel on 02/05/24.
//

import Foundation
import SwiftUI
import UserNotifications

// cearte notification controller that extends WKUserNotificationHostingController
class NotificationController: WKUserNotificationHostingController<NotificationView> {
    var landmark: Landmark?
    var title: String?
    var message: String?
    
    // define landmarkIndexKey
    let landmarkIndexKey = "landmarkIndex"
    
    override var body: NotificationView {
        // update body method. this method instantiates the notification view that we created.
        NotificationView(
            title: title,
            message: message,
            landmark: landmark
        )
    }
    
    // add didRevieve method to parte data from the notification. This method updates the controller’s properties. After calling this method, the system invalidates the controller’s body property, which updates your notification view. The system then displays the notification on Apple Watch.
    override func didReceive(_ notification: UNNotification) {
        let modelData = ModelData()


        let notificationData =
            notification.request.content.userInfo as? [String: Any]


        let aps = notificationData?["aps"] as? [String: Any]
        let alert = aps?["alert"] as? [String: Any]


        title = alert?["title"] as? String
        message = alert?["body"] as? String


        if let index = notificationData?[landmarkIndexKey] as? Int {
            landmark = modelData.landmarks[index]
        }
    }
}
