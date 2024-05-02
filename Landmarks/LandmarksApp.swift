//
//  LandmarksApp.swift
//  Landmarks
//
//  Created by RabiRabi Channel on 18/04/24.
//

import SwiftUI

@main
struct LandmarksApp: App {
    @State private var modelData = ModelData()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(modelData)
        }
        
        // add WKNotifiationScene using LandmarkNear Category. The scene only makes sense for watchOS, so add the conditional compilation.
        #if os(watchOS)
        WKNotificationScene(controller: NotificationController.self, category: "LandmarkNear")
        #endif
    }
}
