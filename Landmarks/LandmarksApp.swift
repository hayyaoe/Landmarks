//
//  LandmarksApp.swift
//  Landmarks
//
//  Created by RabiRabi Channel on 18/04/24.
//

import SwiftUI

// An app that uses the SwiftUI app life cycle has a structure that conforms to the App protocol. The structure’s body property returns one or more scenes, which in turn provide content for display. The @main attribute identifies the app’s entry point.
@main
struct LandmarksApp: App {
    
    // create a model instence. Use the @State attribute to initialize a model object the same way you use it to initialize properties inside a view. Just like SwiftUI initializes state in a view only once during the lifetime of the view, it initializes state in an app only once during the lifetime of the app.
    @State private var modelData = ModelData()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
            // supply model instance to the content view using the environtment modifier.
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
        
        // add settings scene to macOS app only.
        #if os(macOS)
        Settings {
            LandmarkSettings()
        }
        #endif
    }
}
