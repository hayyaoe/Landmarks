//
//  LandmarkDetail.swift
//  WatchLandmarks Watch App
//
//  Created by RabiRabi Channel on 02/05/24.
//

import SwiftUI

struct LandmarkDetail: View {
    // add model data enviorenment
    @Environment(ModelData.self) var modelData
    // landmark property
    var landmark: Landmark
    // landmark index property
    var landmarkIndex: Int {
        modelData.landmarks.firstIndex(where: { $0.id == landmark.id })!
    }


    var body: some View {
        @Bindable var modelData = modelData
        
        // add scroll view so we can scroll the view
        ScrollView {
            // add more park details
            VStack {
                // return circleImage view
                CircleImage(image: landmark.image.resizable())
                    .scaledToFit()
                
                Text(landmark.name)
                    .font(.headline)
                    .lineLimit(0)
                
                Toggle(isOn: $modelData.landmarks[landmarkIndex].isFavorite) {
                    Text("Favorite")
                }
                
                Divider()
                
                Text(landmark.park)
                    .font(.caption)
                    .bold()
                    .lineLimit(0)
                
                Text(landmark.state)
                    .font(.caption)
                
                Divider()
                
                MapView(coordinate: landmark.locaitonCoordinate)
                    .scaledToFit()
            }
            .padding(16)
        }
        .navigationTitle("Landmarks")
    }
}

#Preview {
    let modelData = ModelData()
    return LandmarkDetail(landmark: modelData.landmarks[0])
        .environment(modelData)
}
