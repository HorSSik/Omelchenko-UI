//
//  NewViewController.swift
//  Square
//
//  Created by Student on 25.12.2018.
//  Copyright © 2018 IDAP. All rights reserved.
//

import UIKit

class NewViewController: UIViewController {
    
    public var squareView: LableView? {
        if self.isViewLoaded {
            return self.view as? LableView
        }
        
        return nil
    }

    @IBAction func onStart(_ sender: UIButton) {
        self.squareView.do { lableView in
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
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
