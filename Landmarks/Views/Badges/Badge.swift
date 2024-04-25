//
//  Badge.swift
//  Landmarks
//
//  Created by RabiRabi Channel on 25/04/24.
//

import SwiftUI

struct Badge: View {
    
    // cerate badge symbols instance to put badge symbols in it
    var badgeSymbols: some View {
        
        // create 8 instance of rotated badge symbol and rotate 40deg next to the other one using for each.
        ForEach(0..<8) { index in
            RotatedBadgeSymbol(
                angle: .degrees(Double(index) / Double(8)) * 360.0
            )
        }
        .opacity(0.5)
    }
    
    var body: some View {
        // use ZStack to make the image stack / clip to each other.
        ZStack{
            // create badge backgorund instance
            BadgeBackground()
            
            // use GeometryReader to adjuct the badgesymbol size using scaleEffect method
            GeometryReader { geometry in
                badgeSymbols
                    .scaleEffect(1.0 / 4.0, anchor: .top)
                    .position(x: geometry.size.width / 2.0, y: (3.0 / 4.0) * geometry.size.height)
            }
        }
        // used to fit the scale
        .scaledToFit()
    }
}

#Preview {
    Badge()
}
