//
//  Landmark.swift
//  Landmarks
//
//  Created by RabiRabi Channel on 19/04/24.
//

import Foundation
import SwiftUI
import CoreLocation

struct Landmark: Hashable, Codable, Identifiable {
    var id: Int
    var name: String
    var park: String
    var state: String
    var description: String
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
    
    private var imageName: String
    var image: Image{
        Image(imageName)
    }
    
    private var coordinates: Coordinates
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
