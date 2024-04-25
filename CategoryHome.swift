//
//  CategoryHome.swift
//  Landmarks
//
//  Created by RabiRabi Channel on 25/04/24.
//

import SwiftUI

struct CategoryHome: View {
    var body: some View {
        // add Navigation Split View
        NavigationSplitView {
            Text("Hello World")
                .navigationTitle("Featured")
        } detail: {
            Text("Select a Landmark")
        }
    }
}

#Preview {
    CategoryHome()
}
