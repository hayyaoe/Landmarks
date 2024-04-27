//
//  PageControl.swift
//  Landmarks
//
//  Created by RabiRabi Channel on 28/04/24.
//

import SwiftUI
import UIKit

struct PageControl: UIViewRepresentable {
    var numberOfPages: Int
    @Binding var currentPage: Int
    
    // add make coordinator function
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    

    func makeUIView(context: Context) -> UIPageControl {
        let control = UIPageControl()
        control.numberOfPages = numberOfPages
        control.addTarget(
            context.coordinator,
            action: #selector(Coordinator.updateCurrentPage(sender:)),
            for: .valueChanged)


        return control
    }

    func updateUIView(_ uiView: UIPageControl, context: Context) {
        uiView.currentPage = currentPage
    }
    
    // craeate Coordinator classs.
    class Coordinator: NSObject {
        var control: PageControl


        init(_ control: PageControl) {
            self.control = control
        }

        

        @objc
        func updateCurrentPage(sender: UIPageControl) {
            control.currentPage = sender.currentPage
        }
    }
}
