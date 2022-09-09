//
//  Border.swift
//  MediaSelectionBorderTest
//
//  Created by Mehdi Sohrabi on 9/9/22.
//

import UIKit

protocol BorderViewDelegate: AnyObject {
    func onCenterChanged(_ center: CGPoint)
    func onScaleChanged(_ scale: Double)
}

final class BorderView: UIView {
    weak var delegate: BorderViewDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .clear
        layer.borderWidth = 4
        layer.borderColor = UIColor.blue.cgColor
        
        addPanGesture(self)
        addScaleGesture(self)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addPanGesture(_ view: UIView) {
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
//        DispatchQueue.main.async {
            view.center = newCenter
            print("parent: \(Date().timeIntervalSince1970)")
            self.delegate?.onCenterChanged(newCenter)
//        }
        
        
        gesture.setTranslation(.zero, in: superview)
    }
    
    func addScaleGesture(_ view: UIView) {
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
        delegate?.onScaleChanged(gesture.scale)
        gesture.scale = 1.0
    }

}

final class BorderLessView: UIView, BorderViewDelegate {
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor  = .red
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func onCenterChanged(_ center: CGPoint) {
        self.center = center
        print("child: \(Date().timeIntervalSince1970)")
    }
    
    func onScaleChanged(_ scale: Double) {
        transform =  transform.scaledBy(
            x: scale,
            y: scale
        )
    }
}

