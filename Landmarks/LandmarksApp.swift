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
        // apply LandmarkCommands using commands scene modifier. and put a condition to prevent it to be used on WatchOS
        #if !os(watchOS)
        .commands {
            LandmarkCommands()
        }
        #endif
        
        // add WKNotifiationScene using LandmarkNear Category. The scene only makes sense for watchOS, so add the conditional compilation.
        #if os(watchOS)
        WKNotificationScene(controller: NotificationController.self, category: "LandmarkNear")
        #endif
    }
}
