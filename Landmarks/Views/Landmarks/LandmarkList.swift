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
    // add state variable for selected landmark
    @State private var selectedLandmark: Landmark?
    
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
    
    // add computer property that indicates the index of the selected landmark.
    var index: Int? {
        modelData.landmarks.firstIndex(where: { $0.id == selectedLandmark?.id })
    }
    
    var body: some View {
        @Bindable var modelData = modelData
        
        NavigationSplitView{
            // initialize the list with a dingind to the selected value
            List(selection: $selectedLandmark){
                ForEach(filteredLandmarks) { landmark in
                    NavigationLink {
                        LandmarkDetail(landmark: landmark)
                    } label: {
                        LandmarkRow(landmark: landmark)
                    }
                    // add tag for navigation link. The tag associates a particular landmark with the given item in the ForEach, which then drives the selection.
                    .tag(landmark)
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
        // add focusedValue modifier to the NavigationSplitView to provide a binding the value from the landmarks array.
        .focusedValue(\.selectedLandmark, $modelData.landmarks[index ?? 0])
    }
}

#Preview {
    LandmarkList()
        .environment(ModelData())
}
