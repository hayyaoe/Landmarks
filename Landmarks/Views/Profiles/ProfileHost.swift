//
//  ProfileHost.swift
//  Landmarks
//
//  Created by RabiRabi Channel on 27/04/24.
//

import SwiftUI

// create profileHost, the view will host both a static, summary view of profile information and an edit mode.
struct ProfileHost: View {
    // add environment Edit Mode.
    @Environment(\.editMode) var editMode
    // add Environment Model Data
    @Environment(ModelData.self) var modelData
    // add a private property draftProfile.
    @State private var draftProfile = Profile.default
    
    var body: some View {
        // display ProfileSummary
        VStack(alignment: .leading, spacing: 20) {
            // add edit button.
            HStack {
                // cancle button to ignore updates
                if editMode?.wrappedValue == .active {
                    Button("Cancel", role: .cancel) {
                        draftProfile = modelData.profile
                        editMode?.animation().wrappedValue = .inactive
                    }
                }
                
                Spacer()
                EditButton()
            }
            
            // add conditional view that displays either the static profile or the view for Edit mode.
            if editMode?.wrappedValue == .inactive {
                // add profile data parameter.
                ProfileSummary(profile: modelData.profile)
            } else {
                // add profile editor view.
                ProfileEditor(profile: $draftProfile)
                    // add apper and dissapear modifier
                    .onAppear {
                        draftProfile = modelData.profile
                    }
                    .onDisappear {
                        modelData.profile = draftProfile
                    }
            }
        }
        .padding()
    }
}

#Preview {
    ProfileHost()
        // add environment property.
        .environment(ModelData())
}
