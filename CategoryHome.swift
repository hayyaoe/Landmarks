//
//  CategoryHome.swift
//  Landmarks
//
//  Created by RabiRabi Channel on 25/04/24.
//

import SwiftUI

struct CategoryHome: View {
    // add ModelData property
    @Environment(ModelData.self) var modelData
    
    var body: some View {
        // add Navigation Split View
        NavigationSplitView {
            // display the categories using list.Category case name identifies each item in the list, which must be unique among other categories because it’s an enumeration.
            List {
                
                // add image for the first feartued landmark and add as a carousel
                modelData.features[0].image
                        .resizable()
                        .scaledToFill()
                        .frame(height: 200)
                        .clipped()
                        .listRowInsets(EdgeInsets())
                
                ForEach(modelData.categories.keys.sorted(), id: \.self) { key in
                    // display the categories using CategoryRow
                    CategoryRow(categoryName: key, items: modelData.categories[key]!)
                }
                .listRowInsets(EdgeInsets())
            }
            .navigationTitle("Featured")
        } detail: {
            Text("Select a Landmark")
        }
    }
}

#Preview {
    CategoryHome()
        // access the model data.
        .environment(ModelData())
}
