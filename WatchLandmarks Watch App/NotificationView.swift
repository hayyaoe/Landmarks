//
//  NotificationView.swift
//  WatchLandmarks Watch App
//
//  Created by RabiRabi Channel on 02/05/24.
//

import SwiftUI

struct NotificationView: View {
    // initiate some data like title, message, and landmark.
    var title: String?
    var message: String?
    var landmark: Landmark?
    
    var body: some View {
        VStack {
            if let landmark {
                CircleImage(image: landmark.image.resizable())
                    .scaledToFit()
            }
            
            Text(title ?? "Unknown Landmark")
                .font(.headline)


            Divider()


            Text(message ?? "You are within 5 miles of one of your favorite landmarks.")
                .font(.caption)
        
        }
    }
}

#Preview {
    NotificationView()
}

#Preview {
    NotificationView(
        title: "Turtle Rock",
        message: "You are within 5 miles of Turtle Rock.",
        landmark: ModelData().landmarks[0])
}
