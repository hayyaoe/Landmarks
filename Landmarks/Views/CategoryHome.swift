//
//  CategoryHome.swift
//  Landmarks
//
//  Created by RabiRabi Channel on 27/04/24.
//

import SwiftUI

struct CategoryHome: View {
    var body: some View {
        // add NavigationSplitView
        NavigationSplitView {
            Text("Hellow World")
        }detail: {
            Text("Select a Landmark")
        }
    }
}

#Preview {
    CategoryHome()
}
