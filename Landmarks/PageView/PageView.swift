//
//  PageView.swift
//  Landmarks
//
//  Created by RabiRabi Channel on 28/04/24.
//

import SwiftUI

struct PageView<Page: View>: View {
    var pages: [Page]
    // add a state attribute
    @State private var currentPage = 1
    
    var body: some View {
        ZStack {
            // declare pageViewController.
            PageViewController(pages: pages, currentPage: $currentPage)
            PageControl(numberOfPages: pages.count, currentPage: $currentPage)
                .frame(width: CGFloat(pages.count * 18))
                .padding(.trailing)
        }
        // aspect ration modifier.
        .aspectRatio(3 / 2, contentMode: .fit)
    }
}

#Preview {
    // add the parameter for the pageview.
    PageView(pages: ModelData().features.map { FeatureCard(landmark: $0) })
}
