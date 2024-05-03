//
//  CircleImage.swift
//  Landmarks
//
//  Created by RabiRabi Channel on 19/04/24.
//

import SwiftUI

struct CircleImage: View {
    var image: Image
    
    var body: some View {
        image
        // use clipShapet to change image shape to circle then add overlay to add border of the image.
            .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
            .overlay {
                Circle().stroke(.white, lineWidth: 4)
            }
        // add 7 poit radius shadow
            .shadow(radius: 7)
    }
}

#Preview {
    CircleImage(image: Image("turtlerock"))
}
