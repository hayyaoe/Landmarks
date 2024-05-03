//
//  LandmarkDetail.swift
//  Landmarks
//
//  Created by RabiRabi Channel on 19/04/24.
//

import SwiftUI

struct LandmarkDetail: View {
    // add environment varirble model data.
    @Environment(ModelData.self) var modelData
    var landmark: Landmark
    
    var landmarkIndex: Int{
        modelData.landmarks.firstIndex(where: { $0.id == landmark.id })!
    }
    
    var body: some View {
        // add model data using bindable wrapper.
        @Bindable var modelData = modelData
        ScrollView {
            MapView(coordinate: landmark.locaitonCoordinate)
                .frame(height: 300)
            
            CircleImage(image: landmark.image)
                .offset(y: -130)
                .padding(.bottom, -130)
            
            // Edit the VStack initializer to align the views by their leading edges. By default, stacks center their contents along their axis and provide context-appropriate spacing.
            VStack(alignment: .leading) {
                HStack{
                    Text(landmark.name)
                        .font(.title)
                    FavoriteButton(isSet: $modelData.landmarks[landmarkIndex].isFavorite)
                }
                
                HStack {
                    Text(landmark.park)
                        .font(.subheadline)
                    
                    // like its name spacer is used to separate components. A spacer expands to make its containing view use all of the space of its parent view, instead of having its size defined only by its contents.
                    Spacer()
                    
                    Text(landmark.state)
                        .font(.subheadline)
                }
                .font(.subheadline)
                .foregroundStyle(.secondary)
                
                Divider()
                
                Text("About \(landmark.name)")
                    .font(.title2)
                
                Text(landmark.description)
            }
            // Finally, use the padding() modifier to give the landmark’s name and details a little more space around their outer edges.
            .padding()
        }
        .navigationTitle(landmark.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    let modelData = ModelData()
    return LandmarkDetail(landmark: ModelData().landmarks[0])
        .environment(modelData)
}
