//
//  ContentView.swift
//  Landmarks
//
//  Created by RabiRabi Channel on 18/04/24.
//

import SwiftUI

struct ContentView: View {
    // Add a state variable for the tab selection, and give it a default value.
    @State private var selection: Tab = .featured
    
    // add a enum for the Tabs with the case featured and list.
    enum Tab {
        case featured
        case list
    }
    
    var body: some View {
        // Create a tab view that wraps the LandmarkList, as well as the new CategoryHome. The tag(_:) modifier on each of the views matches one of the possible values that the selection property can take so the TabView can coordinate which view to display when the user makes a selection in the user interface.
        TabView(selection: $selection){
            CategoryHome()
                // add label for the tab
                .tabItem {
                    Label("Featured", systemImage: "star")
                }
                .tag(Tab.featured)
            
            LandmarkList()
                // add label for the tab
                .tabItem {
                    Label("List", systemImage: "list.bullet")
                }
                .tag(Tab.list)
        }
        
    }
}

#Preview {
    ContentView()
        .environment(ModelData())
}
