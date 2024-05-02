//
//  ContentView.swift
//  WatchLandmarks Watch App
//
//  Created by RabiRabi Channel on 02/05/24.
//

import SwiftUI
import UserNotifications

struct ContentView: View {
    var body: some View {
        // add landmark list
        LandmarkList()
        // add task to make request asynchornously that SwiftUI calls when the content view first appers.
            .task {
                let center = UNUserNotificationCenter.current()
                _ = try? await center.requestAuthorization(
                    options: [.alert, .sound, .badge]
                )
            }
    }
}

#Preview {
    ContentView().environment(ModelData())
}
