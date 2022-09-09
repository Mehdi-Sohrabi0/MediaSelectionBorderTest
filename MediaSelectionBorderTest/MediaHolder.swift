//
//  MediaHolder.swift
//  MediaSelectionBorderTest
//
//  Created by Mehdi Sohrabi on 9/9/22.
//

import UIKit

final class MediaHolder {
    let view: MediaViewProtocol
    let selectionRect: SelectionRectangle
    
    init(frame: CGRect) {
        view = MediaView(frame: frame)
        selectionRect = SelectionRectangle(frame: frame)
        selectionRect.delegate = view
    }
}

