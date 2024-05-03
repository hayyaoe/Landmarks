//
//  LandmarkCommands.swift
//  Landmarks
//
//  Created by RabiRabi Channel on 03/05/24.
//

import Foundation
import SwiftUI

// create landmark commands struct that extends Commands class.
struct LandmarkCommands: Commands {
    // Add a @FocusedBinding property wrapper to track the currently selected landmark.
    @FocusedBinding(\.selectedLandmark) var selectedLandmark
    
    var body: some Commands {
        // add built in command set called SidebarCommands for toggling sidebars.
        SidebarCommands()
        
        // add commandMenu
        CommandMenu("Landmark") {
            // add a button menu to the menu that toggles the selected landmarks's favorite status and that has an appearance that changes depending on the currently selected landmark and it state.
            Button("\(selectedLandmark?.isFavorite == true ? "Remove" : "Mark") as Favorite") {
                selectedLandmark?.isFavorite.toggle()
            }
            // add a keyboard shortcut for the menu item with the keyboardShortcut()modifier.
            .keyboardShortcut("f", modifiers: [.shift, .option])
            .disabled(selectedLandmark == nil)
        }
    }
}

private struct SelectedLandmarkKey: FocusedValueKey {
    typealias Value = Binding<Landmark>
}

// extend focusValues structure with selected landmark value using a custom key called selected landmarkKey. The pattern for defining focused values resembles the pattern for defining new Environment values: Use a private key to read and write a custom property on the system-defined FocusedValues structure.
extension FocusedValues {
    var selectedLandmark: Binding<Landmark>? {
        get { self[SelectedLandmarkKey.self] }
        set { self[SelectedLandmarkKey.self] = newValue }
    }
}
