//
//  ProfileSummary.swift
//  Landmarks
//
//  Created by RabiRabi Channel on 27/04/24.
//

import SwiftUI

// create ProfileSummary View. The profile summary takes a Profile value rather than a binding to the profile because the parent view, ProfileHost, manages the state for this view.
struct ProfileSummary: View {
    // add environment modelData
    @Environment(ModelData.self) var modelData
    var profile: Profile


    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 10) {
                Text(profile.username)
                    .bold()
                    .font(.title)


                Text("Notifications: \(profile.prefersNotifications ? "On": "Off" )")
                Text("Seasonal Photos: \(profile.seasonalPhoto.rawValue)")
                Text("Goal Date: ") + Text(profile.goalDate, style: .date)
                
                // add some badges to the profile summary
                Divider()


                VStack(alignment: .leading) {
                    Text("Completed Badges")
                        .font(.headline)


                    ScrollView(.horizontal) {
                        HStack {
                            HikeBadge(name: "First Hike")
                            HikeBadge(name: "Earth Day")
                                .hueRotation(Angle(degrees: 90))
                            HikeBadge(name: "Tenth Hike")
                                .grayscale(0.5)
                                .hueRotation(Angle(degrees: 45))
                        }
                        .padding(.bottom)
                    }
                }
                
                // add hike data.
                Divider()


                VStack(alignment: .leading) {
                    Text("Recent Hikes")
                        .font(.headline)


                    HikeView(hike: modelData.hikes[0])
                }
            }
        }
    }
}


#Preview {
    ProfileSummary(profile: Profile.default)
        .environment(ModelData())
}
