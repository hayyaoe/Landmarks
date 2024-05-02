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
    var body: some Commands {
        // add built in command set called SidebarCommands for toggling sidebars.
        SidebarCommands()
    }
}
