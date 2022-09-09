//
//  ScalePlugin.swift
//  MediaSelectionBorderTest
//
//  Created by Mehdi Sohrabi on 9/9/22.
//

import UIKit

final class ScalePlugin {
    func attach(_ view: UIView ) {
        view.isUserInteractionEnabled = true
        view.isMultipleTouchEnabled = true
        view
            .addGestureRecognizer(UIPinchGestureRecognizer(target: self,
                                                           action: #selector(
                                                               scaleView(_:)
                                                           )))
    }
    
    
    @objc func scaleView(_ gesture: UIPinchGestureRecognizer) {
        guard let view = gesture.view, view.superview != nil else { return }

        view.transform = view.transform.scaledBy(
            x: gesture.scale,
            y: gesture.scale
        )
        gesture.scale = 1.0
    }
}
