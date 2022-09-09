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
        
        setup2()
    }

    
    private func setup() {
        let editArea = EditAreaView1234(frame: CGRect(x: 12, y: 250, width: 350, height: 200))
        editArea.clipsToBounds = true
        view.addSubview(editArea)
        
        let editAreaBorder = EditAreaView1234(frame: CGRect(x: 12, y: 250, width: 350, height: 200))
        editAreaBorder.backgroundColor = .clear
//        editAreaBorder.isUserInteractionEnabled = false
        editAreaBorder.clipsToBounds = false
        view.addSubview(editAreaBorder)
        
        let initialFrame = CGRect(x: 20, y: 20, width: 100, height: 100)
        let borderlessView = BorderLessView(frame: initialFrame)
        let borderView = BorderView(frame: initialFrame)
        borderView.delegate = borderlessView
        editArea.addSubview(borderlessView)
        editAreaBorder.addSubview(borderView)
    }
    
    func setup2() {
        let editArea = EditArea(frame: CGRect(x: 0, y: 0, width: view.frame.width - 24, height: 200))
        view.addSubview(editArea)
        editArea.center = view.center
        
        let media1 = MediaHolder(frame: CGRect(x: 20, y: 20, width: 100, height: 100))
        editArea.attachMedia(media1)
    }

}

