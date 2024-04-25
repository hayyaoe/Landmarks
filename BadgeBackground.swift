//
//  BadgeBackground.swift
//  Landmarks
//
//  Created by RabiRabi Channel on 25/04/24.
//

import SwiftUI

struct BadgeBackground: View {
    var body: some View {
        
        // use GeometryReader so the image size can use the size of its containing view, which defines the size
        GeometryReader { geometry in
        
        // Path shape is used to compine lines, curves and other drawing to form more complex shapes.
            Path { path in
                
                // container size 100 x 100px and add starting point to the path.
                var width: CGFloat = min(geometry.size.width, geometry.size.height)
                let height = width
                
                // use xScale and add xOffset to recenter shape within its gemoetry, add xOffset to every x axis.
                let xScale: CGFloat = 0.832
                let xOffset = (width * (1.0 - xScale)) / 2.0
                width *= xScale
                
                // move(to:) function moves the drawing cursor within the bounds of a shape as through an imaginary pen or pencil is hovering over the area waiting to start drawing.
                path.move(
                    to: CGPoint(
                        x: width * 0.95 + xOffset,
                        y: height * (0.20 + HexagonParameters.adjustment)
                    )
                )
                
                // this is used to draw the lines for each point of the shape.
                HexagonParameters.segments.forEach { segment in
                    
                    // addLine(to:) function takes a single point and draws it. Successive calls to addLine(to:) begin a line at the prevous point and continue to the new point.
                    path.addLine(
                        to: CGPoint(
                            x: width * segment.line.x + xOffset,
                            y: height * segment.line.y
                        )
                    )
                    
                    // addQuadCurve(to:control:) function is used to draw Bezier curves.
                    path.addQuadCurve(
                        to: CGPoint(
                            x: width * segment.curve.x + xOffset,
                            y: height * segment.curve.y
                        ),
                        control: CGPoint(
                            x: width * segment.curve.x + xOffset,
                            y: height * segment.curve.y
                        )
                    )
                }
            }
            // linearGadient function is used to change the color with a gradient color.
            .fill(.linearGradient(
                Gradient(colors: [Self.gradientStart, Self.gradientEnd]),
                startPoint: UnitPoint(x: 0.5, y: 0),
                endPoint: UnitPoint(x: 0.5, y: 0.6)
            ))
        }
        // aspectRation(_:contentMode:) is used to modify the aspect ration.
        .aspectRatio(1,contentMode: .fit)
    }
    
    // gradient colors
    static let gradientStart = Color(red: 239.0 / 255, green: 120.0 / 255, blue: 221.0 / 255)
    static let gradientEnd = Color(red: 239.0 / 255, green: 172.0 / 255, blue: 120.0 / 255)
    
}

#Preview {
    BadgeBackground()
}
