/*
See the LICENSE.txt file for this sample’s licensing information.

Abstract:
A view displaying information about a hike, including an elevation graph.
*/

import SwiftUI

// make AnyTransition extension function with and add the attribute .slide to the AnyTransition.
// try to use .move(edge: ) and add .trailing as the parameter.
// try to use .asymetrict
extension AnyTransition {
    static var moveAndFade: AnyTransition {
        .asymmetric(
            insertion: .move(edge: .trailing).combined(with: .opacity),
            removal: .scale.combined(with: .opacity)
        )
    }
}



struct HikeView: View {
    var hike: Hike
    @State private var showDetail = false

    var body: some View {
        VStack {
            HStack {
                HikeGraph(hike: hike, path: \.elevation)
                    .frame(width: 50, height: 30)

                VStack(alignment: .leading) {
                    Text(hike.name)
                        .font(.headline)
                    Text(hike.distanceText)
                }

                Spacer()

                Button {
                    // use with Animation Function to wrap the button toggle
                    // the .easeInOut(duration: ) attribute lets you modify the animation duraion and the animation mode.
                    withAnimation{
                        showDetail.toggle()
                    }
                } label: {
                    Label("Graph", systemImage: "chevron.right.circle")
                        .labelStyle(.iconOnly)
                        .imageScale(.large)
                        .rotationEffect(.degrees(showDetail ? 90 : 0))
                        // scale effect animation. The animation modifier applies to all animatable changes within the views it wraps.
                        .scaleEffect(showDetail ? 1.5 : 1)
                        .padding()
                        
                }
            }

            if showDetail {
                HikeDetail(hike: hike)
                // add .transition(_:) attribute and put .slide as the parameter.
                    .transition(.moveAndFade)
            }
        }
    }
}

#Preview {
    VStack {
        HikeView(hike: ModelData().hikes[0])
            .padding()
        Spacer()
    }
}
