//
//  CategoryRow.swift
//  Landmarks
//
//  Created by RabiRabi Channel on 27/04/24.
//

import SwiftUI

struct CategoryRow: View {
    
    // add categoryName and items[Landmark] Property.
    var categoryName: String
    var items: [Landmark]
    
    var body: some View {
        
        // group the cateogry name in a VStack
        VStack(alignment: .leading){
            // display name of the category
            Text(categoryName)
                .font(.headline)
                .padding(.leading, 15)
                .padding(.top, 5)


            ScrollView(.horizontal, showsIndicators: false) {
                HStack(alignment: .top, spacing: 0) {
                    ForEach(items) { landmark in
                        // diplay every landmark data using CategoryItem Function.
                        CategoryItem(landmark: landmark)
                    }
                }
            }
            .frame(height: 185)
        }
    }
}

#Preview {
    // add the values for the properties.
    let landmarks = ModelData().landmarks
    return CategoryRow(
        categoryName: landmarks[0].category.rawValue,
        items: Array(landmarks.prefix(4))
    )
}
