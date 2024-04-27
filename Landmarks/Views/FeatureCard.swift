//
//  FeatureCard.swift
//  Landmarks
//
//  Created by RabiRabi Channel on 27/04/24.
//

import SwiftUI

struct FeatureCard: View {
    // add landmark attribute
    var landmark:Landmark
    
    var body: some View {
        // add the property feature image
        landmark.featureImage?
            .resizable()
            // add overlay.
            .overlay {
                TextOverlay(landmark: landmark)
            }
    }
}

// create a text overlay view to for the image.
struct TextOverlay: View {
    var landmark: Landmark


    var gradient: LinearGradient {
        .linearGradient(
            Gradient(colors: [.black.opacity(0.6), .black.opacity(0)]),
            startPoint: .bottom,
            endPoint: .center)
    }


    var body: some View {
        ZStack(alignment: .bottomLeading) {
            gradient
            VStack(alignment: .leading) {
                Text(landmark.name)
                    .font(.title)
                    .bold()
                Text(landmark.park)
            }
            .padding()
        }
        .foregroundStyle(.white)
    }
}

#Preview {
    // put parameter to the FeatureCard view.
    FeatureCard(landmark: ModelData().features[0])
        .aspectRatio(3 / 2, contentMode: .fit)
}
