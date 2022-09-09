//
//  EditArea.swift
//  MediaSelectionBorderTest
//
//  Created by Mehdi Sohrabi on 9/9/22.
//

import UIKit

final class EditArea: UIView {
    let mediaEditArea: MediaEditArea
    let selectionEditArea: SelectionEditArea
    
    override init(frame: CGRect) {
        mediaEditArea = MediaEditArea(frame: frame)
        selectionEditArea = SelectionEditArea(frame: frame)
        
        super.init(frame: frame)

        addSubview(mediaEditArea)
        addSubview(selectionEditArea)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func attachMedia(_ mediaHolder: MediaHolder) {
        selectionEditArea.addSubview(mediaHolder.selectionRect)
        mediaEditArea.addSubview(mediaHolder.view)
    }
    
    func detachMedia(_ mediaHolder: MediaHolder) {
        mediaHolder.selectionRect.removeFromSuperview()
        mediaHolder.view.removeFromSuperview()
    }
}

final class MediaEditArea: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        clipsToBounds = true
        backgroundColor = .white
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

final class SelectionEditArea: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        clipsToBounds = false
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
