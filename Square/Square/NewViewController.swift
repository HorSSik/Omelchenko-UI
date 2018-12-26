//
//  NewViewController.swift
//  Square
//
//  Created by Student on 25.12.2018.
//  Copyright © 2018 IDAP. All rights reserved.
//

import UIKit

class NewViewController: UIViewController {

    @IBOutlet var lableView: LableView!
    
    @IBAction func click(_ sender: UIButton) {
        let lableView = self.lableView!
        
        lableView.lable.isCancelled.toggle()
        if lableView.lable.isCancelled && !lableView.lable.isMoving {
            lableView.moveSquare(with: lableView.lable.durationAnimate, animated: lableView.lable.isAnimated)
            lableView.setDesignForButton(
                sender: sender,
                backgroundColor: .red,
                titleText: "STOP",
                titleColor: .black
            )
        } else {
            lableView.setDesignForButton(
                sender: sender,
                backgroundColor: .green,
                titleText: "START",
                titleColor: .red
            )
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
