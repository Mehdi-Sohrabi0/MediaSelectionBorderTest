//
//  ViewController.swift
//  MediaSelectionBorderTest
//
//  Created by Mehdi Sohrabi on 9/9/22.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        view.backgroundColor = .gray
        
        setup()
    }

    func setup() {
        let editArea = EditArea(frame: CGRect(x: 0, y: 0, width: view.frame.width - 24, height: 200))
        view.addSubview(editArea)
        editArea.center = view.center
        
        let media1 = MediaHolder(frame: CGRect(x: 20, y: 20, width: 100, height: 100))
        editArea.attachMedia(media1)
    }
}

