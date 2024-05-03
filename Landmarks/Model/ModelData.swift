//
//  ModelData.swift
//  Landmarks
//
//  Created by RabiRabi Channel on 19/04/24.
//

import Foundation

@Observable
class ModelData {
    // Load LandmarkData.Json
    var landmarks: [Landmark] = load("landmarkData.json")
    // load HikeData.Json
    var hikes: [Hike] = load("hikeData.json")
    // add instance of user profile
    var profile = Profile.default
    
    // computed categoires dictionary with category name as keys and an array of associated landmarks for each key.
    var categories: [String: [Landmark]] {
        Dictionary(
            grouping: landmarks,
            by: { $0.category.rawValue }
        )
    }
    
    // add compute feature array which contains only the landmarks that have is Featured set to true
    var features: [Landmark] {
        landmarks.filter{ $0.isFeatured}
    }
}

// create an array of landmarks to that initialized with landmarkData.json.
var landmarks: [Landmark] = load("landmarkData.json")

// create a load() method that fethces JSON data with a given name from the app's main bundle. The load method relies on the return type’s conformance to the Decodable protocol, which is one component of the Codable protocol.
func load<T: Decodable>(_ filename: String)-> T {
    let data: Data
    
    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
    else{
        fatalError("Couldn't find \(filename) in main bundle.")
    }
    
    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Couldn't load \(filename) rom main bundle:\n\(error)")
    }
    
    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
    }
}
