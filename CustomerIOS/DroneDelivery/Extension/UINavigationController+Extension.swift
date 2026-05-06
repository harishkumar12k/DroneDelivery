//
//  UINavigationController+Extension.swift
//  DroneDelivery
//
//  Created by Harish Kumar on 14/04/26.
//

import UIKit

extension UINavigationController: @retroactive UIGestureRecognizerDelegate {
    
    override open func viewDidLoad() {
        super.viewDidLoad()
        // Set the delegate to itself to handle the gesture logic
        interactivePopGestureRecognizer?.delegate = self
    }

    // Prevents the gesture from triggering if already on the first screen
    public func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        return viewControllers.count > 1
    }
    
}
