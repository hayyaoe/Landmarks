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
                ForEach(modelData.categories.keys.sorted(), id: \.self) { key in
                    Text(key)
                }
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
