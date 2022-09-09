//
//  MediaView.swift
//  MediaSelectionBorderTest
//
//  Created by Mehdi Sohrabi on 9/9/22.
//

import UIKit

protocol MediaViewProtocol: UIView, SelectionRectangleDelegate {}

final class MediaView: UIView, MediaViewProtocol {
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .red
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func onCenterChanged(_ center: CGPoint) {
        self.center = center
    }
    
    func onTransformationChanged(_ transform: CGAffineTransform) {
        self.transform = transform
    }
}
