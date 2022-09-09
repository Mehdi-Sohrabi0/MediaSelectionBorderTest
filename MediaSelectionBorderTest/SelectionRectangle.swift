//
//  SelectionRectangle.swift
//  MediaSelectionBorderTest
//
//  Created by Mehdi Sohrabi on 9/9/22.
//

import UIKit

protocol SelectionRectangleDelegate: AnyObject {
    func onCenterChanged(_ center: CGPoint)
    func onTransformationChanged(_ transform: CGAffineTransform)
}


final class SelectionRectangle: UIView {
    weak var delegate: SelectionRectangleDelegate?
    private let panPlugin: PanPlugin
    private let scalePlugin: ScalePlugin
    
    override var center: CGPoint {
        didSet {
            delegate?.onCenterChanged(center)
        }
    }
    
    override var transform: CGAffineTransform {
        didSet {
            delegate?.onTransformationChanged(transform)
        }
    }
    
    override init(frame: CGRect) {
        panPlugin = PanPlugin()
        scalePlugin = ScalePlugin()

        super.init(frame: frame)
        
        backgroundColor = .clear
        layer.borderWidth = 4
        layer.borderColor = UIColor.blue.cgColor
        
        
        panPlugin.attach(self)
        scalePlugin.attach(self)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
