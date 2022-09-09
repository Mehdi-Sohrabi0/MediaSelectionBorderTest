//
//  PanPlugin.swift
//  MediaSelectionBorderTest
//
//  Created by Mehdi Sohrabi on 9/9/22.
//

import UIKit

final class PanPlugin {
    var gesture: UIPanGestureRecognizer!
    func attach(_ view: UIView ) {
        view.isUserInteractionEnabled = true
        let gesture = UIPanGestureRecognizer(target: self, action: #selector(handlePanGesture))
        gesture.cancelsTouchesInView = false
        view.addGestureRecognizer(gesture)
    }
    
    @objc func handlePanGesture(_ gesture: UIPanGestureRecognizer) {
        guard let view = gesture.view, let superview = view.superview else {
            return
        }

        let translation = gesture.translation(in: superview)
        let newCenter =  CGPoint(x: view.center.x + translation.x,
                                 y: view.center.y + translation.y)
            view.center = newCenter
        
        
        gesture.setTranslation(.zero, in: superview)
    }
}
