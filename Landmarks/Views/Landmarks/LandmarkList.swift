//
//  LandmarkList.swift
//  Landmarks
//
//  Created by RabiRabi Channel on 19/04/24.
//

import SwiftUI

struct LandmarkList: View {
    @Environment(ModelData.self) var modelData
    @State private var showFavoritesOnly = false
    // add filter variable defaulting all case.
    @State private var filter = FilterCategory.all
    
    // add filterCategory enum to discribe filter states.
    enum FilterCategory: String, CaseIterable, Identifiable {
        case all = "All"
        case lakes = "Lakes"
        case rivers = "Rivers"
        case mountains = "Mountains"


        var id: FilterCategory { self }
    }
    
    var filteredLandmarks: [Landmark]{
        // update filtered lanmarks
        modelData.landmarks.filter{ landmark in
            (!showFavoritesOnly || landmark.isFavorite)                 && (filter == .all || filter.rawValue == landmark.category.rawValue)
        }
    }
    
    // update navigation title to match filter.
    var title: String {
        let title = filter == .all ? "Landmarks" : filter.rawValue
        return showFavoritesOnly ? "Favorite \(title)" : title
    }
    
    var body: some View {
        NavigationSplitView{
            List{
                ForEach(filteredLandmarks) { landmark in
                    NavigationLink {
                        LandmarkDetail(landmark: landmark)
                    } label: {
                        LandmarkRow(landmark: landmark)
                    }
                }
            }
            .animation(.default, value: filteredLandmarks)
            .navigationTitle("Landmarks")
            // add minimum width to improve the preview and to ensure its never become too small on macOS Window
            .frame(minWidth: 300)
            // add toolbar to move the favorites toggle into the menu. This moves the toggle into the toolbar in a platform-specific way, which has the additional benefit of making it accessible no matter how long the list of landmarks gets, or how far down the user scrolls
            .toolbar {
                ToolbarItem {
                    Menu {
                        // add a category picker to set filter category
                        Picker("Category", selection: $filter) {
                            ForEach(FilterCategory.allCases) { category in
                                Text(category.rawValue).tag(category)
                            }
                        }
                        .pickerStyle(.inline)
                        
                        Toggle(isOn: $showFavoritesOnly) {
                            Label("Favorites only", systemImage: "star.fill")
                        }
                    } label: {
                        Label("Filter", systemImage: "slider.horizontal.3")
                    }
                }
            }
        } detail: {
            Text("Select a Landmark")
        }

    }
}

#Preview {
    LandmarkList()
        .environment(ModelData())
}
