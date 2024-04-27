//
//  CategoryItem.swift
//  Landmarks
//
//  Created by RabiRabi Channel on 27/04/24.
//

import SwiftUI

struct CategoryItem: View {
    
    // add a landmark protperty
    var landmark: Landmark
    
    var body: some View {
        
        // diplay the landmark
        VStack(alignment: .leading) {
            landmark.image
                // add renderingMode(_:) method. Text that is pass as the label for a navigation link renders using the environment’s accent color, and images may render as template images.
                .renderingMode(.original)
                .resizable()
                .frame(width: 155, height: 155)
                .cornerRadius(5)
            Text(landmark.name)
                // add foregroundStye(.primary)
                .foregroundStyle(.primary)
                .font(.caption)
        }
        .padding(.leading, 15)
    }
}

#Preview {
    CategoryItem(landmark: ModelData().landmarks[0])
}
