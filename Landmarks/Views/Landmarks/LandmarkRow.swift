//
//  LandmarkRow.swift
//  Landmarks
//
//  Created by RabiRabi Channel on 19/04/24.
//

import SwiftUI

struct LandmarkRow: View {
    var landmark: Landmark
    
    var body: some View {
        HStack {
            landmark.image
                .resizable()
                .frame(width: 50,height: 50)
                // add corner radius for refined look
                .cornerRadius(5)
            // wrap landmarkname with VStack then add secondary information.
            VStack(alignment: .leading){
                Text(landmark.name)
                    .bold()
                // wrap the landmark park information with condition so it dont show up on appleWatch view.
                #if !os(watchOS)
                Text(landmark.park)
                    .font(.caption)
                    .foregroundStyle(.secondary)
                #endif
            }
            
            Spacer()
            
            if landmark.isFavorite {
                Image(systemName: "star.fill")
                    .foregroundStyle(.yellow)
            }
        }
        // add a little vertical padding for better looks
        .padding(.vertical,4)
    }
}

#Preview {
    let landmarks = ModelData().landmarks
    return Group{
        LandmarkRow(landmark: landmarks[0])
        LandmarkRow(landmark: landmarks[1])
    }

}
