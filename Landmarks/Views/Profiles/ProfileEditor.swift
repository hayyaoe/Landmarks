//
//  ProfileEditor.swift
//  Landmarks
//
//  Created by RabiRabi Channel on 27/04/24.
//

import SwiftUI

// ProfileEditor and include a binding to the draft copy of the user’s profile.
struct ProfileEditor: View {
    @Binding var profile: Profile
    
    // add date range parameter
    var dateRange: ClosedRange<Date> {
        let min = Calendar.current.date(byAdding: .year, value: -1, to: profile.goalDate)!
        let max = Calendar.current.date(byAdding: .year, value: 1, to: profile.goalDate)!
        return min...max
    }
    
    var body: some View {
        List {
            HStack {
                Text("Username")
                Spacer()
                // TextField controls and updates a string binding
                TextField("Username", text: $profile.username)
                    .foregroundStyle(.secondary)
                    .multilineTextAlignment(.trailing)
            }
            
            // add toggle for notifications.
            Toggle(isOn: $profile.prefersNotifications) {
                Text("Enable Notifications")
            }
            
            // add picker control and lable to make the landmark photos have a selectable preferred season.
            Picker("Seasonal Photo", selection: $profile.seasonalPhoto) {
                ForEach(Profile.Season.allCases) { season in
                    Text(season.rawValue).tag(season)
                }
            }
            
            // add date picker for landmark visitation goal
            DatePicker(selection: $profile.goalDate, in: dateRange, displayedComponents: .date) {
                Text("Goal Date")
            }
        }
    }
}


#Preview {
    ProfileEditor(profile: .constant(.default))
}
