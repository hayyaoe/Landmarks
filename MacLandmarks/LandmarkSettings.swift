//
//  LandmarkSettings.swift
//  MacLandmarks
//
//  Created by RabiRabi Channel on 03/05/24.
//

import SwiftUI

struct LandmarkSettings: View {
    // add @AppStorage property that uses the same key a s you used in the map view.
    @AppStorage("MapView.zoom")
    private var zoom: MapView.Zoom = .medium
    
    var body: some View {
        // add pickert that controls the zoom value through a binding. form is tipically used to arrrange controls in settings view.
        Form {
            Picker("Map Zoom:", selection: $zoom) {
                ForEach(MapView.Zoom.allCases) { level in
                    Text(level.rawValue)
                }
            }
            .pickerStyle(.inline)
        }
        .frame(width: 300)
        .navigationTitle("Landmark Settings")
        .padding(80)
    }
}

#Preview {
    LandmarkSettings()
}
