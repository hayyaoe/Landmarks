//
//  RotatedBadgeSymbol.swift
//  Landmarks
//
//  Created by RabiRabi Channel on 25/04/24.
//

import SwiftUI

struct RotatedBadgeSymbol: View {
    
    // define the angle parameter
    let angle: Angle
    
    var body: some View {
        BadgeSymbol()
            .padding(-60)
            // use rotationEffect function to rotate the image
            .rotationEffect(angle, anchor: .bottom)
    }
}

#Preview {
    RotatedBadgeSymbol(angle: Angle(degrees: 5))
}
