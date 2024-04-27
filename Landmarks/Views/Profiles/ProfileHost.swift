//
//  ProfileHost.swift
//  Landmarks
//
//  Created by RabiRabi Channel on 27/04/24.
//

import SwiftUI

// create profileHost, the view will host both a static, summary view of profile information and an edit mode.
struct ProfileHost: View {
    // add a private property draftProfile.
    @State private var draftProfile = Profile.default
    
    var body: some View {
        // display ProfileSummary
        VStack(alignment: .leading, spacing: 20) {
            ProfileSummary(profile: draftProfile)
        }
        .padding()
    }
}

#Preview {
    ProfileHost()
}
