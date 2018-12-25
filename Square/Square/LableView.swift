//
//  LableView.swift
//  actionsSquare
//
//  Created by Student on 25.12.2018.
//  Copyright © 2018 IDAP. All rights reserved.
//

import UIKit

class LableView: UIView {
    
    @IBOutlet var lable: SquareAnimate?
    
    @IBAction func click(_ sender: UIButton) {
        if let lable = lable {
            self.checkState(sender, lable: lable)
        }
    }
    
    private var isCancelled = false
    private var isMoving = false
    
    private func moveSquare() {
        guard let lable = self.lable else { return }
        
        var position = lable.frame.origin
        
        switch lable.squarePosition {
        case .left:
            position = lable.rightPoint
            lable.myPosition = .right
        case .right:
            position = lable.rightDownPoint
            lable.myPosition = .rightDown
        case .rightDown:
            position = lable.leftDownPoint
            lable.myPosition = .leftDown
        case .leftDown:
            position = lable.leftPoint
            lable.myPosition = .left
        }
        
        UIView.animate(
            withDuration: 2,
            animations: {
                lable.frame.origin = position
                self.isMoving = true
            },
            completion: {_ in
            if self.isCancelled {
                self.moveSquare()
            } else {
                self.isMoving = false
            }
        })
    }
    
    func checkState(_ sender: UIButton, lable: UILabel?) {
        self.isCancelled.toggle()
        if self.isCancelled && !isMoving {
            self.moveSquare()
            self.lable?.setDesignForButton(
                sender: sender,
                backgroundColor: .red,
                titleText: "STOP",
                titleColor: .black
            )
        } else {
            self.lable?.setDesignForButton(
                sender: sender,
                backgroundColor: .green,
                titleText: "START",
                titleColor: .red
            )
        }
    }
}
