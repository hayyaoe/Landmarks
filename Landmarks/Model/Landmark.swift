//
//  Landmark.swift
//  Landmarks
//
//  Created by RabiRabi Channel on 19/04/24.
//

import Foundation
import SwiftUI
import CoreLocation

// define landmark structure with a few properties maching name of tome of the key in the landmarkData file. Adding Codable conformance makes it easier to move data between the structure and a data file. You’ll rely on the Decodable component of the Codable protocol later in this section to read data from file.
struct Landmark: Hashable, Codable, Identifiable {
    var id: Int
    var name: String
    var park: String
    var state: String
    var description: String
    
    // add isFavorite property to the landmark struct. The landmarkData file has a key with this name for each landmark. Because Landmark conforms to Codable, you can read the value associated with the key by creating a new property with the same name as the key.
    var isFavorite: Bool
    
    // add isFeatured property, Like for other landmark properties you’ve added, this Boolean already exists in the data — you just need to declare a new property.
    var isFeatured: Bool
    
    // add category enumeration, The landmarkData file already includes a category value for each landmark with one of three string values. By matching the names in the data file, you can rely on the structure’s Codable conformance to load the data.
    var category: Category
    enum Category: String, CaseIterable, Codable {
        case lakes = "Lakes"
        case rivers = "Rivers"
        case mountains = "Mountains"
    }
    
    // add imageName Property to reat the name of the image from the data and a computer image property tha loads an image from the asset ctalog. make the property private because user oft the landmark structure care only about the image itself.
    private var imageName: String
    var image: Image{
        Image(imageName)
    }
    
    // add computed property to return the feature image if exist.
    var featureImage: Image? {
        isFeatured ? Image(imageName + "_feature") : nil
    }

    // add coordinates property to the structure using a nested coordinates type that reflects the storage in the JSON data structure.
    private var coordinates: Coordinates
    // compute a location coordinate property that's useful for interacting with the MapKit framework.
    var locaitonCoordinate: CLLocationCoordinate2D{
        CLLocationCoordinate2D(
            latitude: coordinates.latitude,
            longitude: coordinates.longitude)
    }
    
    struct Coordinates: Hashable, Codable {
        var latitude: Double
        var longitude: Double
    }
}
