//
//  PageViewController.swift
//  Landmarks
//
//  Created by RabiRabi Channel on 27/04/24.
//

import Foundation
import UIKit
import SwiftUI

// add a page view controller as a UIViewCOntrollerRepresentable Datatype.
struct PageViewController<Page: View>: UIViewControllerRepresentable {
    var pages: [Page]
    // add a binding attribute.
    @Binding var currentPage: Int
    
    // add makeCoordinator function.
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }

    // create makeUIViewCotroller function that creates an instance of UIPageViewCOntroller
    func makeUIViewController(context: Context) -> UIPageViewController {
        let pageViewController = UIPageViewController(
            transitionStyle: .scroll,
            navigationOrientation: .horizontal)
        pageViewController.dataSource = context.coordinator
        pageViewController.delegate = context.coordinator

        return pageViewController
    }
    
    // create updateUIViewController function that is used to update the view controller on the lifecycle.
    func updateUIViewController(_ pageViewController: UIPageViewController, context: Context) {
        pageViewController.setViewControllers(
            [context.coordinator.controllers[currentPage]], direction: .forward, animated: true)
    }
    
    // add nested Coordinator Class. SwiftUI manages the UIViewControllerRepresentable type’s coordinator, and provides it as part of the context when calling the methods thats created above.
    class Coordinator: NSObject, UIPageViewControllerDataSource, UIPageViewControllerDelegate{
        var parent: PageViewController
        // add controller attribute.
        var controllers = [UIViewController]()
        
        init(_ pageViewController: PageViewController) {
            parent = pageViewController
            // initialize controller attribute.
            controllers = parent.pages.map {UIHostingController(rootView: $0)}
        }
        
        func pageViewController(
            _ pageViewController: UIPageViewController,
            viewControllerBefore viewController: UIViewController) -> UIViewController?
        {
            guard let index = controllers.firstIndex(of: viewController) else {
                return nil
            }
            if index == 0 {
                return controllers.last
            }
            return controllers[index - 1]
        }


        func pageViewController(
            _ pageViewController: UIPageViewController,
            viewControllerAfter viewController: UIViewController) -> UIViewController?
        {
            guard let index = controllers.firstIndex(of: viewController) else {
                return nil
            }
            if index + 1 == controllers.count {
                return controllers.first
            }
            return controllers[index + 1]
        }
        
        func pageViewController(
            _ pageViewController: UIPageViewController,
            didFinishAnimating finished: Bool,
            previousViewControllers: [UIViewController],
            transitionCompleted completed: Bool) {
            if completed,
               let visibleViewController = pageViewController.viewControllers?.first,
               let index = controllers.firstIndex(of: visibleViewController) {
                parent.currentPage = index
            }
        }

    }

}
