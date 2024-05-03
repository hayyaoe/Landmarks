//
//  MapView.swift
//  Landmarks
//
//  Created by RabiRabi Channel on 19/04/24.
//

import SwiftUI
import MapKit

struct MapView: View {
    var coordinate: CLLocationCoordinate2D
    
    // add @AppStorage propetry called zoom that takes on the medium zoom level by deafult. Use a storage key that uniquely identifies the parameter like when storing items in UserDefaults, because that’s the underlying mechanism that SwiftUI relies on.
    @AppStorage("MapView.zoom")
    private var zoom: Zoom = .medium
    
    // add a Zoom enumeration to characterize the zoom level.
    enum Zoom: String, CaseIterable, Identifiable {
        case near = "Near"
        case medium = "Medium"
        case far = "Far"

        var id: Zoom {
            return self
        }
    }
    
    // change lngitude and latitude delta used to construct the region propetry to a value that depends on zoom.
    var delta: CLLocationDegrees {
        switch zoom {
        case .near: return 0.02
        case .medium: return 0.2
        case .far: return 2
        }
    }
    
    var body: some View {
        Map(position: .constant(.region(region)))
    }
    
    private var region: MKCoordinateRegion {
        MKCoordinateRegion(
            center: coordinate,
            span: MKCoordinateSpan(latitudeDelta: delta, longitudeDelta: delta)
        )
    }
}

#Preview {
    MapView(coordinate: CLLocationCoordinate2D(latitude: 34.011_286, longitude: -116.166_868))
}
