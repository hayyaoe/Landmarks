//
//  ContentView.swift
//  Landmarks
//
//  Created by RabiRabi Channel on 18/04/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        LandmarkList()
    }
}

#Preview {
    ContentView()
        .environment(ModelData())
}
