//
//  HikeBadge.swift
//  Landmarks
//
//  Created by RabiRabi Channel on 27/04/24.
//

import SwiftUI

// The badge is just a graphic, so the text in HikeBadge along with the accessibilityLabel(_:) modifier make the meaning of the badge clearer to other users.
struct HikeBadge: View {
    var name: String


    var body: some View {
        VStack(alignment: .center) {
            Badge()
                .frame(width: 300, height: 300)
                .scaleEffect(1.0 / 3.0)
                .frame(width: 100, height: 100)
            Text(name)
                .font(.caption)
                .accessibilityLabel("Badge for \(name).")
        }
    }
}


#Preview {
    HikeBadge(name: "Preview Testing")
}
